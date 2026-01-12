import { QuizItem } from '../model/TrainingTypes'

@Component
export struct QuizCard {
  @Prop quiz: QuizItem
  @Prop index: number
  @Prop total: number
  @Prop passNeed: number
  @Link correctCount: number
  @Link currentQuiz: number
  @Link trainingPassed: boolean
  @Link showQuiz: boolean
  @Link showResult: boolean

  private colorFromName(name: string): Color {
    if (name === 'RED') {
      return Color.Red
    }
    if (name === 'BLUE') {
      return Color.Blue
    }
    if (name === 'GREEN') {
      return Color.Green
    }
    if (name === 'YELLOW') {
      return Color.Yellow
    }
    return Color.Black
  }

  private answer(choice: string): void {
    const isCorrect: boolean = (choice === this.quiz.correct)
    if (isCorrect) {
      this.correctCount = this.correctCount + 1
    }
    const nextIndex: number = this.index + 1
    if (nextIndex < this.total) {
      this.currentQuiz = nextIndex
      return
    }
    this.trainingPassed = (this.correctCount >= this.passNeed)
    this.showQuiz = false
    this.showResult = true
  }

  build() {
    Column({ space: 12 }) {
      Text(`Quiz  ${(this.index + 1).toString()} / ${this.total.toString()}`)
        .fontSize(16).fontWeight(FontWeight.Medium)

      Row({ space: 8 }) {
        Text(this.quiz.word)
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .fontColor(this.quiz.fontColor)

        if (this.quiz.icon === 'meaning') {
          Text('📝')
            .fontSize(22)
        } else if (this.quiz.icon === 'color') {
          Text('🎨')
            .fontSize(22)
        }
      }

      Row({ space: 16 }) {
        ForEach(this.quiz.options, (opt: string, index: number) => {
          Button(opt)
            .width(80)
            .height(80)
            .borderRadius(22)
            .backgroundColor(this.colorFromName(opt))
            .onClick(() => this.answer(opt))
        }, (item: string, index: number) => item)
      }
      .justifyContent(FlexAlign.Center)

      Text(`Correct:  ${this.correctCount.toString()}`)
        .fontSize(12).opacity(0.6)
    }
    .justifyContent(FlexAlign.Center)
    .width('100%').height('100%')
    .alignItems(HorizontalAlign.Center)
  }
}
