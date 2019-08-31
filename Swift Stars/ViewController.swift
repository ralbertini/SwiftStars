//
//  ViewController.swift
//  Swift Stars
//
//  Created by Tomate Albertini on 28/08/19.
//  Copyright © 2019 Tomate Albertini. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NetworkSwiftRepositories.getRepositories(idCidade: 0) { (error, repos) in
            print(repos)
            
        }
    }


}

