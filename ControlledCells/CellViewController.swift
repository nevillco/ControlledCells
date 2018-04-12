//
//  CellViewController.swift
//  ControlledCells
//
//  Created by Connor Neville on 4/12/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import Anchorage

class CellViewController: UIViewController {

    fileprivate let indexPath: IndexPath

    fileprivate let label = UILabel()

    fileprivate var labelText: String {
        let pathText = "\(indexPath)"
        let repeatedText = "Attaching additional text a varying number of times to test that cells resize properly. "
        let repeatCount = indexPath.row % 6
        let labelTextArray = [pathText] + Array(repeating: repeatedText, count: repeatCount)
        return labelTextArray.joined(separator: "\n")
    }

    fileprivate var backgroundColor: UIColor {
        let row = indexPath.row
        let color: UIColor = row % 2 == 0 ? .blue : .red
        return color.withAlphaComponent(0.5)
    }

    init(indexPath: IndexPath) {
        self.indexPath = indexPath
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor

        label.numberOfLines = 0
        label.text = labelText

        view.addSubview(label)
        label.edgeAnchors == view.edgeAnchors
    }

}
