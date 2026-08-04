import { BubbleOptions, PopupController, PopupHost, TooltipHost, TooltipOptions } from 'popup_tooltip_lib';

@Preview
@Entry
export struct Index {
  private scroller: Scroller = new Scroller()
  private popupCtrl: PopupController = new PopupController();
  private tipCtrl: PopupController = new PopupController();
  private popupOptions: BubbleOptions = {
    icon: { image: $r('app.media.foreground'), width: 18, height: 18, fillColor: '#007DFF' },
    title: {
      content: 'Do you want to log out?',
      fontSize: 16,
      fontColor: '#FFFFFF',
      maxLines: 2
    },
    popupColor: '#1F2A44',
    placement: Placement.Bottom,
    mask: true,
    buttons: [{
      label: 'Logout', action: () => {
      }, fontColor: '#FA5151'
    }, {
      label: 'Cancel', action: () => {
      }, fontColor: '#ffffff'
    }
    ]
  };
  private tooltipOptions: TooltipOptions = {
    text: 'Learn how we collect, use, and protect your data.',
    placement: Placement.Top,
    duration: 1500
  };

  build() {
    Scroll(this.scroller) {
      Column({ space: 4 }) {
        Text('Settings')
          .maxFontSize('38fp')
          .minFontSize('30fp')
          .maxLines(2)
          .textAlign(TextAlign.Center)
          .fontColor(Color.White)
          .width('100%')
          .padding({ top: '16%', bottom: '4%' })
          .focusable(true);

        TooltipHost({ controller: this.tipCtrl, options: this.tooltipOptions }) {
          SettingsItemComponent({ mainText: 'Privacy Policy' })
        }

        SettingsItemComponent({ mainText: 'Contact us' })

        PopupHost({ controller: this.popupCtrl, options: this.popupOptions }) {
          SettingsItemComponent({ mainText: 'Log out' })
            .onClick(() => this.popupCtrl.toggle())
        }
      }
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .height('100%')
    .padding({ bottom: '32vp' })
    .focusOnTouch(true)
    .defaultFocus(true)
    .backgroundColor('#082026')
    .scrollBar(BarState.Off);
  }
}

@ComponentV2
export struct SettingsItemComponent {
  @Param mainText: string = '';
  @Param secondaryText: string = '';

  build() {
    Row() {
      Column() {
        Text(this.mainText)
          .maxLines(1)
          .maxFontSize('32fp')
          .minFontSize('10fp')
          .fontColor(Color.White)
          .fontWeight(FontWeight.Medium)
          .height(this.secondaryText.length ? null : '100px')
          .focusable(true);

        if (this.secondaryText) {
          Text(this.secondaryText)
            .maxFontSize('26fp')
            .minFontSize('13fp')
            .fontWeight(FontWeight.Medium)
            .fontColor('#7C9298')
            .textAlign(TextAlign.Start)
            .focusable(true);
        }
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1);
    }
    .width('90%')
    .padding({
      right: 18,
      left: 18
    })
    .backgroundColor('#0D3640')
    .borderRadius(9999)
  }
}
