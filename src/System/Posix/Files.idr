module System.Posix.Files

%include C "files_wrappers.c"

||| Checks if @file exists using access
export
fileExists : String -> IO Bool
fileExists path = map (/= 0) $ foreign FFI_C "idris_file_exists" (String -> IO Int) path

||| Creates a link from @old to @new
export
createLink : String -> String -> IO ()
createLink old new = foreign FFI_C "link" (String -> String -> IO Int) old new *> pure ()

||| Removes a link from @path
export
removeLink : String -> IO ()
removeLink path = foreign FFI_C "unlink" (String -> IO Int) path *> pure ()

||| Creates a symbolic named @path2 that contains @path1
export
createSymbolicLink : String -> String -> IO ()
createSymbolicLink path1 path2 = foreign FFI_C
                                 "symlink" (String -> String -> IO Unit) path1 path2

||| Changes the name of @old to @new
export
rename : String -> String -> IO ()
rename old new = foreign FFI_C "rename" (String -> String -> IO Int) old new *> pure ()
