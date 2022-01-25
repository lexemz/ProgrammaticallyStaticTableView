//
//  TableViewController.swift
//  ProgrammaticallyStaticTableView
//
//  Created by Igor on 25.01.2022.
//

import UIKit

enum TableViewControllerConfiguration: String, CaseIterable {
    case first = "Категория 1"
    case second = "Категория 2"
    case third = "Категория 3"
    
    static let cells = [
        Self.first: [
            CellForTableView(name: "Ячейка 1", iconName: "alarm"),
            CellForTableView(name: "Ячейка 2", iconName: "keyboard")
        ],
        Self.second: [
            CellForTableView(name: "Ячейка 1", iconName: "clock")
        ]
    ]
}

struct CellForTableView {
    let name: String
    let icon: UIImage
    
    init(name: String, iconName: String) {
        self.name = name
        self.icon = UIImage(systemName: iconName) ?? UIImage()
    }
}

class TableViewController: UITableViewController {
    
    private let cells = TableViewControllerConfiguration.cells

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Hello"
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        TableViewControllerConfiguration.allCases.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        TableViewControllerConfiguration.allCases[section].rawValue
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = TableViewControllerConfiguration.allCases[section]
        guard let values = cells[key] else { return 0 }
        return values.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        let key = TableViewControllerConfiguration.allCases[indexPath.section]
        let value = cells[key]?[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = value?.name
        content.image = value?.icon
        
        cell.contentConfiguration = content
        return cell
    }
}
