import { Mode, SlideType, SlideDef, ModeCopy, QuizItem } from '../model/TrainingTypes'

                                                                                                                                                                           function ex(word: string, font: Color, answer: string): SlideDef {
  return { type: SlideType.EXAMPLE, word, fontColor: font, answerText: answer }
}
function mis(word: string, font: Color, wrong: string, correct: string): SlideDef {
  return { type: SlideType.MISTAKE, word, fontColor: font, wrong, correct }
}
function txt(title: string, body: string): SlideDef {
  return { type: SlideType.TEXT, title, body }
}

function easyCopy(): ModeCopy {
  const slides: SlideDef[] = [
    txt('Easy Mode', 'Read the word. Select the color it MEANS.\nIgnore the font color.'),
    txt('Why?',       'Because only the MEANING matters in this mode.'),
    ex('BLUE',  Color.Red,    'BLUE'),
    ex('GREEN', Color.Yellow, 'GREEN'),
    mis('RED',  Color.Green,  'GREEN', 'RED'),
  ]
  const quiz: QuizItem[] = [
    { word: 'BLUE',   fontColor: Color.Red,   options: ['GREEN', 'BLUE'],  correct: 'BLUE' },
    { word: 'YELLOW', fontColor: Color.Green, options: ['RED',   'YELLOW'], correct: 'YELLOW' },
  ]
  return { title: 'Easy Mode', rule: 'Select the MEANING of the word. Ignore the font color.', slides, quiz, passNeed: 2 }
}

function mediumCopy(): ModeCopy {
  const slides: SlideDef[] = [
    txt('Medium Mode', 'Look at the FONT COLOR, ignore the text meaning.'),
    txt('Why?',        'Because only the font color counts here.'),
    ex('RED',  Color.Green,  'GREEN'),
    ex('BLUE', Color.Yellow, 'YELLOW'),
    mis('GREEN', Color.Red, 'GREEN', 'RED'),
  ]
  const quiz: QuizItem[] = [
    { word: 'RED',   fontColor: Color.Green,  options: ['RED','GREEN'],   correct: 'GREEN' },
    { word: 'BLUE',  fontColor: Color.Yellow, options: ['BLUE','YELLOW'], correct: 'YELLOW' },
  ]
  return { title: 'Medium Mode', rule: 'Select the FONT COLOR. Ignore the text.', slides, quiz, passNeed: 2 }
}

function hardCopy(): ModeCopy {
  const slides: SlideDef[] = [
    txt('Hard Mode', 'Two options. Find the word meaning, then tap NOT that option.'),
    txt('Why hard?', 'The twist is about going against the instinct.'),
    ex('BLUE',  Color.Black,  'RED (NOT meaning)'),
    ex('GREEN', Color.Black,  'YELLOW (NOT meaning)'),
    mis('RED',  Color.Black,  'RED (meaning)', 'BLUE (NOT meaning)'),
  ]
  const quiz: QuizItem[] = [
    { word: 'BLUE',  fontColor: Color.White, options: ['BLUE','RED'],    correct: 'RED' },
    { word: 'GREEN', fontColor: Color.White, options: ['GREEN','YELLOW'], correct: 'YELLOW' },
  ]
  return { title: 'Hard Mode', rule: 'Find meaning, select NOT that.', slides, quiz, passNeed: 2 }
}

function expertCopy(): ModeCopy {
  const slides: SlideDef[] = [
    txt('Expert Mode', 'Follow the ICON!\n📝 = meaning, 🎨 = font color.'),
    txt('Why icon?',   'Icons add challenge: check 📝 or 🎨 every time.'),
    ex('BLUE 📝', Color.Red,   'BLUE (meaning)'),
    ex('RED 🎨',  Color.Green, 'GREEN (font color)'),
    mis('Mixed',  Color.Yellow,'Follow one rule blindly', 'Always check the icon'),
  ]
  const quiz: QuizItem[] = [
    { word: 'BLUE', fontColor: Color.Red, options: ['GREEN','BLUE'], correct: 'BLUE', icon: 'meaning' },
    { word: 'RED', fontColor: Color.Green, options: ['RED','GREEN'], correct: 'GREEN', icon: 'color' }
  ]
  return { title: 'Expert Mode', rule: 'Icon decides: 📝 meaning, 🎨 font color.', slides, quiz, passNeed: 2 }
}

export function getModeCopy(mode: number): ModeCopy {
  if (mode === Mode.MEDIUM) return mediumCopy()
  if (mode === Mode.HARD)   return hardCopy()
  if (mode === Mode.EXPERT) return expertCopy()
  return easyCopy()
}
