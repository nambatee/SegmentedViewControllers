import UIKit

extension UIView {
    func addSubview(_ subview: UIView, withConstraintsToEdgesOf view: UIView, below belowSubview: UIView? = nil) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        if let belowSubview = belowSubview {
            insertSubview(subview, belowSubview: belowSubview)
        } else {
            addSubview(subview)
        }
        let trailingConstraint = subview.trailingAnchor.constraint(equalTo: trailingAnchor)
        let leadingConstraint = subview.leadingAnchor.constraint(equalTo: leadingAnchor)
        let topConstraint = subview.topAnchor.constraint(equalTo: topAnchor)
        let bottomConstraint = subview.bottomAnchor.constraint(equalTo: bottomAnchor)
        NSLayoutConstraint.activate([trailingConstraint, leadingConstraint, topConstraint, bottomConstraint])
    }
}
