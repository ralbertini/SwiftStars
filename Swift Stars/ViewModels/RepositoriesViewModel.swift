//
//  RepositoriesViewModel.swift
//  Swift Stars
//
//  Created by Tomate Albertini on 31/08/19.
//  Copyright © 2019 Tomate Albertini. All rights reserved.
//

import UIKit

class RepositoriesViewModel {

//    init() {
//        
//        self.getRepositories()
//    }
    
    @objc var repositories: [Repository] = [Repository]()
    
    var updateHandler: () -> Void = {}
    
    func getRepositories() {
        
        NetworkSwiftRepositories.getRepositories(idCidade: 0) { (error, repos) in
            
            guard let repos = repos else { return }
            self.repositories = repos
            print(self.repositories)
            self.updateHandler()
            
        }
    }
}
