//
//  ViewController.swift
//  UIKit-Basic2
//
//  Created by Jungjin Park on 2024-05-21.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.title = "Color Picker"
        config.cornerStyle = .capsule
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // 실제로 소유하고 있지는 않으나 강한 참조를 하고자 할때 unowned 를 사용
        // 뷰가 사라지기 전에는 self 가 사라질 수 없는 구조라서 unowned 를 사용
        // optional 한 값으로 인해서 값의 존재 여부를 판단하는 구조가 들어가고, 코드에 ?를 사용해야 함
        button.addAction(UIAction { [unowned self] _ in
            let colorPicker = UIColorPickerViewController()
            colorPicker.delegate = self
            colorPicker.supportsAlpha = false
            colorPicker.selectedColor = view.backgroundColor ?? .white
            self.present(colorPicker, animated: true)
        }, for: .touchUpInside)
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
extension ViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        view.backgroundColor = viewController.selectedColor
    }
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        dismiss(animated: true)
    }
}
