import Menu
import Drawer

main:: IO()
main = do
  -- printMenu
  -- drawing battlefield:
  mapM_ putStr (makeHealthBarLines [1,2] (makeSpaces 20))
  mapM_ putStr (makeCharacterLines ["mainCharacter", "edaBoss"] (makeSpaces 56))
  mapM_ putStr (makeCardLines [2,3,4,5,6] (makeSpaces 3))
  print ""
  mapM_ putStr (makeCharLines "prepare se a batalha esta pr" (makeSpaces 1))
  print ""
  mapM_ putStr (makeCharLines "estes a comecar" (makeSpaces 1))
