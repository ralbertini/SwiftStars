//
//  ViewController.swift
//  Swift Stars
//
//  Created by Tomate Albertini on 28/08/19.
//  Copyright © 2019 Tomate Albertini. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var viewModel: RepositoriesViewModel = RepositoriesViewModel()
    
    lazy var tableView: UITableView = {
        
        var tbView: UITableView = UITableView()
        tbView.dataSource = self
        tbView.rowHeight = UITableView.automaticDimension
        tbView.register(RepositoryTableViewCell.self, forCellReuseIdentifier: "repo")
        
        return tbView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupViews()
        self.setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.viewModel.getRepositories()
        
        self.viewModel.updateHandler = {
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private func setupViews() {
    
        self.view.addSubview(self.tableView)
    }
    
    private func setupConstraints() {
    
        self.tableView.snp.makeConstraints { (make) in
            make.bottom.top.leading.trailing.equalToSuperview()
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "repo") as? RepositoryTableViewCell
        
        if cell == nil {
            
            cell = RepositoryTableViewCell()
        }
        
        cell?.configureCellContent(repo: self.viewModel.repositories[indexPath.row])
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.repositories.count
    }
}
