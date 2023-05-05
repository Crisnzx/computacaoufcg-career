import Battle
import Drawer
import Menu

main :: IO ()
main = do
  let state = BattleState {playerLife = 97, bossLife = 50, boss = "plpBoss", playerCards = [2, 13, 9, 1, 6], currentCards = [0, 0], bossCards = [2, 13, 9, 1, 6]}
  battle state

-- mapM_ putStr (makeText "prepare-se. o sapato eh amalero!?")

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
