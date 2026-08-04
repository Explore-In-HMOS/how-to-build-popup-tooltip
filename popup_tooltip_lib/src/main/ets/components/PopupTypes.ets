export interface BubbleTextOptions {
  content: ResourceStr;
  fontSize?: Length;
  fontColor?: ResourceColor;
  fontWeight?: FontWeight;
  textAlign?: TextAlign;
  maxLines?: number;
}

export interface BubbleIconOptions {
  image: ResourceStr;
  width?: Length;
  height?: Length;
  fillColor?: ResourceColor;
}

export interface BubbleButtonOptions {
  label: ResourceStr;
  action: () => void;
  fontColor?: ResourceColor;
  backgroundColor?: ResourceColor;
}

export interface BubbleMaskColor {
  color: ResourceColor;
}

export type BubbleMask = boolean | BubbleMaskColor;

export interface BubbleOptions {
  icon?: BubbleIconOptions;
  title?: BubbleTextOptions;
  text?: BubbleTextOptions;
  buttons?: BubbleButtonOptions[];
  placement?: Placement;
  popupColor?: ResourceColor;
  mask?: BubbleMask;
  enableArrow?: boolean;
  autoCancel?: boolean;
  width?: Length;
  radius?: Length;
}

export interface TooltipOptions {
  text: ResourceStr;
  placement?: Placement;
  fontSize?: Length;
  fontColor?: ResourceColor;
  backgroundColor?: ResourceColor;
  duration?: number;
}
