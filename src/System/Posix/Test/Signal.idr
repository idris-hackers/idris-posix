||| Tests for System.Posix.Signal
module System.Posix.Test.Signal

import System.Posix.Signal
import System

my_handler : Signal_handler
my_handler sig_num = unsafePerformIO $ do
  putStrLn $ "Signal handler running after receiving signal number " ++ (show sig_num)
  
my_handler_wrapper : IO Ptr
my_handler_wrapper = foreign FFI_C "%wrapper" ((CFnPtr Signal_handler) -> IO Ptr)
                        (MkCFnPtr my_handler)
  
export
test_install_handler : IO ()
test_install_handler = do
  rc <- install_signal_handler SIGINT my_handler_wrapper
  putStrLn "Now press Ctrl-C to interrupt"
  usleep 100000000
  putStrLn "Test completed. Did you see a message indicating signal 2 was handled?"

