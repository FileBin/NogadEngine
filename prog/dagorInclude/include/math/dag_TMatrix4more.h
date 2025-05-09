//
// Dagor Engine 6.5
// Copyright (C) Gaijin Games KFT.  All rights reserved.
//
#pragma once

#include <math/dag_TMatrix4.h>

__forceinline void process_tm_for_drv_consts(TMatrix4 &gtm)
{
// instead of swapping in driver
#define SWAP(a, b) \
  _t = (a);        \
  (a) = (b);       \
  (b) = _t;
  float _t;
  SWAP(gtm(0, 1), gtm(1, 0));
  SWAP(gtm(0, 2), gtm(2, 0));
  SWAP(gtm(0, 3), gtm(3, 0));
  SWAP(gtm(1, 2), gtm(2, 1));
  SWAP(gtm(1, 3), gtm(3, 1));
  SWAP(gtm(2, 3), gtm(3, 2));
#undef SWAP
}

__forceinline TMatrix4_vec4 screen_to_tex_scale_tm_xy()
{
  return TMatrix4_vec4(0.5f, 0.0f, 0.0f, 0.0f, 0.0f, -0.5f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.5f, 0.5f, 0.0f, 1.0f);
}
__forceinline TMatrix4_vec4 screen_to_tex_scale_tm_xy(float texelOfsX, float texelOfsY)
{
  return TMatrix4_vec4(0.5f, 0.0f, 0.0f, 0.0f, 0.0f, -0.5f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.5f + texelOfsX, 0.5f + texelOfsY,
    0.0f, 1.0f);
}

__forceinline TMatrix4_vec4 screen_to_tex_scale_tm() { return screen_to_tex_scale_tm_xy(); }
__forceinline TMatrix4_vec4 screen_to_tex_scale_tm(float texelOfsX, float texelOfsY)
{
  return screen_to_tex_scale_tm_xy(texelOfsX, texelOfsY);
}
