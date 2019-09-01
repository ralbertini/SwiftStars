//
//  RepositorySpecs.swift
//  SwiftStars
//
//  Created by Tomate Albertini on 01/09/19.
//  Copyright © 2019 Tomate Albertini. All rights reserved.
//

import Nimble
import Quick

@testable import SwiftStars

class RepositorySpecs: QuickSpec {

    override func spec() {
        
        var sut: RootRepositories!
        
        describe("O Model Repository"){
            
            context("Pode ser criado com um arquivo JSON Valido") {
                
                afterEach {
                    sut = nil
                }
                
                beforeEach {
                    
                    if let path = Bundle.main.path(forResource: "Repository", ofType: "json") {
                        
                        do {
                            
                            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                            sut = try JSONDecoder().decode(RootRepositories.self, from: data)
                        } catch {
                            
                            fail("Erro no Parse JSON")
                        }
                    }
                }
                
                it("Contém 10 repositórios") {
                    
                    expect(sut.items.count).to(equal(10))
                }
                
                it("Contém nome correto") {
                    
                    expect(sut.items.first!.owner.login).to(equal("Swinject"))
                }
            }
            
        }
    }
}
