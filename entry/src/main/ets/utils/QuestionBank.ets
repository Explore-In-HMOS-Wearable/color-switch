import { QuizItem } from '../model/TrainingTypes'
import { MODES_ENUMS } from '../viewmodel/Modes'
import { cryptoFramework } from '@kit.CryptoArchitectureKit';

export function shuffleCopy<T>(arr: T[]): T[] {
  const deck: T[] = arr.slice();
  const secureRandom = cryptoFramework.createRandom();

  for (let i = deck.length - 1; i > 0; i--) {
    const randomByte = secureRandom.generateRandomSync(1).data[0];

    const j: number = randomByte % (i + 1);

    const temp: T = deck[i];
    deck[i] = deck[j];
    deck[j] = temp;
  }

  return deck;
}

export const EASY_QUESTIONS_40: QuizItem[] = [
  { word: 'RED', fontColor: Color.Blue, options: ['GREEN', 'RED'], correct: 'RED', icon: 'meaning' },
  { word: 'BLUE', fontColor: Color.Red, options: ['BLUE', 'GREEN'], correct: 'BLUE', icon: 'meaning' },
  { word: 'GREEN', fontColor: Color.Yellow, options: ['RED', 'GREEN'], correct: 'GREEN', icon: 'meaning' },
  { word: 'YELLOW', fontColor: Color.Green, options: ['YELLOW', 'RED'], correct: 'YELLOW', icon: 'meaning' },
  { word: 'RED', fontColor: Color.Green, options: ['RED', 'BLUE'], correct: 'RED', icon: 'meaning' },
  { word: 'BLUE', fontColor: Color.Yellow, options: ['GREEN', ''], correct: 'BLUE', icon: 'meaning' },
  { word: 'GREEN', fontColor: Color.Blue, options: ['GREEN', 'YELLOW'], correct: 'GREEN', icon: 'meaning' },
  { word: 'YELLOW', fontColor: Color.Red, options: ['BLUE', 'YELLOW'], correct: 'YELLOW', icon: 'meaning' },
  { word: 'RED', fontColor: Color.Yellow, options: ['RED', 'GREEN'], correct: 'RED', icon: 'meaning' },
  { word: 'BLUE', fontColor: Color.Green, options: ['YELLOW', 'BLUE'], correct: 'BLUE', icon: 'meaning' },
  { word: 'GREEN', fontColor: Color.Red, options: ['GREEN', 'RED'], correct: 'GREEN', icon: 'meaning' },
  { word: 'YELLOW', fontColor: Color.Blue, options: ['RED', 'YELLOW'], correct: 'YELLOW', icon: 'meaning' },
  { word: 'RED', fontColor: Color.Blue, options: ['RED', 'YELLOW'], correct: 'RED', icon: 'meaning' },
  { word: 'BLUE', fontColor: Color.Green, options: ['BLUE', 'RED'], correct: 'BLUE', icon: 'meaning' },
  { word: 'GREEN', fontColor: Color.Yellow, options: ['BLUE', 'GREEN'], correct: 'GREEN', icon: 'meaning' },
  { word: 'YELLOW', fontColor: Color.Red, options: ['YELLOW', 'GREEN'], correct: 'YELLOW', icon: 'meaning' },
  { word: 'RED', fontColor: Color.Green, options: ['BLUE', 'RED'], correct: 'RED', icon: 'meaning' },
  { word: 'BLUE', fontColor: Color.Yellow, options: ['BLUE', 'GREEN'], correct: 'BLUE', icon: 'meaning' },
  { word: 'GREEN', fontColor: Color.Blue, options: ['YELLOW', 'GREEN'], correct: 'GREEN', icon: 'meaning' },
  { word: 'YELLOW', fontColor: Color.Green, options: ['BLUE', 'YELLOW'], correct: 'YELLOW', icon: 'meaning' },
  { word: 'RED', fontColor: Color.Yellow, options: ['GREEN', 'RED'], correct: 'RED', icon: 'meaning' },
  { word: 'BLUE', fontColor: Color.Red, options: ['GREEN', 'BLUE'], correct: 'BLUE', icon: 'meaning' },
  { word: 'GREEN', fontColor: Color.Yellow, options: ['RED', 'GREEN'], correct: 'GREEN', icon: 'meaning' },
  { word: 'YELLOW', fontColor: Color.Blue, options: ['YELLOW', 'RED'], correct: 'YELLOW', icon: 'meaning' },
  { word: 'RED', fontColor: Color.Green, options: ['RED', 'BLUE'], correct: 'RED', icon: 'meaning' },
  { word: 'BLUE', fontColor: Color.Green, options: ['YELLOW', ''], correct: 'BLUE', icon: 'meaning' },
  { word: 'GREEN', fontColor: Color.Red, options: ['GREEN', 'YELLOW'], correct: 'GREEN', icon: 'meaning' },
  { word: 'YELLOW', fontColor: Color.Green, options: ['BLUE', 'YELLOW'], correct: 'YELLOW', icon: 'meaning' },
  { word: 'RED', fontColor: Color.Blue, options: ['RED', 'GREEN'], correct: 'RED', icon: 'meaning' },
  { word: 'BLUE', fontColor: Color.Yellow, options: ['BLUE', 'RED'], correct: 'BLUE', icon: 'meaning' },
  { word: 'GREEN', fontColor: Color.Blue, options: ['GREEN', 'RED'], correct: 'GREEN', icon: 'meaning' },
  { word: 'YELLOW', fontColor: Color.Red, options: ['YELLOW', 'BLUE'], correct: 'YELLOW', icon: 'meaning' },
  { word: 'RED', fontColor: Color.Yellow, options: ['BLUE', 'RED'], correct: 'RED', icon: 'meaning' },
  { word: 'BLUE', fontColor: Color.Green, options: ['BLUE', 'YELLOW'], correct: '', icon: 'meaning' },
  { word: 'GREEN',fontColor: Color.Red, options: ['YELLOW', 'GREEN'], correct: 'GREEN', icon: 'meaning' },
  { word: 'YELLOW', fontColor: Color.Blue, options: ['RED', 'YELLOW'], correct: 'YELLOW', icon: 'meaning' },
  { word: 'RED', fontColor: Color.Green, options: ['GREEN', 'RED'], correct: 'RED', icon: 'meaning' },
  { word: 'BLUE', fontColor: Color.Red, options: ['BLUE', 'GREEN'], correct: 'BLUE', icon: 'meaning' },
  { word: 'GREEN', fontColor: Color.Yellow, options: ['GREEN', 'BLUE'], correct: 'GREEN', icon: 'meaning' },
  { word: 'YELLOW', fontColor: Color.Green, options: ['YELLOW', 'RED'], correct: 'YELLOW', icon: 'meaning' },
  { word: 'RED', fontColor: Color.Blue, options: ['GREEN', 'RED'], correct: 'RED', icon: 'meaning' },
  { word: 'BLUE', fontColor: Color.Red, options: ['BLUE', ''], correct: 'BLUE', icon: 'meaning' },
  { word: 'GREEN', fontColor: Color.Yellow, options: ['RED', 'GREEN'], correct: 'GREEN', icon: 'meaning' }
];

