//
//  BillCollectionViewCell.swift
//  Order
//
//  Created by 渡邉　博 on 2019/07/21.
//  Copyright © 2019 Hiroshi Watanabe. All rights reserved.
//

import UIKit

class BillCollectionViewCell: CollectionViewCell {
    
    let billPriceView = PriceView4Bill()
    
    override func setupViews() {
        super.setupViews()
        foodPriceView.isHidden = true
        
        
        billPriceView.backgroundColor = .clear
        addSubview(billPriceView)
        billPriceView.topAnchor.constraint(equalTo: foodNameLabel.bottomAnchor, constant: 8).isActive = true
        billPriceView.rightAnchor.constraint(equalTo: foodNameLabel.rightAnchor, constant: 0).isActive = true
        billPriceView.leftAnchor.constraint(equalTo: foodNameLabel.leftAnchor, constant: 0).isActive = true
        billPriceView.widthAnchor.constraint(equalTo: foodNameLabel.widthAnchor, multiplier: 1).isActive = true
        billPriceView.heightAnchor.constraint(equalTo: foodNameLabel.heightAnchor, multiplier: 1, constant: 0).isActive = true
        billPriceView.translatesAutoresizingMaskIntoConstraints = false
    }
    
//    let foodImageView = UIImageView()
//    let foodNameLabel = UILabel()
//    let foodPriceLabel = UILabel()
//    let foodNumLabel = UILabel()
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//    }
    
//    func setupViews() {
//
//        backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//
//        foodImageView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
//        foodImageView.contentMode = .scaleAspectFill
//        foodImageView.clipsToBounds = true
//        foodImageView.layer.cornerRadius = 10
//        addSubview(foodImageView)
//        foodImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
//        foodImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
//        foodImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.30).isActive = true
//        foodImageView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -16).isActive = true
//        foodImageView.translatesAutoresizingMaskIntoConstraints = false
//
//        foodNameLabel.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
//        addSubview(foodNameLabel)
//        foodNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
//        foodNameLabel.leftAnchor.constraint(equalTo: foodImageView.rightAnchor, constant: 0).isActive = true
//        foodNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
//        foodNameLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
//        foodNameLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        foodPriceLabel.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
//        addSubview(foodPriceLabel)
//        foodPriceLabel.topAnchor.constraint(equalTo: foodNameLabel.bottomAnchor, constant: 0).isActive = true
//        foodPriceLabel.leftAnchor.constraint(equalTo: foodImageView.rightAnchor, constant: 0).isActive = true
//        foodPriceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
//        foodPriceLabel.widthAnchor.constraint(equalTo: foodNameLabel.widthAnchor, multiplier: 0.5).isActive = true
//        foodPriceLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        foodNumLabel.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
//        addSubview(foodNumLabel)
//        foodNumLabel.topAnchor.constraint(equalTo: foodNameLabel.bottomAnchor, constant: 0).isActive = true
//        foodNumLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
//        foodNumLabel.leftAnchor.constraint(equalTo: foodPriceLabel.rightAnchor, constant: 0).isActive = true
//        foodNumLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
//        foodNumLabel.translatesAutoresizingMaskIntoConstraints = false
//
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}


class PriceView4Bill: FoodPriceView {
    
    override func setupViews() {
        super.setupViews()
        addButton.isHidden = true
        minusButton.isHidden = true
    }
}
