//
//  ViewController.swift
//  UIKit-Basic2
//
//  Created by Jungjin Park on 2024-05-21.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(image: UIImage(systemName: "star.fill"))
        imageView.frame = CGRect(x: view.bounds.midX-100, y: view.bounds.midY-100, width: 200, height: 200)
        imageView.isUserInteractionEnabled = true
        view.addSubview(imageView)
        
        let gesture = UIRotationGestureRecognizer(target: self, action: #selector(handleGesture))
        imageView.addGestureRecognizer(gesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinchGesture))
        imageView.addGestureRecognizer(pinchGesture)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        imageView.addGestureRecognizer(panGesture)
        
        gesture.delegate = self
        pinchGesture.delegate = self
        panGesture.delegate = self
    }
    // 단일 제스처 허용 여부
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer is UIPanGestureRecognizer {
            return true
        } else {
            return true
        }
    }
    // 복합 제스처 허용 여부
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        print("\(gestureRecognizer), \(otherGestureRecognizer)")
        return true
    }
    @objc func handleGesture(_ sender: UIRotationGestureRecognizer) {
        if let view = sender.view {
            view.transform = view.transform.rotated(by: sender.rotation)
            sender.rotation = 0
        }
    }
    @objc func handlePinchGesture(_ sender: UIPinchGestureRecognizer) {
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
    @objc func handlePanGesture(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        if let view = sender.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
            sender.setTranslation(.zero, in: view)
        }
    }
}
