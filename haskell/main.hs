import Battle
import Drawer
import Menu
import Stories

main :: IO ()
main = do
  printMenu
  customColors <- customizeCharacter
  let mappedColors = map getColor customColors

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
  endGame
