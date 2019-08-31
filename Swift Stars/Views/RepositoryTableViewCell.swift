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
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupViews() {
        
        self.addSubview(self.lbRepoName)
        self.addSubview(self.lbRepoNameValue)
        self.addSubview(self.lbRepoStars)
        self.addSubview(self.lbRepoStarsValue)
        self.addSubview(self.lbAuthorName)
        self.addSubview(self.lbAuthorNameValue)
        self.addSubview(self.imgAuthorAvatar)
    }
    
    private func setupConstraints() {
        
        self.imgAuthorAvatar.snp.makeConstraints { (make) in
            make.height.width.equalTo(50.0)
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
        
        self.lbRepoName.snp.makeConstraints { (make) in
            make.leading.equalTo(self.imgAuthorAvatar.snp.trailing).offset(10)
            make.top.equalToSuperview().offset(20)
        }
        
        self.lbRepoNameValue.snp.makeConstraints { (make) in
            make.top.equalTo(self.lbRepoName.snp.top)
            make.leading.equalTo(self.lbRepoName.snp.trailing).offset(10)
        }
        
        self.lbRepoStars.snp.makeConstraints { (make) in
            make.leading.equalTo(self.lbRepoName)
            make.top.equalTo(self.lbRepoName.snp.bottom).offset(10)
        }
        
        self.lbRepoStarsValue.snp.makeConstraints { (make) in
            make.top.equalTo(self.lbRepoNameValue.snp.bottom).offset(10)
            make.leading.equalTo(self.lbRepoStars.snp.trailing).offset(10)
        }
        
        self.lbAuthorName.snp.makeConstraints { (make) in
            make.leading.equalTo(self.lbRepoName)
            make.top.equalTo(self.lbRepoStars.snp.bottom).offset(10)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        self.lbAuthorNameValue.snp.makeConstraints { (make) in
            make.leading.equalTo(self.lbAuthorName.snp.trailing).offset(10)
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
