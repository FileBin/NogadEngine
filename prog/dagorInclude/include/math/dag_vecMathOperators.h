//
// Dagor Engine 6.5
// Copyright (C) Gaijin Games KFT.  All rights reserved.
//
#pragma once

#include <vecmath/dag_vecMath.h>

__forceinline vec4f operator+(vec4f lhs, vec4f rhs) { return v_add(lhs, rhs); }

__forceinline vec4f operator-(vec4f lhs, vec4f rhs) { return v_sub(lhs, rhs); }

__forceinline vec4f operator*(vec4f lhs, vec4f rhs) { return v_mul(lhs, rhs); }

__forceinline vec4f operator/(vec4f lhs, vec4f rhs) { return v_div(lhs, rhs); }

__forceinline vec4f operator&(vec4f lhs, vec4f rhs) { return v_and(lhs, rhs); }

__forceinline vec4f operator|(vec4f lhs, vec4f rhs) { return v_or(lhs, rhs); }

__forceinline vec4f operator^(vec4f lhs, vec4f rhs) { return v_xor(lhs, rhs); }
