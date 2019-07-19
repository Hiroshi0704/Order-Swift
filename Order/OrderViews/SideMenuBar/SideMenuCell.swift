//
//  SideMenuCell.swift
//  Order
//
//  Created by macair2 elevenlab on 2019/07/18.
//  Copyright © 2019 Hiroshi Watanabe. All rights reserved.
//

import UIKit


class SideMenuCell: UICollectionViewCell {
    
    let iconImageView = UIImageView()
    let nameLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        setupViews()
    }
    
    func setupViews() {
        
        iconImageView.backgroundColor = .clear
        addSubview(iconImageView)
        iconImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        iconImageView.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4).isActive = true
        iconImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4).isActive = true
        iconImageView.translatesAutoresizingMaskIntoConstraints = false

        nameLabel.backgroundColor = .clear
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        addSubview(nameLabel)
        nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 8).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 8).isActive = true
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

    }
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? .yellow : .lightGray
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? .blue : .lightGray
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
