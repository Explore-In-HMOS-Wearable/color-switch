export enum Mode {
  EASY = 0,
  MEDIUM = 1,
  HARD = 2,
  EXPERT = 3
}

export enum SlideType {
  TEXT = 0,
  EXAMPLE = 1,
  MISTAKE = 2
}

export interface SlideDef {
  type: SlideType
  title?: string
  body?: string
  word?: string
  fontColor?: Color
  answerText?: string
  wrong?: string
  correct?: string
}

export interface QuizItem {
  word: string
  fontColor: Color
  options: string[]
  correct: string
  icon?: 'meaning' | 'color' | 'other'
}

export interface ModeCopy {
  title: string
  rule: string
  slides: SlideDef[]
  quiz: QuizItem[]
  passNeed: number
}
