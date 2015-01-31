module System.Posix.Directory

%include C "dirent-accessors.c"

opendir : String -> IO Ptr
opendir s = mkForeign (FFun "opendir" [FString] FPtr) s

closedir : Ptr -> IO ()
closedir p = mkForeign (FFun "closedir" [FPtr] FUnit) p

readdir : Ptr -> IO Ptr
readdir p = mkForeign (FFun "readdir" [FPtr] FPtr) p

dirent_d_name : Ptr -> IO String
dirent_d_name p = mkForeign (FFun "idris_posix_dirent_d_name" [FPtr] FString) p

getDirectoryContents : String -> IO (List String)
getDirectoryContents s = do
    d <- opendir s
    c <- f d []
    closedir d
    return (reverse c)
  where f : Ptr -> List String -> IO (List String)
        f d xs = do
            c <- readdir d
            n <- nullPtr c
            if n
            then return xs
            else do
              n <- dirent_d_name c
              f d (n :: xs)

doesFileExist : String -> IO Bool
doesFileExist s = map (/= 0) (mkForeign (FFun "idris_posix_is_file" [FString] FInt) s)

doesDirectoryExist : String -> IO Bool
doesDirectoryExist s = map (/= 0) (mkForeign (FFun "idris_posix_is_directory" [FString] FInt) s)
