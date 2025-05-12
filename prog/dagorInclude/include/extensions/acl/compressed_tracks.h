#include <acl/core/compressed_tracks.h>

constexpr bool acl_impl_is_constant_bit_rate(uint32_t bit_rate) { return bit_rate == 0; }

inline bool acl_compressed_tracks_is_animated(const acl::compressed_tracks *self, uint32_t track_index)
{
  using namespace acl;
  const acl_impl::tracks_header &header = acl_impl::get_tracks_header(*self);
  const uint32_t num_tracks = header.num_tracks;
  if (num_tracks == 0)
    return false; // Empty track list

  ACL_ASSERT(track_index < header.num_tracks, "Invalid track index");
  if (track_index >= header.num_tracks)
    return false; // Invalid track index

  if (header.track_type == track_type8::qvvf)
  {
    const uint32_t has_scale = header.get_has_scale();

    const acl_impl::packed_sub_track_types *sub_track_types = acl_impl::get_transform_tracks_header(*self).get_sub_track_types();
    const uint32_t num_sub_track_entries =
      (num_tracks + acl_impl::k_num_sub_tracks_per_packed_entry - 1) / acl_impl::k_num_sub_tracks_per_packed_entry;

    const acl_impl::packed_sub_track_types *rotation_sub_track_types = sub_track_types;
    const acl_impl::packed_sub_track_types *translation_sub_track_types = rotation_sub_track_types + num_sub_track_entries;

    // If we have no scale, we'll load the rotation sub-track types and mask it out to avoid branching, forcing it to be the default
    // value
    const acl_impl::packed_sub_track_types *scale_sub_track_types =
      has_scale ? (translation_sub_track_types + num_sub_track_entries) : sub_track_types;

    // Build a mask to strip out the scale sub-track types if we have no scale present
    // has_scale is either 0 or 1, negating yields 0 (0x00000000) or -1 (0xFFFFFFFF)
    // Equivalent to: has_scale ? 0xFFFFFFFF : 0x00000000
    const uint32_t scale_sub_track_mask = static_cast<uint32_t>(-int32_t(has_scale));

    const uint32_t sub_track_entry_index = track_index / 16;
    const uint32_t packed_index = track_index % 16;

    // Shift our sub-track types so that the sub-track we care about ends up in the LSB position
    const uint32_t packed_shift = (15 - packed_index) * 2;

    const uint32_t rotation_sub_track_type = (rotation_sub_track_types[sub_track_entry_index].types >> packed_shift) & 0x3;
    const uint32_t translation_sub_track_type = (translation_sub_track_types[sub_track_entry_index].types >> packed_shift) & 0x3;
    const uint32_t scale_sub_track_type =
      scale_sub_track_mask & (scale_sub_track_types[sub_track_entry_index].types >> packed_shift) & 0x3;

    // Combine all three so we can quickly test if all are default and if any are constant/animated
    const uint32_t combined_sub_track_type = rotation_sub_track_type | translation_sub_track_type | scale_sub_track_type;
    return (combined_sub_track_type & 2) != 0;
  }
  else
  {
    const acl_impl::scalar_tracks_header &scalars_header = acl_impl::get_scalar_tracks_header(*self);
    const acl_impl::track_metadata *per_track_metadata = scalars_header.get_track_metadata();
    return !acl_impl_is_constant_bit_rate(per_track_metadata[track_index].bit_rate);
  }
}