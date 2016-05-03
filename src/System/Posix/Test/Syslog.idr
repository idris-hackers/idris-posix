||| Tests for System.Posix.Syslog
module System.Posix.Test.Syslog

import System.Posix.Syslog

export
test_syslog : IO ()
test_syslog = do
  open_log "Idris test" (LOG_PID + LOG_CONS + LOG_PERROR) LOG_USER
  log LOG_INFO "This message should appear in syslog as well as on your console. Errno is currently %m"
  close_log
  
