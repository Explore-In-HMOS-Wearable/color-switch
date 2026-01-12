import { QuizItem } from '../model/TrainingTypes'
import { HapticService } from '../services/HapticService';

@Component
export struct GameQuestionCard {
  @Prop quiz: QuizItem
  @Prop qid: number
  @Link currIndex: number
  @Link score: number
  @Link bonusMs: number
  private haptic: HapticService = new HapticService();

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
    return Color.Gray
  }

  private onTap(opt: string) {
    const ok = (opt === this.quiz.correct)
    if (ok) {
      this.score = this.score + 5
      this.bonusMs = this.bonusMs + 5000
      AppStorage.setOrCreate('score', this.score);
      this.haptic.ok();

    } else {
      this.score = this.score - 10
      this.bonusMs = this.bonusMs - 10000
      AppStorage.setOrCreate('score', this.score);
      this.haptic.nok()

    }
    this.currIndex = this.currIndex + 1
  }

  build() {
    Column({ space: 12 }) {
      Row({ space: 8 }) {
        Text(this.quiz.word)
          .fontSize(28).fontWeight(FontWeight.Bold)
          .fontColor(this.quiz.fontColor)

        if (this.quiz.icon === 'meaning') {
          Text('📝').fontSize(22)
        } else if (this.quiz.icon === 'color') {
          Text('🎨').fontSize(22)
        } else if (this.quiz.icon === 'other') {
          Text('🚫').fontSize(22)
        }

      }

      Row({ space: 16 }) {
        ForEach(this.quiz.options, (opt: string, index: number) => {
          Button(opt)
            .width(80)
            .height(80)
            .borderRadius(22)
            .backgroundColor(this.colorFromName(opt))
            .onClick(() => this.onTap(opt))
        }, (item: string, index: number) => item)
      }
      .justifyContent(FlexAlign.Center)

      Text(`Score: ${this.score}`)
        .fontSize(14)
        .fontWeight(FontWeight.Bolder)
        .fontColor(Color.White)
    }
    .padding({ top: 14 })
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}
