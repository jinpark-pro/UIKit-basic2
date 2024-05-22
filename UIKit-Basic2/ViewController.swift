//
//  ViewController.swift
//  UIKit-Basic2
//
//  Created by Jungjin Park on 2024-05-21.
//

import UIKit

class ViewController: UIViewController, UIContextMenuInteractionDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rectangle = UIView()
        rectangle.backgroundColor = .gray
        rectangle.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        
        view.addSubview(rectangle)
        
        let contextMenu = UIContextMenuInteraction(delegate: self)
        rectangle.addInteraction(contextMenu)
    }
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            let redAction = UIAction(title: "Red", image: nil) { _ in
                interaction.view?.backgroundColor = .red
            }
            let purpleAction = UIAction(title: "Purple", image: nil) { _ in
                interaction.view?.backgroundColor = .purple
            }
            let greenAction = UIAction(title: "Green", image: nil) { _ in
                interaction.view?.backgroundColor = .green
            }
            let orangeAction = UIAction(title: "Orange", image: nil) { _ in
                interaction.view?.backgroundColor = .orange
            }
            
            let colorMenu = UIMenu(title: "Color", options: .displayInline, children: [redAction, purpleAction])
            let otherMenu = UIMenu(title: "Others", options: .displayInline, children: [greenAction, orangeAction])
            
            return UIMenu(title: "", children: [colorMenu, otherMenu])
        }
    }
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configuration: UIContextMenuConfiguration, highlightPreviewForItemWithIdentifier identifier: any NSCopying) -> UITargetedPreview? {
        guard let view = interaction.view else { return nil }
        return UITargetedPreview(view: view)
    }
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration, animator: any UIContextMenuInteractionCommitAnimating) {
        if let view = interaction.view {
            let transition = CATransition()
            transition.type = .fade
            transition.duration = 0.3
            view.layer.add(transition, forKey: nil)
            animator.addCompletion {
                print("action Performed")
            }
        }
    }
}
