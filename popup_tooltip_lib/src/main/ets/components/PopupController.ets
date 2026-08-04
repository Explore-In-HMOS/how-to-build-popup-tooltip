@ObservedV2
export class PopupController {
  @Trace isShow: boolean = false;

  private timerId: number = -1;

  show(): void {
    this.clearTimer();
    this.isShow = true;
  }

  hide(): void {
    this.clearTimer();
    this.isShow = false;
  }

  toggle(): void {
    if (this.isShow) {
      this.hide();
    } else {
      this.show();
    }
  }

  showFor(duration: number): void {
    this.show();
    if (duration > 0) {
      this.timerId = setTimeout(() => {
        this.isShow = false;
        this.timerId = -1;
      }, duration);
    }
  }

  private clearTimer(): void {
    if (this.timerId !== -1) {
      clearTimeout(this.timerId);
      this.timerId = -1;
    }
  }
}
