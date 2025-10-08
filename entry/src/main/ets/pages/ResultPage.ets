import { MODES_ENUMS } from '../viewmodel/Modes'

@Entry
@Component
export struct ResultPage {
	@State score: number = 0
	@State gameMode: string = MODES_ENUMS.Easy
	@State rankTitle: string = ''
	@State rankTip: string = ''

	aboutToAppear(): void {
		const score: number | undefined = AppStorage.get('score')
		const mode: string | undefined = AppStorage.get('game_mode')

		if (score !== undefined) {
			this.score = score
		}
		if (mode !== undefined) {
			this.gameMode = mode
		}

		this.rankTitle = this.getRankForScore(this.gameMode, this.score)
		this.rankTip   = this.getTipForRank(this.rankTitle)
	}

	private getRankForScore(mode: string, score: number): string {
		if (mode === MODES_ENUMS.Easy) {
			if (score < 20)  return 'Beginner'
			if (score < 50)  return 'Rising Star'
			if (score < 80)  return 'Pro Player'
			return 'Master'
		}
		if (mode === MODES_ENUMS.Medium) {
			if (score < 30)  return 'Beginner'
			if (score < 60)  return 'Rising Star'
			if (score < 90)  return 'Pro Player'
			return 'Master'
		}
		if (mode === MODES_ENUMS.Hard) {
			if (score < 40)  return 'Beginner'
			if (score < 80)  return 'Rising Star'
			if (score < 120) return 'Pro Player'
			return 'Master'
		}
		// Expert
		if (score < 50)  return 'Beginner'
		if (score < 100) return 'Rising Star'
		if (score < 150) return 'Pro Player'
		return 'Master'
	}

	private getTipForRank(rank: string): string {
		if (rank === 'Beginner')    return 'Warming up, keep going! 💪'
		if (rank === 'Rising Star') return 'You are on the rise, don’t stop! ⭐'
		if (rank === 'Pro Player')  return 'One step away from mastery! 🚀'
		return 'Legend! You are at the top. 👑'
	}

	build() {
		Column({ space: 10 }) {
			Text('Result')
				.fontSize(20)
				.fontWeight(FontWeight.Bolder)
				.fontColor(Color.White)
				.margin({top : 10})

			Text(`Mode: ${this.gameMode}`)
				.fontSize(14)
				.fontColor(Color.White)
				.opacity(0.9)

			Text(`Score: ${this.score}`)
				.fontSize(16)
				.fontWeight(FontWeight.Bolder)
				.fontColor(Color.White)

			Text(this.rankTitle)
				.fontSize(18)
				.fontWeight(FontWeight.Bolder)
				.fontColor(Color.Orange)

			Text(this.rankTip)
				.fontSize(14)
				.fontColor(Color.White)
				.opacity(0.9)
		}
		.padding(10)
		.width('100%')
		.height('100%')
		.linearGradient({
			direction: GradientDirection.Bottom,
			colors: [
				[$r('app.color.base_background_gradient_start'), 0.0],
				[$r('app.color.base_background_gradient_end'), 1.0]
			]
		})
	}
}
