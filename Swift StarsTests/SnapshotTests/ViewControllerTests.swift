//
//  ViewControllerTests.swift
//  SwiftStarsTests
//
//  Created by Tomate Albertini on 01/09/19.
//  Copyright © 2019 Tomate Albertini. All rights reserved.
//

import FBSnapshotTestCase

@testable import SwiftStars
class ViewControllerTests: FBSnapshotTestCase {

    override func setUp() {
        super.setUp()
        
        self.recordMode = false
        self.fileNameOptions = [.screenSize,.screenScale]
    }
    
    func testThatLoginPageAppearsCorrectly() {
        let vc = ViewController()

        if let repos = self.readRepositoriesFromJson() {
            vc.viewModel.repositories = repos
        }
        
        FBSnapshotVerifyView(vc.view)
    }
    
    private func readRepositoriesFromJson() -> [Repository]? {
        
        if let path = Bundle.main.path(forResource: "Repository", ofType: "json") {
            
            do {
                
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                return (try JSONDecoder().decode(RootRepositories.self, from: data)).items
                
            } catch  { }
        }
        return nil
    }
}
