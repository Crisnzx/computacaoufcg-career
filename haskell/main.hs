import Menu
import Drawer

main:: IO()
main = do
  -- printMenu
  mapM_ putStr (makeHealthBarLines [1,2] makeSpaces 20)
