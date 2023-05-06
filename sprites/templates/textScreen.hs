[
  "Parabens!",
  "Aproveite ao máximoa tod a experiência proporcionada no curso",
  "Você se tornará um grande cientista da computação",
]

["parabens!","aproveite ao maximo a toda experiencia proporcionada no curso","voce se tornara um grande cientista da computacao!"]


"parabens!\naproveite ao maximo toda a experiencia proporcionada no curso\nvoce se tornara um grande cientista da computacao"

"parabens!########################################################aproveite ao maximo toda a experiencia proporcionada no cursovoce se tornara um grande cientista da computacao##########"

"parabens!########################################################aproveite ao maximo toda a experiencia proporcionada no cursovoce se tornara um grande cientista#### da computacao##########"

parsedText = "Parabens!                            Aproveite ao maximo toda a experiencia proporcionada no curso             Você se tornará um grande cientista da computação         " 

37-9 = 28

37 - 38 `mod` 37 = 
37 - 

-- 37 caracteres por linha
-- 9 linhas




























infiniteText = take (37*9) (parsedText ++ cycle " ")

makeTextScreenContent:: [Char] -> Int -> [String]
makeTextScreenContent text 0 = ""
makeTextScreenContent text count = makeText (take 37 text) ++ makeTextScreenContent (text !! 37) (count-1)




handleBreakLines:: [Char] -> Int -> String
handleBreakLines (char: tail) count
  if char == "\n" then
    (cycleChar " " (37 - (count `mod` 37))) ++ handleBreakLines tail (count+(37 - (count `mod` 37)))
  else
    char ++ handleBreakLines tail (count+1)
  