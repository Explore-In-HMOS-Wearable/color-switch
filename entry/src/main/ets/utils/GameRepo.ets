import { QuizItem } from '../model/TrainingTypes'

export enum Mode {
  EASY = 0,
  MEDIUM = 1,
  HARD = 2,
  EXPERT = 3
}

export class GameRepo {
  private static readonly COLOR_NAMES: string[] = ['RED', 'BLUE', 'GREEN', 'YELLOW']

  private static colorFromName(name: string): Color {
    if (name === 'RED') return Color.Red
    if (name === 'BLUE') return Color.Blue
    if (name === 'GREEN') return Color.Green
    if (name === 'YELLOW') return Color.Yellow
    return Color.White
  }

  private static pickOther(except: string): string {
    const arr: string[] = GameRepo.COLOR_NAMES.filter(n => n !== except)
    const i: number = Math.floor(Math.random() * arr.length)
    return arr[i]
  }

  private static randColorName(): string {
    const i: number = Math.floor(Math.random() * GameRepo.COLOR_NAMES.length)
    return GameRepo.COLOR_NAMES[i]
  }

  private static shuffle2(a: string, b: string): string[] {
    return Math.random() < 0.5 ? [a, b] : [b, a]
  }

  static next(mode: number): QuizItem {
    const word: string = GameRepo.randColorName()
    const anyFont: string = GameRepo.randColorName()
    const anyFontColor: Color = GameRepo.colorFromName(anyFont)

    if (mode === Mode.EASY) {
      const correct: string = word
      const wrong: string = GameRepo.pickOther(correct)
      return {
        word,
        fontColor: anyFontColor,
        options: GameRepo.shuffle2(correct, wrong),
        correct
      }
    }

    if (mode === Mode.MEDIUM) {
      const correct: string = anyFont
      const wrong: string = GameRepo.pickOther(correct)
      return {
        word, // ekranda bir kelime dursun
        fontColor: anyFontColor,
        options: GameRepo.shuffle2(correct, wrong),
        correct
      }
    }

    if (mode === Mode.HARD) {
      const meaning: string = word
      const notMeaning: string = GameRepo.pickOther(meaning)
      return {
        word,
        fontColor: Color.Black,
        options: GameRepo.shuffle2(meaning, notMeaning),
        correct: notMeaning
      }
    }

    const isMeaning: boolean = Math.random() < 0.5
    if (isMeaning) {
      const correct: string = word
      const wrong: string = GameRepo.pickOther(correct)
      return {
        word,
        fontColor: anyFontColor,
        options: GameRepo.shuffle2(correct, wrong),
        correct
      }
    } else {
      const correct: string = anyFont
      const wrong: string = GameRepo.pickOther(correct)
      return {
        word,
        fontColor: anyFontColor,
        options: GameRepo.shuffle2(correct, wrong),
        correct
      }
    }
  }

  static ruleText(mode: number): string {
    if (mode === Mode.EASY)   return 'Select the MEANING of the word'
    if (mode === Mode.MEDIUM) return 'Select the FONT COLOR'
    if (mode === Mode.HARD)   return 'Pick the option that is NOT the meaning'
    return 'Follow the rule (mixed)' // Expert
  }

  static modeTitle(mode: number): string {
    if (mode === Mode.EASY)   return 'Easy'
    if (mode === Mode.MEDIUM) return 'Medium'
    if (mode === Mode.HARD)   return 'Hard'
    return 'Expert'
  }
}
