import UIKit

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.purple
        let label = UILabel()
        label.text = "SecondViewController"
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label, withConstraintsToEdgesOf: view)
    }

}
