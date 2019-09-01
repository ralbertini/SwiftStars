//
//  Extensions.swift
//  Swift Stars
//
//  Created by Tomate Albertini on 31/08/19.
//  Copyright © 2019 Tomate Albertini. All rights reserved.
//

import UIKit

extension UIImageView {
    
    //Nota bene: - Ronaldo Albertini
    //Prefiri utilizar essa extensão ao invés de utilizar mais uma dependência para fazer cache de imagens, como o KingFisher por exemplo
    
    //https://stackoverflow.com/questions/24231680/loading-downloading-image-from-url-on-swift
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
