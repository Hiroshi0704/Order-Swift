//
//  FoodPriceView.swift
//  Order
//
//  Created by macair2 elevenlab on 2019/07/18.
//  Copyright © 2019 Hiroshi Watanabe. All rights reserved.
//

import UIKit

protocol FoodPriceViewDelegate {
    func foodNumChanged()
    func add2OrderList(food: Food)
    func deleteFromOrderList(food: Food)
}

class FoodPriceView: UIView {
    
    let priceLabel = UILabel()
    let addButton = UIButton()
    let minusButton = UIButton()
    let countLabel = UILabel()
    var count: Int = 0
    var food: Food?
    var delegate: FoodPriceViewDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    
    func setupViews() {
        
        priceLabel.backgroundColor = .clear
        priceLabel.text = "¥"
//        priceLabel.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
//        priceLabel.layer.borderWidth = 1
        addSubview(priceLabel)
        priceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        priceLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4).isActive = true
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        addButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        addButton.setTitle("+", for: .normal)
        addButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        addButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        addButton.layer.borderWidth = 1
        addButton.layer.cornerRadius = 10
        addButton.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        addSubview(addButton)
        addButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        addButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        addButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        addButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1, constant: 0).isActive = true
        addButton.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1, constant: -4).isActive = true
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        
        
        minusButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        minusButton.setTitle("-", for: .normal)
        minusButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        minusButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        minusButton.layer.borderWidth = 1
        minusButton.layer.cornerRadius = 10
        minusButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        addSubview(minusButton)
        minusButton.topAnchor.constraint(equalTo: addButton.topAnchor, constant: 0).isActive = true
        minusButton.leftAnchor.constraint(equalTo: priceLabel.rightAnchor, constant: 0).isActive = true
        minusButton.bottomAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 0).isActive = true
        minusButton.heightAnchor.constraint(equalTo: addButton.heightAnchor, multiplier: 1, constant: 0).isActive = true
        minusButton.widthAnchor.constraint(equalTo: addButton.heightAnchor, multiplier: 1, constant: 0).isActive = true
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        
        
        countLabel.backgroundColor = .white
        countLabel.text = "0"
        countLabel.textAlignment = .center
        countLabel.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        countLabel.layer.borderWidth = 1
        addSubview(countLabel)
        countLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        countLabel.leftAnchor.constraint(equalTo: minusButton.rightAnchor, constant: 0).isActive = true
        countLabel.rightAnchor.constraint(equalTo: addButton.leftAnchor, constant: 0).isActive = true
        countLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    @objc func addButtonTapped() {

        if let safeFood = self.food {
            safeFood.num += 1
            delegate?.add2OrderList(food: safeFood)
        }
        delegate?.foodNumChanged()
    }
    
    @objc func minusButtonTapped() {
        
        if let safeFood = self.food {
            if safeFood.num >= 1 {
                safeFood.num -= 1
                
                if safeFood.num == 0 {
                    delegate?.deleteFromOrderList(food: safeFood)
                }
                
            }
        }
        delegate?.foodNumChanged()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
