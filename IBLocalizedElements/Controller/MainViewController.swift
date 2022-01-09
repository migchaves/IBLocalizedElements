//
//  MainViewController.swift
//  IBLocalizedElements
//
//  Created by Miguel on 09/01/2022.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "main_title".localized
    }
    
    // MARK: - Actions
    
    @IBAction func handleDetailsClick() {
        self.performSegue(withIdentifier: "segueToDetails", sender: nil)
    }
}
