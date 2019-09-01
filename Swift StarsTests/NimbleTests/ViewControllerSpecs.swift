//
//  ViewControllerSpecs.swift
//  SwiftStarsTests
//
//  Created by Tomate Albertini on 01/09/19.
//  Copyright © 2019 Tomate Albertini. All rights reserved.
//


import Quick
import Nimble
@testable import SwiftStars

class ViewControllerSpecs: QuickSpec {
    override func spec() {
        
        var sut: ViewController!
        var cell = RepositoryTableViewCell()
        
        describe("A lista de repositorios") {
            context("Pode exibir informações do arquivo JSON") {
                
                afterEach {
                    sut = nil
                }
                
                beforeEach {

                    sut = ViewController()
                    
                    if let path = Bundle.main.path(forResource: "Repository", ofType: "json") {
                        
                        do {
                            
                            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                            sut.viewModel.repositories = (try JSONDecoder().decode(RootRepositories.self, from: data)).items
                            sut.tableView.reloadData()
                            cell = sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! RepositoryTableViewCell
                        } catch {
                            
                            fail("Erro no Parse JSON")
                        }
                    }
                }
                
                it("Numero de estrelas") {
                    // 2
                    expect(cell.lbRepoStarsValue.text).to(equal("3502"))
                }
            }
        }
    }
}
