import UIKit

class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
        let label = UILabel()
        label.text = "FirstViewController"
        view.addSubview(label, withConstraintsToEdgesOf: view)
    }
}
