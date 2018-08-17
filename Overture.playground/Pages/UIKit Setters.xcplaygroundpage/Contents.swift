import Overture
import UIKit

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

func buttonTitle(_ title: String, for state: UIControl.State = .normal) -> (UIButton) -> Void {
  return { $0.setTitle(title, for: state) }
}

func buttonTitleColor(_ color: UIColor, for state: UIControl.State = .normal) -> (UIButton) -> Void {
  return { $0.setTitleColor(color, for: state) }
}

// App Styles

let baseButtonStyle: (UIButton) -> Void = concat(
  mut(\.contentEdgeInsets, .init(top: 12, left: 16, bottom: 12, right: 16)),
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

//

class PillView: UIView {
  let label = UILabel()
  let imageView = UIImageView()
  private let stackView = with(UIStackView(), mut(\.spacing, 10))

  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    with(self, mut(\.clipsToBounds, true))
    self.stackView.addArrangedSubview(imageView)
    self.stackView.addArrangedSubview(label)
    self.addSubview(with(self.stackView, autolayoutStyle))
    NSLayoutConstraint.activate(
      [
        self.stackView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
        self.stackView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor),
        self.stackView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
        self.stackView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
        ]
    )
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    self.layer.cornerRadius = self.bounds.midY
  }
}

private let basePillViewStyle: (PillView) -> Void = concat(
  { pillLabelStyle($0.label) },
  autolayoutStyle,
  { $0.layoutMargins = .init(top: 30, left: 40, bottom: 30, right: 40) }
//  { $0.transform = .init(scaleX: 0, y: 0) }
)

private let pillViewStyle = concat(
  basePillViewStyle,
  { $0.backgroundColor = .init(white: 1, alpha: 0.3) }
)

private let greenPillViewStyle = concat(
  basePillViewStyle,
  mut(\.backgroundColor, .green)
)

private let redPillViewStyle = concat(
  basePillViewStyle,
  mut(\.backgroundColor, .red)
)

private let pillLabelStyle = concat(
  mut(\UILabel.font, .systemFont(ofSize: 30, weight: .bold)),
  mut(\.textColor, .white)
)

let pill = with(PillView(), greenPillViewStyle)
pill.label.text = "Correct"
pill.sizeToFit()
pill.translatesAutoresizingMaskIntoConstraints = false
let view = UIView(frame: .init(x: 0, y: 0, width: 400, height: 400))
view.addSubview(pill)

import PlaygroundSupport
PlaygroundPage.current.liveView = pill
