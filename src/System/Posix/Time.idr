module System.Posix.Time

%include C "time_wrappers.c"

Time : Type
Time = Bits64

time : IO Time
time = foreign FFI_C "idris_posix_time" (IO Time)

strftime : String -> Time -> IO String
strftime s = foreign FFI_C "idris_posix_strftime" (String -> Time -> IO String) s
