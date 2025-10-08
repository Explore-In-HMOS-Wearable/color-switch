import { BaseViewModel } from "../viewmodel/BaseViewModel";

@Entry
@Component
export struct HomePage {
	baseVm: BaseViewModel = new BaseViewModel();

	build() {
		Column({space : 5}){
			Text('ColorSwitch')
				.fontSize(24)
				.fontWeight(FontWeight.Medium)
				.fontColor('#1971c2')

			Text('Welcome')
				.fontSize(14)
				.fontWeight(FontWeight.Regular)
				.fontColor('#1971c2')
				.opacity(0.8)

			Button('Training', { type: ButtonType.Normal, stateEffect: true })
				.borderRadius(8)
				.backgroundColor(Color.Transparent)
				.borderWidth(1)
				.fontSize(16)
				.borderColor(Color.Orange)
				.fontColor(Color.Orange)
				.width(120)
				.margin({top : 30})
				.onClick(() => {
					this.baseVm.navigateToPage('TrainingList')
					console.log('ButtonType.Normal')
				})

			Button('Game', { type: ButtonType.Normal, stateEffect: true })
				.borderRadius(8)
				.backgroundColor(Color.Transparent)
				.borderWidth(1)
				.fontSize(16)
				.borderColor(Color.Orange)
				.fontColor(Color.Orange)
				.width(120)
				.onClick(() => {
					this.baseVm.navigateToPage('ModeList')
					console.log('ButtonType.Normal')
				})
		}
		.linearGradient({
			direction: GradientDirection.Bottom,
			colors: [
				[$r('app.color.base_background_gradient_start'), 0.0],
				[$r('app.color.base_background_gradient_end'), 1.0]
			]
		})
		.justifyContent(FlexAlign.Center)
		.alignItems(HorizontalAlign.Center)
		.height('100%')
		.width('100%')
	}
}

