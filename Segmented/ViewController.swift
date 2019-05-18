import UIKit

class ViewController: UIViewController {
    private let viewControllers = [FirstViewController(), SecondViewController(), ThirdViewController()]

    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["1", "2", "3"])
        segmentedControl.addTarget(self, action: #selector(changeColor(sender:)), for: .valueChanged)
        segmentedControl.layer.cornerRadius = 8
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        segmentedControl.layer.cornerRadius = 8
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8)
        let bottomConstraint = segmentedControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint, bottomConstraint])

        changeColor(sender: segmentedControl)
    }

    @objc private func changeColor(sender: UISegmentedControl) {
        for child in children {
            remove(childViewController: child)
        }
        guard sender.selectedSegmentIndex < viewControllers.endIndex else {
            assertionFailure("Invalid selectedSegmentIndex")
            add(childViewController: viewControllers[0])
            return
        }
        add(childViewController: viewControllers[sender.selectedSegmentIndex])
    }

    private func add(childViewController: UIViewController) {
        addChild(childViewController)
        view.addSubview(childViewController.view, withConstraintsToEdgesOf: view, below: segmentedControl)
        childViewController.didMove(toParent: self)
    }

    private func remove(childViewController: UIViewController) {
        childViewController.willMove(toParent: nil)
        childViewController.view.removeFromSuperview()
        childViewController.removeFromParent()
    }
}

