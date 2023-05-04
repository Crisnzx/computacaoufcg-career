import Menu
import Drawer

main:: IO()
main = do
  mapM_ putStr (makeText "prepare-se a batalha sapato")
  mapM_ putStr (makeBattlefield 40 50 "edaBoss" [2, 13, 9, 1, 6] [13, 9])


-- corrigir as sprites de numero

-- o main mostrara a sequencia da historia do jogo
-- printmenu
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


