//
//  NetworkSwiftRepositories.swift
//  Swift Stars
//
//  Created by Tomate Albertini on 28/08/19.
//  Copyright © 2019 Tomate Albertini. All rights reserved.
//

import UIKit

class NetworkSwiftRepositories: NSObject {
    
    private static let baseURL: String = "https://api.github.com/"
    
    static func getRepositories(page: UInt = 1, itemsPerPage: UInt, completion:@escaping (Error?, [Repository]?) -> Void) {
    
        Network.doRequest(url: "\(baseURL)search/repositories?q=language:swift&sort=stars&page=\(page)&per_page=\(itemsPerPage)", httpMethod: httpMethod.get, params: nil) { (data, urlResponse, error) in
            
            do {
                guard let data = data else { return }
                
                let repos = try JSONDecoder().decode(RootRepositories.self, from: data)
                completion(nil, repos.items)
                
            } catch {
                
                print(error)
                completion(error, nil)
            }
        }
    }
}
