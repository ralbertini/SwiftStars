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
    
    private let greenColor = UIColor(red: 69/255.0, green: 161/255.0, blue: 99/255.0, alpha: 1.0)
    
    lazy var refreshControl: UIRefreshControl = {
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshRepositories), for: UIControl.Event.valueChanged)
        refreshControl.tintColor = self.greenColor
        return refreshControl
    }()
    
    lazy var tableView: UITableView = {
        
        var tbView: UITableView = UITableView()
        tbView.dataSource = self
        tbView.delegate = self
        tbView.rowHeight = UITableView.automaticDimension
        tbView.register(RepositoryTableViewCell.self, forCellReuseIdentifier: "repo")
        tbView.addSubview(self.refreshControl)
        tbView.separatorStyle = UITableViewCell.SeparatorStyle.none
        return tbView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = self.greenColor
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.title = "Repositórios Swift"
        
        self.setupViews()
        self.setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.refreshRepositories()
    }
    
    @objc private func refreshRepositories() {
        
        self.viewModel.firstPage()
        
        self.viewModel.updateHandler = {
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
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
        
        if self.viewModel.repositories.count > 0 {
            cell?.configureCellContent(repo: self.viewModel.repositories[indexPath.row])
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel.repositories.count
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if self.viewModel.repositories.count > 0 {
            
            print(indexPath.row)
            
            if self.viewModel.repositories.count - 2 == indexPath.row - 1 {
                self.viewModel.nextPage()
            }
        }
    }
}
