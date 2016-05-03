module System.Posix.Syslog

%include C "syslog_wrappers.c"

%access export

||| Close the descriptor used to write to the system logger
close_log : IO ()
close_log = foreign FFI_C "closelog" (IO ()) 

||| Open system logger, prepending @ident to every message subsequently issued by syslog
|||
||| @ident    - message prefix
||| @option   - bitwise OR of options
||| @facility - type of program/messages that are being logged (default value if not specified in calls to log)
open_log : (ident : String) -> (option : Int) -> (facility : Int) -> IO ()
open_log ident option facility = foreign FFI_C "openlog" (String -> Int -> Int -> IO ()) ident option facility

||| Write a message to the system logger
|||
||| @priority - bitwise OR of facility and level
||| @message  - message to log. %m within the string gets replaced by the error message string interpretation of errno
log : (priority : Int) -> (message : String) -> IO ()
log priority message = foreign FFI_C "syslog" (Int -> String -> IO ()) priority message
-- Options follow

||| Include Process ID with each message.
LOG_PID : Int
LOG_PID = 1

||| Write directly to system console if there is an error while sending to system logger.
LOG_CONS : Int
LOG_CONS = 2

||| Open the connection immediately (normally, the connection is opened when the first message is logged).
LOG_NDELAY : Int
LOG_NDELAY = 8

||| Default - converse of LOG_NDELAY
LOG_ODELAY : Int
LOG_ODELAY = 4

||| Don't wait for child processes that may have been created while logging the message. (The GNU C library does not create a child process, so this option has no effect on Linux.)
LOG_NOWAIT : Int
LOG_NOWAIT = 16

||| (Not in POSIX.1-2001 or POSIX.1-2008.) Print to stderr as well.
LOG_PERROR : Int
LOG_PERROR = 32

-- Facilities follow

||| security/authorization messages
LOG_AUTH : Int
LOG_AUTH = 32

||| security/authorization messages (private)
LOG_AUTHPRIV : Int
LOG_AUTHPRIV = 80

||| clock daemon (cron and at)
LOG_CRON : Int
LOG_CRON = 72

||| system daemons without separate facility value
LOG_DAEMON : Int
LOG_DAEMON = 24

||| ftp daemon
LOG_FTP : Int
LOG_FTP = 88

||| kernel messages (these can't be generated from user processes)
LOG_KERN : Int
LOG_KERN = 0

||| reserved for local use
LOG_LOCAL0 : Int
LOG_LOCAL0 = 128

||| reserved for local use
LOG_LOCAL1 : Int
LOG_LOCAL1 = 136

||| reserved for local use
LOG_LOCAL2 : Int
LOG_LOCAL2 = 144

||| reserved for local use
LOG_LOCAL3 : Int
LOG_LOCAL3 = 152

||| reserved for local use
LOG_LOCAL4 : Int
LOG_LOCAL4 = 160

||| reserved for local use
LOG_LOCAL5 : Int
LOG_LOCAL5 = 168

||| reserved for local use
LOG_LOCAL6 : Int
LOG_LOCAL6 = 176

||| reserved for local use
LOG_LOCAL7 : Int
LOG_LOCAL7 = 184

||| line printer subsystem
LOG_LPR : Int
LOG_LPR = 48

||| mail subsystem
LOG_MAIL : Int
LOG_MAIL = 16

||| USENET news subsystem
LOG_NEWS : Int
LOG_NEWS = 56

||| messages generated internally by syslogd(8)
LOG_SYSLOG : Int
LOG_SYSLOG = 40

||| generic user-level messages (default)
LOG_USER : Int
LOG_USER = 8

||| UUCP subsystem
LOG_UUCP : Int
LOG_UUCP = 64

-- Levels follow

||| system is unusable
LOG_EMERG : Int
LOG_EMERG = 0

||| action must be taken immediately
LOG_ALERT : Int
LOG_ALERT = 1

||| critical conditions
LOG_CRIT : Int
LOG_CRIT = 2

||| error conditions
LOG_ERR : Int
LOG_ERR = 3

||| warning conditions
LOG_WARNING : Int
LOG_WARNING = 4

||| normal, but significant, condition
LOG_NOTICE : Int
LOG_NOTICE = 5

||| informational message
LOG_INFO : Int
LOG_INFO = 6

||| debug-level message
LOG_DEBUG : Int
LOG_DEBUG = 7