export const MEDIUM_QUESTIONS_40: QuizItem[] = [
  { word: 'GREEN', fontColor: Color.Red, options: ['RED', 'BLUE'], correct: 'RED', icon: 'color' },
  { word: 'RED', fontColor: Color.Blue, options: ['GREEN', 'BLUE'], correct: 'BLUE', icon: 'color' },
  { word: 'YELLOW', fontColor: Color.Green, options: ['YELLOW', 'GREEN'], correct: 'GREEN', icon: 'color' },
  { word: 'BLUE', fontColor: Color.Yellow, options: ['BLUE', 'YELLOW'], correct: 'YELLOW', icon: 'color' },
  { word: 'GREEN', fontColor: Color.Blue, options: ['BLUE', 'RED'], correct: 'BLUE', icon: 'color' },
  { word: 'RED', fontColor: Color.Yellow, options: ['YELLOW', 'GREEN'], correct: 'YELLOW', icon: 'color' },
  { word: 'BLUE', fontColor: Color.Green, options: ['GREEN', ''], correct: 'GREEN', icon: 'color' },
  { word: 'YELLOW', fontColor: Color.Red, options: ['RED', 'YELLOW'], correct: 'RED', icon: 'color' },
  { word: 'GREEN', fontColor: Color.Yellow, options: ['YELLOW', 'GREEN'], correct: 'YELLOW', icon: 'color' },
  { word: 'RED', fontColor: Color.Green, options: ['BLUE', 'GREEN'], correct: 'GREEN', icon: 'color' },
  { word: 'BLUE', fontColor: Color.Red, options: ['RED', 'BLUE'], correct: 'RED', icon: 'color' },
  { word: 'YELLOW', fontColor: Color.Blue, options: ['GREEN', 'BLUE'], correct: 'BLUE', icon: 'color' },
  { word: 'GREEN', fontColor: Color.Red, options: ['RED', 'YELLOW'], correct: 'RED', icon: 'color' },
  { word: 'RED', fontColor: Color.Green, options: ['GREEN', 'YELLOW'], correct: 'GREEN', icon: 'color' },
  { word: 'BLUE', fontColor: Color.Yellow, options: ['YELLOW', 'RED'], correct: 'YELLOW', icon: 'color' },
  { word: 'YELLOW', fontColor: Color.Green, options: ['GREEN', 'BLUE'], correct: 'GREEN', icon: 'color' },
  { word: 'GREEN', fontColor: Color.Blue, options: ['RED', 'BLUE'], correct: 'BLUE', icon: 'color' },
  { word: 'RED', fontColor: Color.Yellow, options: ['YELLOW', 'RED'], correct: 'YELLOW', icon: 'color' },
  { word: 'BLUE', fontColor: Color.Green, options: ['RED', 'GREEN'], correct: 'GREEN', icon: 'color' },
  { word: 'YELLOW', fontColor: Color.Red, options: ['RED', 'GREEN'], correct: 'RED', icon: 'color' },
  { word: 'GREEN', fontColor: Color.Yellow, options: ['GREEN', 'YELLOW'], correct: 'YELLOW', icon: 'color' },
  { word: 'RED', fontColor: Color.Blue, options: ['BLUE', 'GREEN'], correct: 'BLUE', icon: 'color' },
  { word: 'BLUE', fontColor: Color.Green, options: ['GREEN', 'BLUE'], correct: 'GREEN', icon: 'color' },
  { word: 'YELLOW', fontColor: Color.Red, options: ['YELLOW', 'RED'], correct: 'RED', icon: 'color' },
  { word: 'GREEN', fontColor: Color.Red, options: ['BLUE', 'RED'], correct: 'RED', icon: 'color' },
  { word: 'RED', fontColor: Color.Green, options: ['GREEN', 'RED'], correct: 'GREEN', icon: 'color' },
  { word: 'BLUE', fontColor: Color.Yellow, options: ['BLUE', 'YELLOW'], correct: 'YELLOW', icon: 'color' },
  { word: 'YELLOW',fontColor: Color.Blue, options: ['BLUE', 'GREEN'], correct: 'BLUE', icon: 'color' },
  { word: 'GREEN', fontColor: Color.Blue, options: ['GREEN', 'BLUE'], correct: 'BLUE', icon: 'color' },
  { word: 'RED', fontColor: Color.Yellow, options: ['RED', 'YELLOW'], correct: 'YELLOW', icon: 'color' },
  { word: 'BLUE', fontColor: Color.Red, options: ['BLUE', 'RED'], correct: 'RED', icon: 'color' },
  { word: 'YELLOW', fontColor: Color.Green, options: ['YELLOW', 'GREEN'], correct: 'GREEN', icon: 'color' },
  { word: 'GREEN', fontColor: Color.Yellow, options: ['GREEN', 'YELLOW'], correct: 'YELLOW', icon: 'color' },
  { word: 'RED', fontColor: Color.Blue, options: ['RED', 'BLUE'], correct: 'BLUE', icon: 'color' },
  { word: 'BLUE', fontColor: Color.Green, options: ['RED', 'GREEN'], correct: 'GREEN', icon: 'color' },
  { word: 'YELLOW', fontColor: Color.Red, options: ['GREEN', 'RED'], correct: 'RED', icon: 'color' },
  { word: 'GREEN', fontColor: Color.Blue, options: ['BLUE', 'GREEN'], correct: 'BLUE', icon: 'color' },
  { word: 'RED',fontColor: Color.Green, options: ['RED', 'GREEN'], correct: 'GREEN', icon: 'color' },
  { word: 'BLUE', fontColor: Color.Yellow, options: ['YELLOW', 'BLUE'], correct: 'YELLOW', icon: 'color' },
  { word: 'YELLOW', fontColor: Color.Blue, options: ['RED', 'BLUE'], correct: 'BLUE', icon: 'color' },
  { word: 'GREEN', fontColor: Color.Red, options: ['RED', 'BLUE'], correct: 'RED', icon: 'color' },
  { word: 'RED', fontColor: Color.Blue, options: ['GREEN', 'BLUE'], correct: 'BLUE', icon: 'color' },
  { word: 'YELLOW', fontColor: Color.Green, options: ['YELLOW', 'GREEN'], correct: 'GREEN', icon: 'color' },
  { word: 'BLUE', fontColor: Color.Yellow, options: ['BLUE', 'YELLOW'], correct: 'YELLOW', icon: 'color' },
  { word: 'GREEN', fontColor: Color.Blue, options: ['BLUE', 'RED'], correct: 'BLUE', icon: 'color' },
  { word: 'RED', fontColor: Color.Yellow, options: ['YELLOW', 'GREEN'], correct: 'YELLOW', icon: 'color' },
  { word: 'BLUE', fontColor: Color.Green, options: ['GREEN', 'RED'], correct: 'GREEN', icon: 'color' }
];

