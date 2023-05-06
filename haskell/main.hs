import Menu
import Drawer

main:: IO()
main = do
  -- printMenu
  putStrLn ""
  mapM_ putStr (makeTextScreen [
    "escolha a cor do cabelo",
    " 1- preto          9- branco",
    " 2- cinza         10- cinza claro",
    " 3- vermelho      11- vermelho claro",
    " 4- verde         12- verde claro",
    " 5- amarelo       13- amarelo claro",
    " 6- azul          14- azul claro",
    " 7- magenta       15- magenta claro",
    " 8- ciano         16- ciano claro"
    ])
  mapM_ putStr (makeBattlefield ["yellow", "lightyellow", "blue", "green", "magenta"] (25, 80) 4 "edaBoss" [2, 13, 9, 1, 6] [13, 9])

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


