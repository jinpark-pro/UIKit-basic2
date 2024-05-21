//
//  ViewController.swift
//  UIKit-Basic2
//
//  Created by Jungjin Park on 2024-05-21.
//

import UIKit
import WebKit
import SafariServices

class ViewController: UIViewController {
    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: .zero)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.isHidden = true
        return webView
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .close)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction(UIAction { [weak self] _ in
            print("close button touched")
            self?.webView.isHidden = true
        }, for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let linkButton = UIButton(type: .system)
        var conf = UIButton.Configuration.filled()
        conf.title = "Apple"
        linkButton.configuration = conf
        linkButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
        linkButton.translatesAutoresizingMaskIntoConstraints = false
        
        linkButton.addAction(UIAction { [weak self] _ in
            if let url = URL(string: "https://www.apple.com") {
//                UIApplication.shared.open(url)
                self?.openInWebView(url: url)
//                let safariViewController = SFSafariViewController(url: url)
//                safariViewController.modalPresentationStyle = .pageSheet
//                self?.present(safariViewController, animated: true)
            }
        }, for: .touchUpInside)
        
        view.addSubview(linkButton)
        webView.addSubview(closeButton)
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            linkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            linkButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            closeButton.topAnchor.constraint(equalTo: webView.topAnchor, constant: -30),
            closeButton.trailingAnchor.constraint(equalTo: webView.trailingAnchor, constant: -10)
        ])
    }
    
    func openInWebView(url: URL) {
        let request = URLRequest(url: url)
        webView.load(request)
        webView.isHidden = false
    }
}
