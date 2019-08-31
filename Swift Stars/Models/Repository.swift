//
//  Repository.swift
//  Swift Stars
//
//  Created by Tomate Albertini on 28/08/19.
//  Copyright © 2019 Tomate Albertini. All rights reserved.
//

import UIKit

class RootRepositories: NSObject, Decodable {
    
    var items: [Repository]
}

class Owner: NSObject, Decodable {
    
    var avatar_url: String
    var login: String
}

class Repository: NSObject, Decodable {
    
    var id: Int
    var name: String?
    var full_name: String?
    var stargazers_count: Int
    var owner: Owner
}
