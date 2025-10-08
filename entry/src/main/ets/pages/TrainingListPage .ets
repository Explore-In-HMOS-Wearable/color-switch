import { ArcList, ArcListItem, ArcListAttribute, ArcListItemAttribute, ComponentContent } from '@kit.ArkUI';
import { Mode } from '../model/TrainingTypes';
import { BaseViewModel } from '../viewmodel/BaseViewModel';
import { MODES, MODES_ENUMS } from '../viewmodel/Modes';

@Builder
function buildText() {
	Column() {
		Text('Make a Traning')
			.fontSize(20)
			.fontWeight(FontWeight.Bolder)
			.fontColor(Color.White)
	}
	.margin(6)
}

@Entry
@Component
export struct TrainingListPage  {
	context: UIContext = this.getUIContext()
	header: ComponentContent<Object> = new ComponentContent(this.context, wrapBuilder(buildText));
	baseVm: BaseViewModel = new BaseViewModel();

	build() {
		Column(){
			ArcList({
				initialIndex: 0, header: this.header
			}) {
				ForEach(MODES, (item: string, index) => {
					ArcListItem() {
						Row({space: 20}) {
							Text(item)
								.fontSize(16)
								.fontColor(Color.White)
								.fontWeight(FontWeight.Bold)
						}
						.padding({
							left: 26,
							bottom: 12,
							top: 12,
							right: 26,
						})
						.backgroundColor("#ff203558")
						.width('95%')
						.height('100px')
						.borderRadius(48)
						.borderWidth(1)
						.borderColor(Color.Orange)
					}
					.onClick(() => {
						if (item === MODES_ENUMS.Easy) {
							AppStorage.setOrCreate('selectedMode', Mode.EASY);
						} else if(item === MODES_ENUMS.Medium) {
							AppStorage.setOrCreate('selectedMode', Mode.MEDIUM);
						} else if(item === MODES_ENUMS.Hard) {
							AppStorage.setOrCreate('selectedMode', Mode.HARD);
						} else if(item === MODES_ENUMS.Expert) {
							AppStorage.setOrCreate('selectedMode', Mode.EXPERT);
						}
						this.baseVm.navigateToPage('Training')
					})
					.width('90%')
					.margin({ bottom: 10 })
				}, (item: string) => item);
			}
			.scrollBar(BarState.Off)
			.zIndex(2)
			.margin({top: 6})
			.padding({top:8, bottom: 8})
			.height('100%')
			.width('100%')
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
