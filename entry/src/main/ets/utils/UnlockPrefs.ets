import { preferences } from '@kit.ArkData';
import { common } from '@kit.AbilityKit';
import { Mode } from '../model/TrainingTypes';

const FILE_NAME = 'unlockStore';

function keyForMode(mode: Mode): string {
  switch (mode) {
    case Mode.EASY: return 'unlocked_easy';
    case Mode.MEDIUM: return 'unlocked_medium';
    case Mode.HARD: return 'unlocked_hard';
    case Mode.EXPERT: return 'unlocked_expert';
    default: return 'unlocked_unknown';
  }
}

export class UnlockPrefs {
  private static prefs: preferences.Preferences | null = null;

  private static ensure(ctx: common.Context): void {
    if (UnlockPrefs.prefs !== null) {
      return;
    }
    const options: preferences.Options = { name: FILE_NAME };
    UnlockPrefs.prefs = preferences.getPreferencesSync(ctx, options);
  }

  static isUnlocked(ctx: common.Context, mode: Mode): boolean {
    UnlockPrefs.ensure(ctx);
    const val = UnlockPrefs.prefs!.getSync(keyForMode(mode), false) as boolean;
    return val === true;
  }

  static setUnlocked(ctx: common.Context, mode: Mode, value: boolean, onDone?: () => void): void {
    UnlockPrefs.ensure(ctx);
    UnlockPrefs.prefs!.putSync(keyForMode(mode), value);
    UnlockPrefs.prefs!.flush((err) => {
      if (err) {
        console.error(`tag UnlockPrefs.flush failed code=${err}, msg=${err.message}`);
      } else {
        console.info('tag UnlockPrefs.flush ok');
        onDone && onDone();
      }
    });
  }

  static getAll(ctx: common.Context): UnlockStatus {
    return {
      unlocked_easy: UnlockPrefs.isUnlocked(ctx, Mode.EASY),
      unlocked_medium: UnlockPrefs.isUnlocked(ctx, Mode.MEDIUM),
      unlocked_hard: UnlockPrefs.isUnlocked(ctx, Mode.HARD),
      unlocked_expert: UnlockPrefs.isUnlocked(ctx, Mode.EXPERT),
    };
  }
}

export interface UnlockStatus {
  unlocked_easy: boolean
  unlocked_medium: boolean
  unlocked_hard: boolean
  unlocked_expert: boolean
}
