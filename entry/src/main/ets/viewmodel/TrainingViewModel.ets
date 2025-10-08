import { ModeCopy } from '../model/TrainingTypes'
import { getModeCopy } from '../utils/TrainingCopy'

export class TrainingViewModel {
  static load(mode: number): ModeCopy {
    const copy: ModeCopy = getModeCopy(mode)
    return copy
  }
}
