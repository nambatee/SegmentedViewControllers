import UIKit

class ThirdViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        let label = UILabel()
        label.text = "SecondViewController"
        view.addSubview(label, withConstraintsToEdgesOf: view)
    }
}
