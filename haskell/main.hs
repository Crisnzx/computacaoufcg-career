import Menu
import Drawer

main:: IO()
main = do
  mapM_ putStr (makeTextScreen ["prepare-se. o sapato eh amalero!?"])
  -- mapM_ putStr (makeBattlefield 97 4 "plpBoss" [2, 13, 9, 1, 6] [13, 9])


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


