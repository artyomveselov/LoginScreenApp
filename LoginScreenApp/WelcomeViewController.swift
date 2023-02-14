//
//  WelcomeViewController.swift
//  LoginScreenApp
//
//  Created by temaveselov on 14.02.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Добро пожаловать, \(userName!)!"
    }
}

