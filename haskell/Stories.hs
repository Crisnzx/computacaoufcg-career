module Stories (fubicaStory, gaudencioStory, daltonStory, jaStory, evertonStory) where
import Drawer
import IOHelpers

fubicaStory:: IO()
fubicaStory = do
  printTextScreen [
    "saudacoes, estudante!",
    "o seu primeiro desafio sera derrotar",
    "o temido coordenador fubica",
    "no periodo de matriculas ele vira",
    "uma fera, para evitar isso voce deve",
    "ler o guia com muita atencao.",
    "portanto, caso queira continuar vivo",
    "nao mande emails com perguntas ja",
    "respondidas no guia. eh serio."
    ]
  onEnterContinue

daltonStory:: IO()
daltonStory = do
  printTextScreen [
    "apos derrotar fubica e se matricular",
    "nas cadeiras do p1, voce lutara com",
    "o lendario e grande professor dalton",
    "também conhecido como rei do python.",
    "nao se assuste, voce tem uma chance",
    "de derrota-lo, nao desperdice-a.",
    "voce tem sorte que nem wilkerson e",
    "nem jorge estao nessa batalha."
    ]
  onEnterContinue
  printTextScreen [
    "eh bom voce lembrar que p1 e lp1 sao",
    "cadeiras muito importantes, preste",
    "muita atencao nas aulas e se dedique",
    "muito. responda muitas questoes do",
    "site da cadeira e abuse do tst.",
    "p1 eh apenas a porta para o mundo da",
    "programacao no nosso curso, voce",
    "ainda vera muitas coisas legais.",
    "mas chega de papo, hora de lutar!!!"
    ]
  onEnterContinue

gaudencioStory:: IO()
gaudencioStory = do
  printTextScreen [
    "parabens, voce conseguiu pagar p1!",
    "foi dificil derrotar dalton? hehehe.",
    "agora voce ira aprender programacao",
    "orientada a objetos em java. parece",
    "assustador, neh? mas eh bem legal.",
    "o grande boss daqui eh gaudencio,",
    "voce nao vai querer deixa-lo com",
    "raiva, use o modeligado para fazer",
    "seus diagramas de classe e estude mt."
    ]
  onEnterContinue
  printTextScreen [
    "depois voce vai aprender mais sobre,",
    "mas POO eh apenas um dos varios",
    "paradigmas das linguagens que usamos",
    "para programar. esse paradigma eh",
    "usado em varios contextos.",
    "portanto, entenda-o bem e se prepare",
    "para colocar a mao na massa nessa",
    "cadeira, faca todos os labs e voce",
    "se dara bem. agora... hora de lutar!!!"
    ]
  onEnterContinue

jaStory:: IO()
jaStory = do
  printTextScreen [
    "Eaii, gostou de POO? eh massa, neh?",
    "voce aprende muitas coisas em p2",
    "deve ter sido sensacional pra voce!!",
    "contudo, agora voce esta prestes a",
    "enfrentar o grande joao arthur, rei",
    "de todas estruturas de dados ja",
    "descobertas no mundo da computacao.",
    "mas nao se assuste, voce tem muito",
    "a aprender."
    ]
  onEnterContinue
  printTextScreen [
    "voce nunca se perguntou como um",
    "array ou como uma lista funcionam?",
    "tudo isso voce aprendera aqui. e sao",
    "coisas muito importantes, preste",
    "muita atencao nas aulas e use todo",
    "o material que joao arthur libera",
    "no github dele para voce estudar, la",
    "o assunto esta muito bem detalhado.",
    "entao... boa sorte nessa luta!!!"
    ]
  onEnterContinue

evertonStory:: IO()
evertonStory = do
  printTextScreen [
    "voce esta indo muito bem, mas agora",
    "chegou o momento de aprender mais",
    "dois paradigmas das linguagens de",
    "programacao. o funcional e o logico.",
    "voce vai aprender que nem tudo no",
    "mundo eh POO! e everton, o grande, o",
    "ajudara nessa jornada, voce precisa",
    "prestar muita atencao na aula, sao",
    "muitos conceitos novos a aprender."
    ]
  onEnterContinue
  printTextScreen [
    "voce tera que aprender duas novas",
    "linguagens de programacao nessa nova",
    "cadeira, haskell e prolog. vai ser",
    "puxado, mas vale a pena. faca os",
    "roteiros semanais das linguagens",
    "e responda muitas questoes desses",
    "paradigmas novos para fixar o",
    "conteudo. derrotar everton nao eh",
    "tarefa facil... boa sorte na luta!!!"
    ]
  onEnterContinue
