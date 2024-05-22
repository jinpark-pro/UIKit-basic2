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
        guard let view = sender.view else { return }
        // scale 범위 한정
        let currentScale = sqrt(view.transform.a * view.transform.a + view.transform.c * view.transform.c)
        if sender.scale < 1.0 {
            if currentScale > 0.8 {
                view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale)
            }
        } else {
            if currentScale < 1.2 {
                view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale)
            }
        }
    }
}
