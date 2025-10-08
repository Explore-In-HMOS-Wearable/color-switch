import { ArcSwiper, ArcSwiperAttribute, ArcDotIndicator, ArcDirection, ArcSwiperController } from '@kit.ArkUI';
import { TrainingViewModel } from '../viewmodel/TrainingViewModel'
import { Mode, SlideType, SlideDef, QuizItem, ModeCopy } from '../model/TrainingTypes'
import { QuizCard } from '../components/QuizCard'
import { UnlockPrefs, UnlockStatus } from '../utils/UnlockPrefs';
import { common } from '@kit.AbilityKit';
import { BaseViewModel } from '../viewmodel/BaseViewModel';

@Entry
@Component
export struct TrainingPage {
  private wearableSwiperController: ArcSwiperController = new ArcSwiperController()
  baseVm: BaseViewModel = new BaseViewModel();
  @StorageLink('selectedMode') selectedMode: number = Mode.EASY
  @State unlockedEasy: boolean = false
  @State unlockedMedium: boolean = false
  @State unlockedHard: boolean = false
  @State unlockedExpert: boolean = false
  @State swiperIndex: number = 0
  @State showQuiz: boolean = false
  @State showResult: boolean = false
  @State currentQuiz: number = 0
  @State correctCount: number = 0
  @State trainingPassed: boolean = false
  @State titleText: string = ''
  @State ruleText: string = ''
  @State passNeed: number = 2
  @State slides: SlideDef[] = []
  @State quizData: QuizItem[] = []
  @StorageLink('context') context: Context | undefined =  AppStorage.get('context')

  aboutToAppear(): void {
    const all: UnlockStatus = UnlockPrefs.getAll(getContext(this) as common.Context)
    this.unlockedEasy = all.unlocked_easy
    this.unlockedMedium = all.unlocked_medium
    this.unlockedHard = all.unlocked_hard
    this.unlockedExpert = all.unlocked_expert
    console.error('tag easy', this.unlockedEasy + '')
    const copy: ModeCopy = TrainingViewModel.load(this.selectedMode)
    this.titleText = copy.title
    this.ruleText = copy.rule
    this.passNeed = copy.passNeed
    this.slides = copy.slides
    this.quizData = copy.quiz
    this.currentQuiz = 0
    this.correctCount = 0
    this.showQuiz = false
    this.showResult = false
  }

  private startQuiz(): void {
    this.showResult = false
    this.showQuiz = true
    this.currentQuiz = 0
    this.correctCount = 0
  }

  private retryTraining(): void {
    this.showResult = false
    this.showQuiz = false
    this.correctCount = 0
    this.currentQuiz = 0
    this.trainingPassed = false
    this.swiperIndex = 0
  }

  private unlockIfPassed(): void {
    if (!this.trainingPassed) {
      return
    }

    let ctx = this.context as common.Context
    if (this.selectedMode === Mode.EASY) {
      this.unlockedEasy = true
      UnlockPrefs.setUnlocked(ctx, Mode.EASY, true)
    }
    if (this.selectedMode === Mode.MEDIUM) {
      this.unlockedMedium = true
      UnlockPrefs.setUnlocked(ctx, Mode.MEDIUM, true)
    }
    if (this.selectedMode === Mode.HARD) {
      this.unlockedHard = true
      UnlockPrefs.setUnlocked(ctx, Mode.HARD, true)
    }
    if (this.selectedMode === Mode.EXPERT) {
      this.unlockedExpert = true
      UnlockPrefs.setUnlocked(ctx, Mode.EXPERT, true)
    }

    let easy = UnlockPrefs.isUnlocked(ctx, Mode.EASY)
    console.error('tag fonk', easy+'')


  } /* @Builder IntroSlide() { Column({ space: 10 }) { Text(this.titleText).fontSize(20).fontWeight(FontWeight.Bold) Text(this.ruleText).fontSize(14).opacity(0.8).textAlign(TextAlign.Center) } .width('95%').height('95%').padding(12) .alignItems(HorizontalAlign.Center) .justifyContent(FlexAlign.Center) }*/

