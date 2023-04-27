import Menu
import Drawer

main:: IO()
main = do
  -- printMenu
  mapM_ putStr (makeLines "char" "cristovao kenned e ismael lindos" "  ")
