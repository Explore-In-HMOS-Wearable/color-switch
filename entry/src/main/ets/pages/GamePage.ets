import { GameQuestionCard } from "../components/GameQuestionCard"
import { QuizItem } from "../model/TrainingTypes"
import { BaseViewModel } from "../viewmodel/BaseViewModel"
import { MODES_ENUMS } from "../viewmodel/Modes"

const START_MS: number = 60000
const TICK_MS:  number = 1000

@Entry
@Component
export struct GamePage {
  private tickId: number = -1
  private baseStartEpoch: number = 0

  @State bonusMs: number = 0
  @State remainingMsState: number = START_MS

  @State usedSecUI:  number = 0
  @State totalSecUI: number = Math.ceil(START_MS / 1000)
  baseVm: BaseViewModel = new BaseViewModel();

  private gradientColor: LinearGradient =
    new LinearGradient([{ color: Color.Yellow, offset: 0.5 }, { color: Color.Orange, offset: 1.0 }])

  @State score: number = 0
  @State gameList: QuizItem[] = []
  @State gameMode: string = MODES_ENUMS.Easy
  @State currIndex: number = 0

  aboutToAppear(): void {
    const list: QuizItem[] | undefined = AppStorage.get('game_list')
    if (list && list.length > 0) this.gameList = list

    const mode: string | undefined = AppStorage.get('game_mode')
    if (mode) this.gameMode = mode

    this.score = 0
    this.currIndex = 0
    this.bonusMs = 0
    this.baseStartEpoch = Date.now()
    this.remainingMsState = START_MS
    this.usedSecUI  = 0
    this.totalSecUI = Math.ceil(START_MS / 1000)
    this.startTicker()
    AppStorage.setOrCreate('score', this.score);
  }

  aboutToDisappear(): void {
    this.stopTicker()
  }

  private startTicker(): void {
    this.stopTicker()
    this.tickId = setInterval(() => this.onTick(), TICK_MS) as number
  }
  private stopTicker(): void {
    if (this.tickId !== -1) {
      clearInterval(this.tickId)
      this.tickId = -1
    }
  }

  private onTick(): void {
    const totalMs: number = Math.max(1, START_MS + this.bonusMs)

    const elapsed: number = Date.now() - this.baseStartEpoch
    let remain: number = totalMs - elapsed
    if (remain < 0) remain = 0

    this.remainingMsState = remain
    this.totalSecUI = Math.ceil(totalMs / 1000)
    this.usedSecUI  = Math.floor((totalMs - remain) / 1000)

    if (remain <= 0 || this.currIndex >= this.gameList.length) {
      this.stopTicker()
      this.baseVm.navigateToPage('Result')
    }
  }

  private fmt(ms: number): string {
    const s: number = Math.max(0, Math.floor(ms / 1000))
    const m: number = Math.floor(s / 60)
    const ss: number = s % 60
    const mmStr: string = m < 10 ? `0${m}` : `${m}`
    const ssStr: string = ss < 10 ? `0${ss}` : `${ss}`
    return `${mmStr}:${ssStr}`
  }

  private restart(): void {
    this.score = 0
    this.currIndex = 0
    this.bonusMs = 0
    this.baseStartEpoch = Date.now()
    this.remainingMsState = START_MS
    this.usedSecUI  = 0
    this.totalSecUI = Math.ceil(START_MS / 1000)
    this.startTicker()
    AppStorage.setOrCreate('score', this.score);
  }

  build() {
    Stack() {
      Progress({ value: this.usedSecUI, total: this.totalSecUI, type: ProgressType.Ring })
        .width('100%')
        .style({ strokeWidth: 12, enableSmoothEffect: true })
        .color(this.gradientColor)
        .zIndex(1)

      Text(this.fmt(this.remainingMsState))
        .fontColor(Color.White)
        .fontSize(20)
        .fontWeight(FontWeight.Bolder)
        .offset({ x: 0, y: -80 })
        .zIndex(2)

      if (this.remainingMsState > 0 && this.currIndex < this.gameList.length) {
        GameQuestionCard({
          quiz: this.gameList[this.currIndex],
          qid: this.currIndex,
          currIndex: this.currIndex,
          score: this.score,
          bonusMs: this.bonusMs
        })
          .zIndex(3)
      }
    }
    .linearGradient({
      direction: GradientDirection.Bottom,
      colors: [
        [$r('app.color.base_background_gradient_start'), 0.0],
        [$r('app.color.base_background_gradient_end'), 1.0]
      ]
    })
  }
}
