//
//  ViewController.swift
//  UIKit-Basic2
//
//  Created by Jungjin Park on 2024-05-21.
//

import UIKit

struct Animal {
    let name: String
}
struct AnimalCategory {
    let category: String
    let animals: [Animal]
}
class ViewController: UIViewController, UITableViewDataSource {
    
    let categories = [
        AnimalCategory(category: "Mammalia", animals: [Animal(name: "Cat"),Animal(name: "Dog")]),
        AnimalCategory(category: "Reptile", animals: [Animal(name: "Turtle"),Animal(name: "Lizard")])
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: view.bounds, style: .insetGrouped)
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories[section].animals.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section].category
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // "cell" 식별자를 가진 재사용 가능한 셀을 큐에 있으면 재사용하고 아니면 새로 만들어라
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        var config = cell.defaultContentConfiguration()
        config.text = categories[indexPath.section].animals[indexPath.row].name
        cell.contentConfiguration = config
        return cell
    }
}
