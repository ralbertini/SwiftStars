//
//  Network.swift
//  Swift Stars
//
//  Created by Tomate Albertini on 28/08/19.
//  Copyright © 2019 Tomate Albertini. All rights reserved.
//

import UIKit

enum httpMethod:String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
}

enum NetworkErrors: Error {
    case invalidURL
}

class Network: NSObject {

    static var session: URLSession = {
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        return session
    }()
    
    static func doRequest(url:String, httpMethod: httpMethod, params:Dictionary<String,Any>?, completionHandler:  @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        guard let url = URL(string: url) else { return }
        
        let task = self.session.dataTask(with: url) { (data, response, error) in
            
            completionHandler(data, response, error)
        }
        
        task.resume()
    }
}
