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
        
        let imageView = UIImageView(image: UIImage(systemName: "star.fill"))
        imageView.frame = CGRect(x: 100, y: 300, width: 200, height: 200)
        imageView.isUserInteractionEnabled = true
        
        view.addSubview(imageView)
        
        let gesture = UIPinchGestureRecognizer(target: self, action: #selector(handleGesture))
        imageView.addGestureRecognizer(gesture)
    }
    @objc func handleGesture(_ sender: UIPinchGestureRecognizer){
        print("\(sender.scale)")
        if let view = sender.view {
            view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale)
        }
    }
}
