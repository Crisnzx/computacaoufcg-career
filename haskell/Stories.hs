module Stories (fubicaStory, gaudencioStory, daltonStory, jaStory, evertonStory) where
import Drawer
import IOHelpers

fubicaStory:: IO()
fubicaStory = do
  printTextScreen ["parabens! voce foi aprovado no curso de computacao da ufcg no sisu 2023.1", "aproveite ao maximo toda experiencia", "proporcionada no curso", "dessa forma temos certeza que", "voce se tornara", "um grande cientista da computacao", "com uma qualificacao altamente acima da media do mercado!!"]
  onEnterContinue

  printTextScreen [
    "antes de iniciar o primeiro periodo",
    "precisamos conhecer",
    "",
    "o coordenador fubica..."
    ]
  onEnterContinue
  printTextScreen [
    "criar uma historia sobre a necessidade de ler o guia",
    "apos isso a batalha contra fubica comeca"
    ]

daltonStory:: IO()
daltonStory = do
  printTextScreen [
    "agora no primeiro periodo voce vai pagar p1 com dalton",
    "",
    "",
    "dalton vai lhe ensinar algoritmos em python"
    ]
  onEnterContinue
  printTextScreen [
    "criar uma historia sobre p1 no primeiro periodo",
    "apos isso a batalha contra dalton comeca"
    ]

gaudencioStory:: IO()
gaudencioStory = do
  printTextScreen [
    "parabens por ter sido aprovado em p1!",
    "",
    "agora voce ira aprender programacao orientada a objetos em java"
    ]
  onEnterContinue
  printTextScreen [
    "criar uma historia sobre p2 no segundo periodo",
    "apos isso a batalha contra gaudencio comeca"
    ]

jaStory:: IO()
jaStory = do
  printTextScreen [
    "agora voce vai aprender estrutura de dados com joao artur",
    "",
    "aproveite o material online que ele produziu pois vai lhe ajudar bastante"
    ]
  onEnterContinue
  printTextScreen [
    "criar uma historia sobre eda no terceiro periodo",
    "apos isso a batalha contra joao artur comeca"
    ]

evertonStory:: IO()
evertonStory = do
  printTextScreen [
    "show, chegou a hora de aprender outros paradigmas alem do orientado a objetos e o imperativo",
    "e hora de aprender com o professor everton dois novos paradigmas",
    "funcional e logico"
    ]
  onEnterContinue
  printTextScreen [
    "criar uma historia sobre plp no quarto periodo",
    "apos isso a batalha contra everton comeca"
    ]
