//
//  TableViewController.swift
//  ControlledCells
//
//  Created by Connor Neville on 4/12/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import Reinstate
import Reusable
import UIKit

extension UITableViewCell: Reusable { }

class TableViewController: UITableViewController {

    fileprivate var cellControllers: [IndexPath: UIViewController] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Controller-Backed Cells Demo"

        tableView.register(cellType: UITableViewCell.self)
    }

}

extension TableViewController {

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section + 1)"
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(for: indexPath)

        let controller = CellViewController(indexPath: indexPath)
        addChild(controller, constrainedTo: cell.contentView)
        cellControllers[indexPath] = controller

        return cell
    }

    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let existingChild = cellControllers[indexPath]!
        removeChild(existingChild, constrainedTo: cell.contentView)
        cellControllers[indexPath] = nil
    }

}
