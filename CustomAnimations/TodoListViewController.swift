//
//  TodoListViewController.swift
//  CustomAnimations
//
//  Created by Midhet Sulemani on 10/2/19.
//  Copyright © 2019 DevFest. All rights reserved.
//

import UIKit

class TodoListViewController: UIViewController {
    
    var welcomeLabel: UILabel!
    var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel = UILabel(frame: CGRect(x: 20, y: 70, width: 100, height: 25))
        welcomeLabel.text = "Welcome"
        self.view.addSubview(welcomeLabel)
        nameLabel = UILabel(frame: CGRect(x: 20, y: 95, width: 100, height: 25))
        nameLabel.text = "Midhet"
        self.view.addSubview(nameLabel)
    }
}

