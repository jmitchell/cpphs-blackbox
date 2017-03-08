import Control.Exception.Extra
import System.Time.Extra
import System.Process.Extra

main :: IO ()
main = do
  system_ "sudo apt-get update -y"
  system_ "sudo apt-get install -y darcs"
  system_ "darcs get http://code.haskell.org/cpphs"
  system_ "cd cpphs && darcs apply avoid-using-findfile_-ghc-7_4-doesn_t-include-it_.dpatch"
  system_ "pwd"
  system_ "cd cpphs && cabal update && cabal install && ghc --make cpphs -o cpphs && ./cpphs --version"
  putStrLn "Done"
