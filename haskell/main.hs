import Menu
import Drawer

main:: IO()
main = do
  printMenu
  putStrLn ""
  mapM_ putStr (makeBattlefield ["yellow", "lightyellow", "blue", "green", "magenta"] 25 4 "edaBoss" [2, 13, 9, 1, 6] [13, 9])


-- [hair, skin, tshirt, pants, boots]

-- o main mostrara a sequencia da historia do jogo
-- printmenu (EM DESENVOLVIMENTO)
-- fubicaStory
-- fubicaBattle
-- daltonStory
-- daltonBattle
-- jaStory
-- jaBattle
-- evertonStory
-- evertonBattle
-- endGame

-- cada funcao dessa sera do tipo IO e serae um loop que vai gerenciar as entradas e printara
-- as interfaces com o makeBattlefield e o makeText.


