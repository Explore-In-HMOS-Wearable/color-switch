import { NavigationService } from '../services/NavigationService';
import { HomePage } from './HomePage'
import { TrainingListPage } from './TrainingListPage '
import { ModeListPage } from './ModeListPage'
import { GamePage } from './GamePage'
import { ResultPage } from './ResultPage'
import { TrainingPage } from './TrainingPage'

@Entry
@Component
struct Index {
  navigationService: NavigationService = NavigationService.getInstance();

  @Builder
  routeMap(name: string) {
    NavDestination() {
      if (name === 'Home') {
        HomePage()
      } else if (name === 'TrainingList') {
        TrainingListPage()
      } else if (name === 'Training') {
        TrainingPage()
      } else if (name === 'ModeList') {
        ModeListPage();
      } else if (name === 'Game') {
        GamePage();
      } else if (name === 'Result') {
        ResultPage();
      }
    }
    .hideTitleBar(true)
  }

  build() {
    Navigation(this.navigationService.pageInfos) {
      HomePage();
    }
    .mode(NavigationMode.Stack)
    .navDestination(this.routeMap)
    .ignoreLayoutSafeArea()
    .hideTitleBar(true)
    .width('100%')
    .height('100%')
  }
}