export const HARD_QUESTIONS_40: QuizItem[] = [
  { word: 'RED', fontColor: Color.Black, options: ['RED', 'BLUE'], correct: 'BLUE', icon: 'other' },
  { word: 'BLUE', fontColor: Color.Black, options: ['BLUE', 'GREEN'], correct: 'GREEN', icon: 'other' },
  { word: 'GREEN',fontColor: Color.Black, options: ['GREEN', 'YELLOW'], correct: 'YELLOW', icon: 'other' },
  { word: 'YELLOW', fontColor: Color.Black, options: ['YELLOW', 'RED'], correct: 'RED', icon: 'other' },
  { word: 'RED', fontColor: Color.Black, options: ['RED', 'GREEN'], correct: 'GREEN', icon: 'other' },
  { word: 'BLUE', fontColor: Color.Black, options: ['BLUE', 'YELLOW'], correct: 'YELLOW', icon: 'other' },
  { word: 'GREEN', fontColor: Color.Black, options: ['GREEN', 'RED'], correct: 'RED', icon: 'other' },
  { word: 'YELLOW', fontColor: Color.Black, options: ['YELLOW', 'BLUE'], correct: 'BLUE', icon: 'other' },
  { word: 'RED', fontColor: Color.Black, options: ['RED', 'YELLOW'], correct: 'YELLOW', icon: 'other' },
  { word: 'BLUE', fontColor: Color.Black, options: ['BLUE', 'RED'], correct: 'RED', icon: 'other' },
  { word: 'GREEN', fontColor: Color.Black, options: ['GREEN', 'BLUE'], correct: 'BLUE', icon: 'other' },
  { word: 'YELLOW', fontColor: Color.Black, options: ['YELLOW', 'GREEN'], correct: 'GREEN', icon: 'other' },
  { word: 'RED', fontColor: Color.Black, options: ['RED', 'BLUE'], correct: '', icon: 'other' },
  { word: 'BLUE', fontColor: Color.Black, options: ['BLUE', 'GREEN'], correct: 'GREEN', icon: 'other' },
  { word: 'GREEN', fontColor: Color.Black, options: ['GREEN', 'YELLOW'], correct: 'YELLOW', icon: 'other' },
  { word: 'YELLOW', fontColor: Color.Black, options: ['YELLOW', 'RED'], correct: 'RED', icon: 'other' },
  { word: 'RED', fontColor: Color.Black, options: ['RED', 'GREEN'], correct: 'GREEN', icon: 'other' },
  { word: 'BLUE', fontColor: Color.Black, options: ['BLUE', 'YELLOW'], correct: 'YELLOW', icon: 'other' },
  { word: 'GREEN', fontColor: Color.Black, options: ['GREEN', 'RED'], correct: 'RED', icon: 'other' },
  { word: 'YELLOW', fontColor: Color.Black, options: ['YELLOW', 'BLUE'], correct: 'BLUE', icon: 'other' },
  { word: 'RED', fontColor: Color.Black, options: ['RED', 'YELLOW'], correct: 'YELLOW', icon: 'other' },
  { word: 'BLUE', fontColor: Color.Black, options: ['BLUE', 'RED'], correct: 'RED', icon: 'other' },
  { word: 'GREEN', fontColor: Color.Black, options: ['GREEN', 'BLUE'], correct: 'BLUE', icon: 'other' },
  { word: 'YELLOW', fontColor: Color.Black, options: ['YELLOW', 'GREEN'], correct: 'GREEN', icon: 'other' },
  { word: 'RED',fontColor: Color.Black, options: ['RED', 'BLUE'], correct: 'BLUE', icon: 'other' },
  { word: 'BLUE', fontColor: Color.Black, options: ['BLUE', 'GREEN'], correct: 'GREEN', icon: 'other' },
  { word: 'GREEN', fontColor: Color.Black, options: ['GREEN', 'YELLOW'], correct: 'YELLOW', icon: 'other' },
  { word: 'YELLOW', fontColor: Color.Black, options: ['YELLOW', 'RED'], correct: 'RED', icon: 'other' },
  { word: 'RED', fontColor: Color.Black, options: ['RED', 'GREEN'], correct: 'GREEN', icon: 'other' },
  { word: 'BLUE', fontColor: Color.Black, options: ['BLUE', 'YELLOW'], correct: 'YELLOW', icon: 'other' },
  { word: 'GREEN', fontColor: Color.Black, options: ['GREEN', 'RED'], correct: '', icon: 'other' },
  { word: 'YELLOW', fontColor: Color.Black, options: ['YELLOW', 'BLUE'], correct: 'BLUE', icon: 'other' },
  { word: 'RED', fontColor: Color.Black, options: ['', 'YELLOW'], correct: 'YELLOW', icon: 'other' },
  { word: 'BLUE', fontColor: Color.Black, options: ['BLUE', 'RED'], correct: 'RED', icon: 'other' },
  { word: 'GREEN', fontColor: Color.Black, options: ['GREEN', 'BLUE'], correct: 'BLUE', icon: 'other' },
  { word: 'YELLOW', fontColor: Color.Black, options: ['YELLOW', 'GREEN'], correct: '', icon: 'other' },
  { word: 'RED', fontColor: Color.Black, options: ['RED', 'BLUE'], correct: 'BLUE', icon: 'other' },
  { word: 'BLUE', fontColor: Color.Black, options: ['BLUE', 'GREEN'], correct: 'GREEN', icon: 'other' },
  { word: 'GREEN', fontColor: Color.Black, options: ['GREEN', 'YELLOW'], correct: 'YELLOW', icon: 'other' },
  { word: 'YELLOW', fontColor: Color.Black, options: ['YELLOW', 'RED'], correct: 'RED', icon: 'other'},
  { word: 'RED', fontColor: Color.Black, options: ['RED', 'GREEN'], correct: 'GREEN', icon: 'other' },
  { word: 'BLUE', fontColor: Color.Black, options: ['BLUE', 'YELLOW'], correct: 'YELLOW', icon: 'other' },
  { word: 'GREEN', fontColor: Color.Black, options: ['GREEN', 'RED'], correct: 'RED', icon: 'other' },
  { word: 'YELLOW', fontColor: Color.Black, options: ['YELLOW', 'BLUE'], correct: 'BLUE', icon: 'other' },
  { word: 'RED', fontColor: Color.Black, options: ['RED', 'BLUE'], correct: 'BLUE', icon: 'other' },
  { word: '', fontColor: Color.Black, options: ['BLUE', 'GREEN'], correct: 'GREEN', icon: 'other' },
  { word: 'GREEN', fontColor: Color.Black, options: ['GREEN', 'YELLOW'], correct: 'YELLOW', icon: 'other' },
  { word: 'YELLOW', fontColor: Color.Black, options: ['YELLOW', 'RED'], correct: 'RED', icon: 'other' },
  { word: 'RED', fontColor: Color.Black, options: ['RED', 'GREEN'], correct: 'GREEN', icon: 'other' },
  { word: 'BLUE', fontColor: Color.Black, options: ['BLUE', 'YELLOW'], correct: 'YELLOW', icon: 'other' },
  { word: 'GREEN', fontColor: Color.Black, options: ['GREEN', 'RED'], correct: 'RED', icon: 'other' }
];

