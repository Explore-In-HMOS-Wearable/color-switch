import vibrator from '@ohos.vibrator';


type VibrateUsage = 'unknown' | 'notification' | 'ring' | 'alarm';
interface VibrateAttribute { usage: VibrateUsage }
interface TimeVibrateEffect { type: 'time'; duration: number }


export class HapticService {
  async vibrate(ms: number): Promise<void> {
    try {
      await vibrator.startVibration({ type: 'time', duration: ms } as TimeVibrateEffect, { usage: 'unknown' } as VibrateAttribute);
    } catch (e) {
      console.error('vibration error', JSON.stringify(e));
    }
  }
  dot(): void { void this.vibrate(60); }
  dash(): void { void this.vibrate(180); }
  gap(ms: number = 120): Promise<void> { return new Promise(res => setTimeout(res, ms)); }
  ok(): void { void this.vibrate(220); }
  nok(): void { void this.vibrate(80); setTimeout(() => { void this.vibrate(80); }, 140); }
}