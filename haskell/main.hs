import Battle
import Drawer
import Menu
import Stories

main :: IO ()
main = do
  -- o main mostrara a sequencia da historia do jogo
  printMenu
  customColors <- customizeCharacter
  let mappedColors = map getColor customColors

  -- fubicaBattle
  fubicaStory
  let state =
        BattleState
          { playerColors = mappedColors,
            playerLife = 100,
            playerEnergy = 100,
            bossLife = 100,
            bossEnergy = 100,
            boss = "admBoss",
            playerCards = [0, 0, 0, 0, 0],
            currentCards = [0, 0],
            difficulty = (1, 5)
          }
  battle state

  -- daltonBattle ["yellow", "lightyellow", "blue", "green", "magenta"]
  daltonStory
  let state =
        BattleState
          { playerColors = mappedColors,
            playerLife = 100,
            playerEnergy = 100,
            bossLife = 100,
            bossEnergy = 100,
            boss = "p1Boss",
            playerCards = [0, 0, 0, 0, 0],
            currentCards = [0, 0],
            difficulty = (3, 7)
          }
  battle state

  -- gaudencioBattle
  gaudencioStory
  let state =
        BattleState
          { playerColors = mappedColors,
            playerLife = 100,
            playerEnergy = 100,
            bossLife = 100,
            bossEnergy = 100,
            boss = "p2Boss",
            playerCards = [0, 0, 0, 0, 0],
            currentCards = [0, 0],
            difficulty = (3, 8)
          }
  battle state

  -- jaBattle
  jaStory
  let state =
        BattleState
          { playerColors = mappedColors,
            playerLife = 100,
            playerEnergy = 100,
            bossLife = 100,
            bossEnergy = 100,
            boss = "edaBoss",
            playerCards = [0, 0, 0, 0, 0],
            currentCards = [0, 0],
            difficulty = (4, 10)
          }
  battle state

  -- evertonBattle
  evertonStory
  let state =
        BattleState
          { playerColors = mappedColors,
            playerLife = 100,
            playerEnergy = 100,
            bossLife = 100,
            bossEnergy = 100,
            boss = "plpBoss",
            playerCards = [0, 0, 0, 0, 0],
            currentCards = [0, 0],
            difficulty = (6, 10)
          }
  battle state

-- endGame

-- mapM_ putStr (makeText "prepare-se. o sapato eh amalero!?")

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
