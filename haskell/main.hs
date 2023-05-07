import Menu
import Drawer
import Stories

main:: IO()
main = do
  -- o main mostrara a sequencia da historia do jogo
  printMenu
  fubicaStory
  -- fubicaBattle
  daltonStory
  -- daltonBattle
  gaudencioStory
  -- gaudencioBattle
  jaStory
  -- jaBattle
  evertonStory
  -- evertonBattle
  -- endGame
  





-- mapM_ putStr (makeBattlefield ["yellow", "lightyellow", "blue", "green", "magenta"] (25, 80) 4 "edaBoss" [2, 13, 9, 1, 6] [13, 9])

-- a lista de cores precisa ter tamanho 5 e as cores serão mapeadas nessa ordem: [hair, skin, tshirt, pants, boots]
-- as cores possíveis são: 
-- "black"
-- "red"
-- "green"
-- "yellow"
-- "blue"
-- "magenta"
-- "cyan"
-- "white"
-- "gray"
-- "lightred"
-- "lightgreen"
-- "lightyellow"
-- "lightblue"
-- "lightmagenta"
-- "lightcyan"
-- "lightgray"
