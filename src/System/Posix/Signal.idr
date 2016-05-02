module System.Posix.Signal

%include C "signal_wrappers.c"

||| Type of signal handlers
|||
||| The actual implementation should be of the form unsafePerformIO $ do ...
|||  if it needs to do any IO actions (as always for Idris functions used as C callbacks)
public export
Signal_handler : Type
Signal_handler = (sig_num : Int) -> ()

install_handler : Int -> Ptr -> IO Ptr
install_handler signum handler = foreign FFI_C "install_handler" (Int -> Ptr -> IO Ptr) signum handler

||| Install a new signal handler for @sig_num
|||
||| @sig_num - the signal to be handled
||| @handler - the wrapper for the Idris handler function (define as foreign FFI_C "%wrapper" ((CfnPtr Signal_handler) -> IO Ptr) (MkCFnPtr name-of-idris-routine)
||| Returns null on error and a pointer to the allocated struct sigaction on success
export
install_signal_handler : (sig_num : Int) -> (handler: IO Ptr) -> IO Ptr
install_signal_handler sig_num handler = do
  wr <- handler
  install_handler sig_num wr

export
SIGHUP : Int
SIGHUP = 1

export
SIGINT : Int
SIGINT = 2

export
SIGQUIT : Int
SIGQUIT = 3

export
SIGILL : Int
SIGILL = 4

export
SIGTRAP : Int
SIGTRAP = 5

export
SIGABORT : Int
SIGABORT = 6

export
SIGIOT : Int
SIGIOT = 6

export
SIGBUS : Int
SIGBUS = 7

export
SIGFPE : Int
SIGFPE = 8

export
SIGKILL : Int
SIGKILL = 9

export
SIGUSR1 : Int
SIGUSR1 = 10

export
SIGSEGV : Int
SIGSEGV = 11

export
SIGUSR2 : Int
SIGUSR2 = 12

export
SIGPIPE : Int
SIGPIPE = 13

export
SIGALRM : Int
SIGALRM = 14

export
SIGTERM : Int
SIGTERM = 15

export
SIGSTKFLT : Int
SIGSTKFLT = 16

export
SIGCHLD : Int
SIGCHLD = 17

export
SIGCLD : Int
SIGCLD = 17

export
SIGCONT : Int
SIGCONT = 18

export
SIGSTOP : Int
SIGSTOP = 19

export
SIGTSTP : Int
SIGTSTP = 20

export
SIGTTIN : Int
SIGTTIN = 21

export
SIGTTOU : Int
SIGTTOU = 22

export
SIGURG : Int
SIGURG = 23

export
SIGXCPU : Int
SIGXCPU = 24

export
SIGXFSZ : Int
SIGXFSZ = 25

export
SIGVTALRM : Int
SIGVTALRM = 26

export
SIGPROF : Int
SIGPROF = 27

export
SIGWINCH : Int
SIGWINCH = 28

export
SIGPOLL : Int
SIGPOLL = 29

export
SIGIO : Int
SIGIO = 29

export
SIGPWR : Int
SIGPWR = 30

export
SIGSYS : Int
SIGSYS = 31
