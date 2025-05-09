//
// Dagor Engine 6.5
// Copyright (C) Gaijin Games KFT.  All rights reserved.
//
#pragma once

#include <util/dag_stdint.h>
#include <string.h>
#include <osApiWrappers/dag_miscApi.h>

enum WatchdogFlags
{
  WATCHDOG_IGNORE_BACKGROUND = 1, // keep working in background mode (i.e. if window in background)
  WATCHDOG_IGNORE_DEBUGGER = 2,   // keep working even if debugger active
  WATCHDOG_DISABLED = 4,          // do not perform watchdog checks
  WATCHDOG_NO_FATAL = 8,          // do not fatal on timeout, just dump stacks to log
  WATCHDOG_SWAP_HANDICAP = 16
};

enum WatchdogOptions
{
  WATCHDOG_OPTION_TRIG_THRESHOLD,       // if 0 - disable watchdog, return old value on set
  WATCHDOG_OPTION_CALLSTACKS_THRESHOLD, // set callstacks dump threshold, return old value on set
  WATCHDOG_OPTION_SLEEP,                // set watchdog thread sleep duration, return old value on set
  WATCHDOG_OPTION_DUMP_THREADS // if p1 is 1 then add p0 as interested thread id, if p1 is 0 remove the p0 from interested list
};

static constexpr int WATCHDOG_DISABLE = 0;

struct WatchdogConfig
{
  bool (*keep_sleeping_cb)();
  void (*on_freeze_cb)();
  int flags;
  int triggering_threshold_ms;
  int dump_threads_threshold_ms;
  int sleep_time_ms;
  WatchdogConfig() { memset(this, 0, sizeof(*this)); }
};

#include <supp/dag_define_KRNLIMP.h>
KRNLIMP void watchdog_init(WatchdogConfig *cfg = NULL);
KRNLIMP void watchdog_shutdown();
KRNLIMP void watchdog_kick();
KRNLIMP intptr_t watchdog_set_option(int option, intptr_t p0 = 0, intptr_t p1 = 0);
#if _TARGET_PC_WIN
KRNLIMP bool is_watchdog_thread(uintptr_t thread_id);
#endif
#include <supp/dag_undef_KRNLIMP.h>

class ScopeSetWatchdogCurrentThreadDump
{
public:
  ScopeSetWatchdogCurrentThreadDump() { watchdog_set_option(WATCHDOG_OPTION_DUMP_THREADS, get_current_thread_id(), 1); };
  ~ScopeSetWatchdogCurrentThreadDump() { watchdog_set_option(WATCHDOG_OPTION_DUMP_THREADS, get_current_thread_id(), 0); };
};

class ScopeSetWatchdogTimeout
{
  int prevTmt;

public:
  ScopeSetWatchdogTimeout(int newtm) { prevTmt = watchdog_set_option(WATCHDOG_OPTION_TRIG_THRESHOLD, newtm); }
  ~ScopeSetWatchdogTimeout() { watchdog_set_option(WATCHDOG_OPTION_TRIG_THRESHOLD, prevTmt); }
};
