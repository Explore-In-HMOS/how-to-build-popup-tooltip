import { PopupController } from './PopupController';
import { BubbleOptions, BubbleButtonOptions } from './PopupTypes';

export interface PopupContentParams {
  options: BubbleOptions;
  controller: PopupController;
}

const DEFAULT_TITLE_COLOR: ResourceColor = '#182431';
const DEFAULT_TEXT_COLOR: ResourceColor = '#99182431';
const DEFAULT_BTN_COLOR: ResourceColor = '#007DFF';
const DEFAULT_MAX_WIDTH: Length = 200;

@Builder
export function PopupContentView(params: PopupContentParams) {
  Column({ space: 8 }) {
    if (params.options.icon !== undefined || params.options.title !== undefined) {
      Row({ space: 6 }) {
        if (params.options.icon !== undefined) {
          if (params.options.icon.fillColor !== undefined) {
            Image(params.options.icon.image)
              .width(params.options.icon.width ?? 18)
              .height(params.options.icon.height ?? 18)
              .fillColor(params.options.icon.fillColor)
          } else {
            Image(params.options.icon.image)
              .width(params.options.icon.width ?? 18)
              .height(params.options.icon.height ?? 18)
          }
        }
        if (params.options.title !== undefined) {
          Text(params.options.title.content)
            .fontSize(params.options.title.fontSize ?? 14)
            .fontColor(params.options.title.fontColor ?? DEFAULT_TITLE_COLOR)
            .fontWeight(params.options.title.fontWeight ?? FontWeight.Bold)
            .textAlign(params.options.title.textAlign ?? TextAlign.Start)
            .maxLines(params.options.title.maxLines ?? 1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }
      }
      .alignItems(VerticalAlign.Center)
    }

    if (params.options.text !== undefined) {
      Text(params.options.text.content)
        .fontSize(params.options.text.fontSize ?? 12)
        .fontColor(params.options.text.fontColor ?? DEFAULT_TEXT_COLOR)
        .fontWeight(params.options.text.fontWeight ?? FontWeight.Normal)
        .textAlign(params.options.text.textAlign ?? TextAlign.Start)
        .maxLines(params.options.text.maxLines ?? 2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
    }

    if (params.options.buttons !== undefined && params.options.buttons.length > 0) {
      Row({ space: 8 }) {
        ForEach(params.options.buttons, (btn: BubbleButtonOptions) => {
          Button(btn.label)
            .fontSize(12)
            .fontColor(btn.fontColor ?? DEFAULT_BTN_COLOR)
            .backgroundColor(btn.backgroundColor ?? Color.Transparent)
            .height(28)
            .padding({ left: 12, right: 12 })
            .onClick(() => {
              btn.action();
              params.controller.hide();
            })
        }, (btn: BubbleButtonOptions, index: number) => `${btn.label}`)
      }
      .justifyContent(FlexAlign.Center)
    }
  }
  .alignItems(HorizontalAlign.Start)
  .padding(12)
  .constraintSize({ maxWidth: params.options.width ?? DEFAULT_MAX_WIDTH })
}
