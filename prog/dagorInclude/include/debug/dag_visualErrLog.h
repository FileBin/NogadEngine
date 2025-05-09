//
// Dagor Engine 6.5
// Copyright (C) Gaijin Games KFT.  All rights reserved.
//
#pragma once

void visual_err_log_setup(bool red_window);
inline void visual_err_log_setup_dev_only(bool red_window)
{
#if DAGOR_DBGLEVEL > 0
  visual_err_log_setup(red_window);
#endif
  (void)red_window;
}
void visual_err_log_check_any();
