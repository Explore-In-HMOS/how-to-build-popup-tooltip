import { PopupController } from './PopupController';
import { BubbleOptions } from './PopupTypes';
import { PopupContentView } from './PopupContentView';

@ComponentV2
export struct PopupHost {
  @Param controller: PopupController = new PopupController();
  @Param options: BubbleOptions = {};

  @Builder
  defaultContent() {}

  @BuilderParam content: () => void = this.defaultContent;

  @Builder
  popupBuilder() {
    PopupContentView({ options: this.options, controller: this.controller })
  }

  build() {
    Column() {
      this.content()
    }
    .bindPopup(this.controller.isShow, {
      builder: this.popupBuilder,
      placement: this.options.placement ?? Placement.Bottom,
      popupColor: this.options.popupColor,
      mask: this.options.mask ?? false,
      enableArrow: this.options.enableArrow ?? true,
      autoCancel: this.options.autoCancel ?? true,
      onStateChange: (e) => {
        if (!e.isVisible) {
          this.controller.hide();
        }
      }
    })
  }
}
