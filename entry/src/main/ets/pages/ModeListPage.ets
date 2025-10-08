import { ArcList, ArcListItem, ArcListAttribute, ArcListItemAttribute, ComponentContent } from '@kit.ArkUI';
import { getQuestionsShuffled } from '../utils/QuestionBank';
import { BaseViewModel } from '../viewmodel/BaseViewModel';
import { MODES, MODES_ENUMS } from '../viewmodel/Modes';
import { UnlockPrefs, UnlockStatus } from '../utils/UnlockPrefs';
import { common } from '@kit.AbilityKit';

@Builder
function buildHeader() {
	Column() {
		Text('Play A Mode')
			.fontSize(20)
			.fontWeight(FontWeight.Bolder)
			.fontColor(Color.White)
	}
	.margin(6)
}

@Entry
@Component
export struct ModeListPage  {
	uiContext: UIContext = this.getUIContext()
	header: ComponentContent<Object> = new ComponentContent(this.uiContext, wrapBuilder(buildHeader));
	baseVm: BaseViewModel = new BaseViewModel();

	@State unlockedEasy: boolean = false
	@State unlockedMedium: boolean = false
	@State unlockedHard: boolean = false
	@State unlockedExpert: boolean = false
	@StorageLink('context') context: Context | undefined =  AppStorage.get('context')

	aboutToAppear(): void {
		const ctx = this.context as common.Context
		const all: UnlockStatus = UnlockPrefs.getAll(ctx)
		this.unlockedEasy = all.unlocked_easy
		this.unlockedMedium = all.unlocked_medium
		this.unlockedHard = all.unlocked_hard
		this.unlockedExpert = all.unlocked_expert

		console.error('tag', this.unlockedEasy + '')
	}

	private normalizeMode(name: string): string {
		return (name || '').trim()
	}

	private isModeUnlocked(name: string): boolean {
		const mode = this.normalizeMode(name)
		if (mode === MODES_ENUMS.Easy)   return this.unlockedEasy
		if (mode === MODES_ENUMS.Medium) return this.unlockedMedium
		if (mode === MODES_ENUMS.Hard)   return this.unlockedHard
		if (mode === MODES_ENUMS.Expert) return this.unlockedExpert
		return false
	}

	private startMode(name: string): void {
		const mode = this.normalizeMode(name)

		if (!this.isModeUnlocked(mode)) {
			console.warn(`[ModeList] Mode locked: ${mode}`)
			return
		}

		if (mode === MODES_ENUMS.Easy) {
			AppStorage.setOrCreate('game_list', getQuestionsShuffled(MODES_ENUMS.Easy))
			AppStorage.setOrCreate('game_mode', MODES_ENUMS.Easy)
		} else if (mode === MODES_ENUMS.Medium) {
			AppStorage.setOrCreate('game_list', getQuestionsShuffled(MODES_ENUMS.Medium))
			AppStorage.setOrCreate('game_mode', MODES_ENUMS.Medium)
		} else if (mode === MODES_ENUMS.Hard) {
			AppStorage.setOrCreate('game_list', getQuestionsShuffled(MODES_ENUMS.Hard))
			AppStorage.setOrCreate('game_mode', MODES_ENUMS.Hard)
		} else if (mode === MODES_ENUMS.Expert) {
			AppStorage.setOrCreate('game_list', getQuestionsShuffled(MODES_ENUMS.Expert))
			AppStorage.setOrCreate('game_mode', MODES_ENUMS.Expert)
		} else {
			AppStorage.setOrCreate('game_list', getQuestionsShuffled(MODES_ENUMS.Easy))
			AppStorage.setOrCreate('game_mode', MODES_ENUMS.Easy)
		}

		this.baseVm.navigateToPage('Game')
	}

	build() {
		Column() {
			ArcList({
				initialIndex: 0,
				header: this.header
			}) {
				ForEach(MODES, (item: string, index) => {
					ArcListItem() {
						Row({ space: 12 }) {
							if (this.isModeUnlocked(item)) {
								Text('▶')
									.fontSize(14)
									.fontColor(Color.Orange)
							} else {
								Text('🔒')
									.fontSize(14)
									.fontColor(Color.Gray)
							}

							Text(item)
								.fontSize(16)
								.fontWeight(FontWeight.Bold)
								.fontColor(this.isModeUnlocked(item) ? Color.White : Color.Gray)

							Blank()
							Text(this.isModeUnlocked(item) ? 'Unlocked' : 'Locked')
								.fontSize(12)
								.fontColor(this.isModeUnlocked(item) ? Color.Orange : Color.Gray)
						}
						.padding({ left: 26, right: 26, top: 12, bottom: 12 })
						.backgroundColor(this.isModeUnlocked(item) ? '#ff203558' : '#40203558')
						.width('95%')
						.height('100px')
						.borderRadius(48)
						.borderWidth(1)
						.borderColor(this.isModeUnlocked(item) ? Color.Orange : Color.Gray)
						.opacity(this.isModeUnlocked(item) ? 1.0 : 0.7)
					}
					.onClick(() => this.startMode(item))
					.width('90%')
					.margin({ bottom: 10 })
				}, (item: string) => item)
			}
			.scrollBar(BarState.Off)
			.zIndex(2)
			.margin({ top: 6 })
			.padding({ top: 8, bottom: 8 })
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