export const EXPERT_QUESTIONS_40: QuizItem[] = [
  { word: 'RED', fontColor: Color.Blue, options: ['GREEN', 'RED'], correct: 'RED', icon: 'meaning' },
  { word: 'BLUE', fontColor: Color.Red, options: ['BLUE', 'RED'], correct: 'RED', icon: 'color' },
  { word: 'GREEN', fontColor: Color.Yellow, options: ['RED', 'GREEN'], correct: 'GREEN', icon: 'meaning' },
  { word: 'YELLOW', fontColor: Color.Green, options: ['YELLOW', 'GREEN'], correct: 'GREEN', icon: 'color' },
  { word: 'RED', fontColor: Color.Green, options: ['RED', 'BLUE'], correct: 'RED', icon: 'meaning' },
  { word: 'BLUE', fontColor: Color.Yellow, options: ['GREEN', 'YELLOW'], correct: 'YELLOW', icon: 'color' },
  { word: 'GREEN', fontColor: Color.Blue, options: ['YELLOW', 'GREEN'], correct: 'GREEN', icon: 'meaning' },
  { word: 'YELLOW', fontColor: Color.Red, options: ['RED', 'YELLOW'], correct: 'RED', icon: 'color' },
  { word: 'RED', fontColor: Color.Yellow, options: ['BLUE', 'RED'], correct: 'RED', icon: 'meaning' },
  { word: 'BLUE', fontColor: Color.Green, options: ['BLUE', 'GREEN'], correct: 'GREEN', icon: 'color' },
  { word: 'GREEN', fontColor: Color.Red, options: ['GREEN', 'RED'], correct: 'GREEN', icon: 'meaning' },
  { word: 'YELLOW', fontColor: Color.Blue, options: ['BLUE', 'YELLOW'], correct: 'BLUE', icon: 'color' },
  { word: 'RED', fontColor: Color.Blue, options: ['YELLOW', 'RED'], correct: 'RED', icon: 'meaning' },
  { word: 'BLUE', fontColor: Color.Green, options: ['GREEN', 'BLUE'], correct: 'GREEN', icon: 'color' },
  { word: 'GREEN', fontColor: Color.Yellow, options: ['BLUE', 'GREEN'], correct: 'GREEN', icon: 'meaning' },
  { word: 'YELLOW', fontColor: Color.Red, options: ['YELLOW', 'RED'], correct: 'RED', icon: 'color' },
  { word: 'RED', fontColor: Color.Green, options: ['GREEN', 'RED'], correct: 'RED', icon: 'meaning' },
  { word: 'BLUE', fontColor: Color.Yellow, options: ['BLUE', 'YELLOW'], correct: 'YELLOW', icon: 'color' },
  { word: 'GREEN', fontColor: Color.Blue, options: ['GREEN', 'YELLOW'], correct: 'GREEN', icon: 'meaning' },
  { word: 'YELLOW', fontColor: Color.Green, options: ['BLUE', 'GREEN'], correct: 'GREEN', icon: 'color' },
  { word: 'RED', fontColor: Color.Yellow, options: ['RED', 'GREEN'], correct: 'RED', icon: 'meaning' },
  { word: 'BLUE', fontColor: Color.Red, options: ['RED', 'BLUE'], correct: 'RED', icon: 'color' },
  { word: 'GREEN', fontColor: Color.Yellow, options: ['RED', 'GREEN'], correct: 'GREEN', icon: 'meaning' },
  { word: 'YELLOW', fontColor: Color.Blue, options: ['YELLOW', 'BLUE'], correct: 'BLUE', icon: 'color' },
  { word: 'RED', fontColor: Color.Green, options: ['RED', 'BLUE'], correct: 'RED', icon: 'meaning' },
  { word: 'BLUE', fontColor: Color.Green, options: ['YELLOW', 'GREEN'], correct: 'GREEN', icon: 'color' },
  { word: 'GREEN', fontColor: Color.Red, options: ['GREEN', 'BLUE'], correct: 'GREEN', icon: 'meaning' },
  { word: 'YELLOW', fontColor: Color.Green, options: ['RED', 'GREEN'], correct: 'GREEN', icon: 'color' },
  { word: 'RED', fontColor: Color.Blue, options: ['RED', 'YELLOW'], correct: 'RED', icon: 'meaning' },
  { word: 'BLUE', fontColor: Color.Yellow, options: ['BLUE', 'YELLOW'], correct: 'YELLOW', icon: 'color' },
  { word: 'GREEN', fontColor: Color.Blue, options: ['GREEN', 'RED'], correct: 'GREEN', icon: 'meaning' },
  { word: 'YELLOW', fontColor: Color.Red, options: ['GREEN', 'RED'], correct: 'RED', icon: 'color' },
  { word: 'RED', fontColor: Color.Yellow, options: ['BLUE', 'RED'], correct: 'RED', icon: 'meaning' },
  { word: 'BLUE', fontColor: Color.Green, options: ['BLUE', 'GREEN'], correct: 'GREEN', icon: 'color' },
  { word: 'GREEN', fontColor: Color.Red, options: ['YELLOW', 'GREEN'], correct: 'GREEN', icon: 'meaning' },
  { word: 'YELLOW', fontColor: Color.Blue, options: ['RED', 'BLUE'], correct: 'BLUE', icon: 'color' },
  { word: 'RED', fontColor: Color.Green, options: ['RED', 'GREEN'], correct: 'RED', icon: 'meaning' },
  { word: 'BLUE', fontColor: Color.Red, options: ['BLUE', 'RED'], correct: 'RED', icon: 'color' },
  { word: 'GREEN', fontColor: Color.Yellow, options: ['GREEN', 'BLUE'], correct: 'GREEN', icon: 'meaning' },
  { word: 'YELLOW', fontColor: Color.Green, options: ['YELLOW', 'GREEN'], correct: 'GREEN', icon: 'color' },
  { word: 'RED', fontColor: Color.Blue, options: ['GREEN', 'RED'], correct: 'RED', icon: 'meaning' },
  { word: 'BLUE', fontColor: Color.Red, options: ['BLUE', 'RED'], correct: 'RED', icon: 'color' }
];

export function getQuestionsForMode(mode: string): QuizItem[] {
  if (mode === MODES_ENUMS.Medium) {
    return MEDIUM_QUESTIONS_40
  }
  if (mode === MODES_ENUMS.Hard) {
    return HARD_QUESTIONS_40
  }
  if (mode === MODES_ENUMS.Expert) {
    return EXPERT_QUESTIONS_40
  }
  return EASY_QUESTIONS_40
}

export function getQuestionsShuffled(mode: string): QuizItem[] {
  return shuffleCopy(getQuestionsForMode(mode))
}