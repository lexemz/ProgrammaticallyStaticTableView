//
//  TableViewController.swift
//  ProgrammaticallyStaticTableView
//
//  Created by Igor on 25.01.2022.
//

import UIKit

enum TableViewControllerCells: String, CaseIterable {
    case today = "Сегодня"
    case week = "Неделя"
    case archive = "Архив"
    
    var icon: String {
        switch self {
            
        case .today: return "clock"
        case .week: return "calendar"
        case .archive: return "archivebox"
        }
    }
}

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Hello"
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TableViewControllerCells.allCases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        let currentCellContent = TableViewControllerCells.allCases[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = currentCellContent.rawValue
        content.image = UIImage(systemName: currentCellContent.icon)
        
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator // Arrows
        return cell
    }

}
