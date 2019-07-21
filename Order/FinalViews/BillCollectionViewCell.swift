//
//  BillCollectionViewCell.swift
//  Order
//
//  Created by 渡邉　博 on 2019/07/21.
//  Copyright © 2019 Hiroshi Watanabe. All rights reserved.
//

import UIKit

class BillCollectionViewCell: UICollectionViewCell {
    
    let foodImageView = UIImageView()
    let foodNameLabel = UILabel()
    let foodPriceLabel = UILabel()
    let foodNumLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
        foodImageView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        foodImageView.contentMode = .scaleAspectFill
        foodImageView.clipsToBounds = true
        foodImageView.layer.cornerRadius = 10
        addSubview(foodImageView)
        foodImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        foodImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        foodImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        foodNameLabel.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        addSubview(foodNameLabel)
        
        foodPriceLabel.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        addSubview(foodPriceLabel)
        
        foodNumLabel.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        addSubview(foodNumLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
