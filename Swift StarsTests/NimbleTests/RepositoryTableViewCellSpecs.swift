//
//  RepositoryTableViewCellSpecs.swift
//  SwiftStarsTests
//
//  Created by Tomate Albertini on 01/09/19.
//  Copyright © 2019 Tomate Albertini. All rights reserved.
//

import Quick
import Nimble

@testable import SwiftStars
class RepositoryTableViewCellSpecs: QuickSpec {

    override func spec() {
        var sut: RepositoryTableViewCell!
        
        describe("A Celula de repositorio") {
            context("exibe corretamente os labels") {
                
                afterEach {
                    sut = nil
                }
                
                beforeEach {
                    
                    sut = RepositoryTableViewCell()
                    let vc = ViewController()
                    
                    if let path = Bundle.main.path(forResource: "Repository", ofType: "json") {
                        
                        do {
                            
                            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                            vc.viewModel.repositories = (try JSONDecoder().decode(RootRepositories.self, from: data)).items
                            sut.configureCellContent(repo: vc.viewModel.repositories.first!)
                        } catch {
                            
                            fail("Erro no Parse JSON")
                        }
                    }
                }
                
                it("pode exibir nome do repositorio") {
                    // 2
                    expect(sut.lbRepoNameValue.text).to(equal("Swinject"))
                }
     
                it("pode exibir corretamente o author") {
                    // 2
                    expect(sut.lbAuthorNameValue.text).to(equal("Swinject"))
                }
                
                it("pode exibir corretamente quantidade de estrelas") {
                    // 2
                    expect(Int(sut.lbRepoStarsValue.text!)).to(equal(3502))
                }
            }
        }
    }
    
}
