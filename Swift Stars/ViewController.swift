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
        self.view.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
        }
    }


}

