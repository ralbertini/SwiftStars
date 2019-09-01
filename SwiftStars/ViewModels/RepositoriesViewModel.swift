//
//  RepositoriesViewModel.swift
//  Swift Stars
//
//  Created by Tomate Albertini on 31/08/19.
//  Copyright © 2019 Tomate Albertini. All rights reserved.
//

import UIKit

class RepositoriesViewModel {
    
    private var page: UInt = 1
    private var itemsPerPage: UInt = 20
    
    @objc var repositories: [Repository] = [Repository]()
    
    var updateHandler: () -> Void = {}
    
    func getRepositories() {
        
        NetworkSwiftRepositories.getRepositories(page: page, itemsPerPage: itemsPerPage) { (error, repos) in
            
            guard let repos = repos, error == nil else { return }
            self.repositories.append(contentsOf: repos)
            self.updateHandler()
        }
    }
    
    func nextPage()  {
        
        self.page += 1
        self.getRepositories()
    }
    
    func firstPage() {
        self.page = 1
        self.repositories.removeAll()
        self.getRepositories()
    }
}
