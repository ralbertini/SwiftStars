//
//  RepositoryTableViewCell.swift
//  Swift Stars
//
//  Created by Tomate Albertini on 31/08/19.
//  Copyright © 2019 Tomate Albertini. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {

    private let imageSize: CGFloat = 50.0
    
    lazy var cardView: UIView = {
        
        let v: UIView = UIView()
        v.backgroundColor = UIColor.white
        v.layer.cornerRadius = 10
        v.layer.shadowColor = UIColor.gray.cgColor
        v.layer.shadowOpacity = 0.6
        v.layer.shadowOffset = CGSize(width: 2, height: 2)
        v.layer.shadowRadius = 6
        return v
    }()
    
    lazy var lbRepoName: UILabel = {
        var label: UILabel = UILabel()
        label.text = "Nome: "
        return label
    }()
    
    lazy var lbRepoNameValue: UILabel = {
        var label: UILabel = UILabel()
        return label
    }()
    
    lazy var lbRepoStars: UILabel = {
        var label: UILabel = UILabel()
        label.text = "Estrelas: "
        return label
    }()
    
    lazy var lbRepoStarsValue: UILabel = {
        var label: UILabel = UILabel()
        return label
    }()
    
    lazy var lbAuthorName: UILabel = {
        var label: UILabel = UILabel()
        label.text = "Autor: "
        label.contentMode = UIView.ContentMode.scaleAspectFit
        return label
    }()
    
    lazy var lbAuthorNameValue: UILabel = {
        var label: UILabel = UILabel()
        return label
    }()
    
    lazy var imgAuthorAvatar: UIImageView = {
        var img: UIImageView = UIImageView()
        img.layer.cornerRadius = self.imageSize / 2
        img.clipsToBounds = true
        return img
    }()
    
    private func setupViews() {
        
        self.addSubview(self.cardView)
        
        self.cardView.addSubview(self.lbRepoName)
        self.cardView.addSubview(self.lbRepoNameValue)
        self.cardView.addSubview(self.lbRepoStars)
        self.cardView.addSubview(self.lbRepoStarsValue)
        self.cardView.addSubview(self.lbAuthorName)
        self.cardView.addSubview(self.lbAuthorNameValue)
        self.cardView.addSubview(self.imgAuthorAvatar)
    }
    
    private func setupConstraints() {
        
        self.cardView.snp.makeConstraints { (make) in
            make.leading.top.equalToSuperview().offset(10)
            make.trailing.bottom.equalToSuperview().offset(-10)
        }
        
        self.imgAuthorAvatar.snp.makeConstraints { (make) in
            make.height.width.equalTo(50.0)
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
        
        self.lbRepoName.snp.makeConstraints { (make) in
            make.leading.equalTo(self.imgAuthorAvatar.snp.trailing).offset(10)
            make.top.equalToSuperview().offset(15)
        }
        
        self.lbRepoNameValue.snp.makeConstraints { (make) in
            make.top.equalTo(self.lbRepoName.snp.top)
            make.leading.equalTo(self.lbRepoName.snp.trailing).offset(5)
        }
        
        self.lbRepoStars.snp.makeConstraints { (make) in
            make.leading.equalTo(self.lbRepoName)
            make.top.equalTo(self.lbRepoName.snp.bottom).offset(5)
        }
        
        self.lbRepoStarsValue.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.lbRepoStars.snp.centerY)
            make.leading.equalTo(self.lbRepoStars.snp.trailing).offset(5)
        }
        
        self.lbAuthorName.snp.makeConstraints { (make) in
            make.leading.equalTo(self.lbRepoName)
            make.top.equalTo(self.lbRepoStars.snp.bottom).offset(5)
            make.bottom.equalToSuperview().offset(-15)
        }
        
        self.lbAuthorNameValue.snp.makeConstraints { (make) in
            make.leading.equalTo(self.lbAuthorName.snp.trailing).offset(5)
            make.top.equalTo(self.lbAuthorName)
        }
    }
    
    func configureCellContent(repo: Repository) {
    
        self.setupViews()
        self.setupConstraints()
        
        self.lbAuthorNameValue.text = repo.owner.login
        self.lbRepoNameValue.text = repo.name
        self.lbRepoStarsValue.text = "\(repo.stargazers_count)"
        self.imgAuthorAvatar.downloaded(from: repo.owner.avatar_url )
    }
}
