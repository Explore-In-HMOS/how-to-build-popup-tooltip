import { PopupController } from './PopupController';
import { TooltipOptions } from './PopupTypes';

const DEFAULT_TOOLTIP_BG: ResourceColor = '#CC000000';
const DEFAULT_TOOLTIP_FG: ResourceColor = '#FFFFFF';
const DEFAULT_TOOLTIP_DURATION: number = 1500;
const DEFAULT_TOOLTIP_MAXWIDTH: Length = 180;

@ComponentV2
export struct TooltipHost {
  @Param controller: PopupController = new PopupController();
  @Param options: TooltipOptions = { text: '' };

  @Builder
  defaultContent() {}

  @BuilderParam content: () => void = this.defaultContent;

  @Builder
  tooltipBuilder() {
    Text(this.options.text)
      .fontSize(this.options.fontSize ?? 12)
      .fontColor(this.options.fontColor ?? DEFAULT_TOOLTIP_FG)
      .maxLines(2)
      .textOverflow({ overflow: TextOverflow.Ellipsis })
      .padding({ left: 12, right: 12, top: 6, bottom: 6 })
      .constraintSize({ maxWidth: DEFAULT_TOOLTIP_MAXWIDTH })
  }

  build() {
    Column() {
      this.content()
    }
    .gesture(
      LongPressGesture({ repeat: false })
        .onAction(() => {
          this.controller.showFor(this.options.duration ?? DEFAULT_TOOLTIP_DURATION);
        })
    )
    .bindPopup(this.controller.isShow, {
      builder: this.tooltipBuilder,
      placement: this.options.placement ?? Placement.Top,
      popupColor: this.options.backgroundColor ?? DEFAULT_TOOLTIP_BG,
      mask: false,
      enableArrow: true,
      autoCancel: true,
      onStateChange: (e) => {
        if (!e.isVisible) {
          this.controller.hide();
        }
      }
    })
  }
}
