//
//  NetworkSwiftRepositories.swift
//  Swift Stars
//
//  Created by Tomate Albertini on 28/08/19.
//  Copyright © 2019 Tomate Albertini. All rights reserved.
//

import UIKit

class NetworkSwiftRepositories: NSObject {
    
    static func getRepositories(idCidade: UInt, completion:@escaping (Error?, [Repository]?) -> Void) {
    
        Network.doRequest(url: "https://api.github.com/search/repositories?q=language:swift&sort=stars", httpMethod: httpMethod.get, params: nil) { (data, urlResponse, error) in
            
            do {
                guard let data = data else { return }
                
                let eventos = try JSONDecoder().decode(RootRepositories.self, from: data)
                completion(nil, eventos.items)
                
            } catch {
                
                print(error)
                completion(error, nil)
            }
        }
    }
}
