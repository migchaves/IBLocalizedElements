//
//  DetailsViewController.swift
//  IBLocalizedElements
//
//  Created by Miguel on 09/01/2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "details_title".localized
    }
}
