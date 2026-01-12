import { Mode, SlideType, SlideDef, ModeCopy, QuizItem } from '../model/TrainingTypes'

function example(word: string, font: Color, answer: string): SlideDef {
  return {
    type: SlideType.EXAMPLE,
    word,
    fontColor: font,
    answerText: answer
  }
}

function question(word: string, font: Color, wrong: string, correct: string): SlideDef {
  return {
    type: SlideType.MISTAKE,
    word,
    fontColor: font,
    wrong,
    correct
  }
}

function text(title: string, body: string): SlideDef {
  return { type: SlideType.TEXT, title, body }
}

function easyCopy(): ModeCopy {
  const slides: SlideDef[] = [
    text('Easy Mode', 'Read the word. Select the color it MEANS.\nIgnore the font color.'),
    text('Why?', 'Because only the MEANING matters in this mode.'),
    example('BLUE', Color.Red, 'BLUE'),
    example('GREEN', Color.Yellow, 'GREEN'),
    question('RED', Color.Green, 'GREEN', 'RED')
  ]
  const quiz: QuizItem[] = [
    {
      word: 'BLUE',
      fontColor: Color.Red,
      options: ['GREEN', 'BLUE'],
      correct: 'BLUE'
    },
    {
      word: 'YELLOW',
      fontColor: Color.Green,
      options: ['RED', 'YELLOW'],
      correct: 'YELLOW'
    }
  ]
  return {
    title: 'Easy Mode',
    rule: 'Select the MEANING of the word. Ignore the font color.',
    slides,
    quiz,
    passNeed: 2
  }
}

function mediumCopy(): ModeCopy {
  const slides: SlideDef[] = [
    text('Medium Mode', 'Look at the FONT COLOR, ignore the text meaning.'),
    text('Why?', 'Because only the font color counts here.'),
    example('RED', Color.Green, 'GREEN'),
    example('BLUE', Color.Yellow, 'YELLOW'),
    question('GREEN', Color.Red, 'GREEN', 'RED')
  ]
  const quiz: QuizItem[] = [
    {
      word: 'RED',
      fontColor: Color.Green,
      options: ['RED', 'GREEN'],
      correct: 'GREEN'
    },
    {
      word: 'BLUE',
      fontColor: Color.Yellow,
      options: ['BLUE', 'YELLOW'],
      correct: 'YELLOW'
    }
  ]
  return {
    title: 'Medium Mode',
    rule: 'Select the FONT COLOR. Ignore the text.',
    slides,
    quiz,
    passNeed: 2
  }
}

function hardCopy(): ModeCopy {
  const slides: SlideDef[] = [
    text('Hard Mode', 'Two options. Find the word meaning, then tap NOT that option.'),
    text('Why hard?', 'The twist is about going against the instinct.'),
    example('BLUE', Color.Black, 'RED (NOT meaning)'),
    example('GREEN', Color.Black, 'YELLOW (NOT meaning)'),
    question('RED', Color.Black, 'RED (meaning)', 'BLUE (NOT meaning)')
  ]
  const quiz: QuizItem[] = [
    {
      word: 'BLUE',
      fontColor: Color.White,
      options: ['BLUE', 'RED'],
      correct: 'RED'
    },
    {
      word: 'GREEN',
      fontColor: Color.White,
      options: ['GREEN', 'YELLOW'],
      correct: 'YELLOW'
    }
  ]
  return {
    title: 'Hard Mode',
    rule: 'Find meaning, select NOT that.',
    slides,
    quiz,
    passNeed: 2
  }
}

function expertCopy(): ModeCopy {
  const slides: SlideDef[] = [
    text('Expert Mode', 'Follow the ICON!\n📝 = meaning, 🎨 = font color.'),
    text('Why icon?', 'Icons add challenge: check 📝 or 🎨 every time.'),
    example('BLUE 📝', Color.Red, 'BLUE (meaning)'),
    example('RED 🎨', Color.Green, 'GREEN (font color)'),
    question('Mixed', Color.Yellow, 'Follow one rule blindly', 'Always check the icon')
  ]
  const quiz: QuizItem[] = [
    {
      word: 'BLUE',
      fontColor: Color.Red,
      options: ['GREEN', 'BLUE'],
      correct: 'BLUE',
      icon: 'meaning'
    },
    {
      word: 'RED',
      fontColor: Color.Green,
      options: ['RED', 'GREEN'],
      correct: 'GREEN',
      icon: 'color'
    }
  ]
  return {
    title: 'Expert Mode',
    rule: 'Icon decides: 📝 meaning, 🎨 font color.',
    slides,
    quiz,
    passNeed: 2
  }
}

export function getModeCopy(mode: number): ModeCopy {
  if (mode === Mode.MEDIUM) {
    return mediumCopy()
  }
  if (mode === Mode.HARD) {
    return hardCopy()
  }
  if (mode === Mode.EXPERT) {
    return expertCopy()
  }
  return easyCopy()
}
