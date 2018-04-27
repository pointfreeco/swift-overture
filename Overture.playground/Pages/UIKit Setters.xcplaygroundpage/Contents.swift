import Overture
import UIKit

let topBottom = concat(mut(\UIEdgeInsets.top), mut(\.bottom))
let leftRight = concat(mut(\UIEdgeInsets.left), mut(\.right))
let topBottomLeftRight = concat(topBottom, leftRight)

with(.zero, topBottom(8))
with(.zero, concat(topBottom(8), leftRight(12)))
with(.zero, topBottomLeftRight(16))

// Base Styles

let autolayoutStyle = mut(\UIView.translatesAutoresizingMaskIntoConstraints, false)

let roundedStyle = concat(
  mut(\UIView.clipsToBounds, true),
  mut(\.layer.cornerRadius, 6)
)

func borderStyle(color: UIColor, width: CGFloat) -> (UIView) -> Void {
  return concat(
    mut(\UIView.layer.borderColor, color.cgColor),
    mut(\.layer.borderWidth, width)
  )
}

func buttonFont(_ font: UIFont) -> (UIButton) -> Void {
  return { $0.titleLabel?.font = font }
}

func buttonTitle(_ title: String, for state: UIControlState = .normal) -> (UIButton) -> Void {
  return { $0.setTitle(title, for: state) }
}

func buttonTitleColor(_ color: UIColor, for state: UIControlState = .normal) -> (UIButton) -> Void {
  return { $0.setTitleColor(color, for: state) }
}

// App Styles

let baseButtonStyle: (UIButton) -> Void = concat(
  mver(\.contentEdgeInsets, concat(topBottom(12), leftRight(16))),
  buttonFont(.systemFont(ofSize: 16))
)

let roundButtonStyle = concat(
  baseButtonStyle,
  roundedStyle
)

let filledButtonStyle = concat(
  roundButtonStyle,
  mut(\.backgroundColor, .black),
  mut(\.tintColor, .white)
)

let borderButtonStyle = concat(
  roundButtonStyle,
  borderStyle(color: .black, width: 2),
  buttonTitleColor(.black)
)

let nextButton = with(
  UIButton(),
  concat(
    filledButtonStyle,
    buttonTitle("Next")
  )
)

let cancelButton = with(
  UIButton(),
  concat(
    borderButtonStyle,
    buttonTitle("Cancel")
  )
)