  @Builder
  SlideView(s: SlideDef) {
    if (s.type === SlideType.TEXT) {
      Column({ space: 10 }) {
        Text(s.title ? s.title : '').fontSize(18).fontWeight(FontWeight.Bold)
        Text(s.body ? s.body : '').fontSize(14).opacity(0.8).textAlign(TextAlign.Center)
      }
      .width('95%')
      .height('95%')
      .padding(12)
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)
    }
    if (s.type === SlideType.EXAMPLE) {
      Column({ space: 10 }) {
        Text(s.word ? s.word : '')
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .fontColor(s.fontColor ? s.fontColor : Color.White)
        Text('Correct answer: ' + (s.answerText ? s.answerText : ''))
          .fontSize(14)
          .opacity(0.8)
          .textAlign(TextAlign.Center)
      }
      .width('95%')
      .height('95%')
      .padding(12)
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)
    } /* Column({ space: 10 }) { Text(s.word ? s.word : '') .fontSize(28).fontWeight(FontWeight.Bold) .fontColor(s.fontColor ? s.fontColor : Color.White) Text('Wrong: ' + (s.wrong ? s.wrong : '') + '\nCorrect: ' + (s.correct ? s.correct : '')) .fontSize(14).opacity(0.8).textAlign(TextAlign.Center) } .width('95%').height('95%').padding(12) .alignItems(HorizontalAlign.Center) .justifyContent(FlexAlign.Center)*/
  }

  @Builder
  QuizIntroSlide() {
    Column({ space: 13 }) {
      Text('Ready for the mini quiz?').fontSize(18).fontWeight(FontWeight.Bold)
      Text('Answer a few quick questions.').fontSize(14).opacity(0.8).textAlign(TextAlign.Center)
      Button('Go to Quiz').onClick(() => this.startQuiz())
    }
    .width('95%')
    .height('95%')
    .padding(12)
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Stack({ alignContent: Alignment.Top }) {
      ArcSwiper(this.wearableSwiperController) {
        ForEach(this.slides, (s: SlideDef, i: number) => {
          this.SlideView(s)
        }, (s: SlideDef, i: number) => 'slide-' + i.toString())
        this.QuizIntroSlide()
      }.index(this.swiperIndex).visibility(this.showQuiz || this.showResult ? Visibility.None : Visibility.Visible)

      if (this.showQuiz) {
        QuizCard({
          quiz: this.quizData[this.currentQuiz],
          index: this.currentQuiz,
          total: this.quizData.length,
          passNeed: this.passNeed,
          correctCount: this.correctCount,
          currentQuiz: this.currentQuiz,
          trainingPassed: this.trainingPassed,
          showQuiz: this.showQuiz,
          showResult: this.showResult
        })
      }
      if (this.showResult) {
        Column({ space: 16 }) {
          if (this.trainingPassed) {
            Text('Training successful!').fontSize(18).fontWeight(FontWeight.Bold)
            Text('Game unlocked ✅').fontSize(14).opacity(0.9)
            Button('Continue').onClick(() => {
              this.unlockIfPassed()
              this.baseVm.navigateToPage('ModeList')
            })
          } else {
            Text('Training failed').fontSize(18).fontWeight(FontWeight.Bold)
            Text('Try the training again.').fontSize(14).opacity(0.9).textAlign(TextAlign.Center)
            Button('Retry Training').onClick(() => this.retryTraining())
          }
        }
        .justifyContent(FlexAlign.Center)
        .width('100%')
        .height('100%')
        .padding(12)
        .alignItems(HorizontalAlign.Center)
      }
    }
    .width('100%')
    .height('100%')
    .linearGradient({
      direction: GradientDirection.Bottom,
      colors: [[$r('app.color.base_background_gradient_start'), 0.0],
        [$r('app.color.base_background_gradient_end'), 1.0]]
    })
  }
}