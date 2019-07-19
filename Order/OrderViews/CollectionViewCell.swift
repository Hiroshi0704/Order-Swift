//
//  CollectionViewCell.swift
//  Order
//
//  Created by macair2 elevenlab on 2019/07/18.
//  Copyright © 2019 Hiroshi Watanabe. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let foodImageView = UIImageView()
    let foodNameLabel = UILabel()
    let foodPriceView = FoodPriceView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    func setupViews() {
        
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        layer.borderWidth = 1
        
        
        foodImageView.backgroundColor = .clear
        foodImageView.contentMode = .scaleAspectFill
        foodImageView.clipsToBounds = true
        foodImageView.layer.cornerRadius = 10
        addSubview(foodImageView)
        foodImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        foodImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        foodImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.30).isActive = true
        foodImageView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -16).isActive = true
        foodImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        foodNameLabel.backgroundColor = .clear
        addSubview(foodNameLabel)
        foodNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        foodNameLabel.leftAnchor.constraint(equalTo: foodImageView.rightAnchor, constant: 8).isActive = true
        foodNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        foodNameLabel.heightAnchor.constraint(equalTo: foodImageView.heightAnchor, multiplier: 0.5, constant: -4).isActive = true
        foodNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        foodPriceView.backgroundColor = .clear
        addSubview(foodPriceView)
        foodPriceView.topAnchor.constraint(equalTo: foodNameLabel.bottomAnchor, constant: 8).isActive = true
        foodPriceView.rightAnchor.constraint(equalTo: foodNameLabel.rightAnchor, constant: 0).isActive = true
        foodPriceView.leftAnchor.constraint(equalTo: foodNameLabel.leftAnchor, constant: 0).isActive = true
        foodPriceView.widthAnchor.constraint(equalTo: foodNameLabel.widthAnchor, multiplier: 1).isActive = true
        foodPriceView.heightAnchor.constraint(equalTo: foodNameLabel.heightAnchor, multiplier: 1, constant: 0).isActive = true
        foodPriceView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            if isHighlighted {
                print("isHighlighted")
            }
        }
    }
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            if isSelected {
                print("isSelected")
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

