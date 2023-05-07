import Battle
import Drawer
import Menu
import Stories

main :: IO ()
main = do
  -- o main mostrara a sequencia da historia do jogo
  printMenu

  -- fubicaBattle
  fubicaStory
  let state =
        BattleState
          { playerColors = ["yellow", "lightyellow", "blue", "green", "magenta"],
            playerLife = 20,
            playerEnergy = 100,
            bossLife = 20,
            boss = "admBoss",
            playerCards = [6, 7, 5, 7, 8],
            currentCards = [0, 0],
            bossCards = [2, 2, 3, 2, 2]
          }
  battle state

  -- daltonBattle
  daltonStory
  let state =
        BattleState
          { playerColors = ["yellow", "lightyellow", "blue", "green", "magenta"],
            playerLife = 20,
            playerEnergy = 100,
            bossLife = 20,
            boss = "p1Boss",
            playerCards = [6, 7, 5, 7, 8],
            currentCards = [0, 0],
            bossCards = [5, 6, 5, 5, 6]
          }
  battle state

  -- gaudencioBattle
  gaudencioStory
  let state =
        BattleState
          { playerColors = ["yellow", "lightyellow", "blue", "green", "magenta"],
            playerLife = 20,
            playerEnergy = 100,
            bossLife = 20,
            boss = "p2Boss",
            playerCards = [6, 7, 5, 7, 8],
            currentCards = [0, 0],
            bossCards = [7, 8, 8, 7, 7]
          }
  battle state

  -- jaBattle
  jaStory
  let state =
        BattleState
          { playerColors = ["yellow", "lightyellow", "blue", "green", "magenta"],
            playerLife = 20,
            playerEnergy = 100,
            bossLife = 20,
            boss = "edaBoss",
            playerCards = [6, 7, 5, 7, 8],
            currentCards = [0, 0],
            bossCards = [9, 10, 9, 8, 10]
          }
  battle state

  -- evertonBattle
  evertonStory
  let state =
        BattleState
          { playerColors = ["yellow", "lightyellow", "blue", "green", "magenta"],
            playerLife = 20,
            playerEnergy = 100,
            bossLife = 20,
            boss = "plpBoss",
            playerCards = [6, 7, 5, 7, 8],
            currentCards = [0, 0],
            bossCards = [11, 13, 11, 11, 13]
          }
  battle state

-- endGame

-- mapM_ putStr (makeText "prepare-se. o sapato eh amalero!?")

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
