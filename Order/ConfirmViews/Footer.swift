//
//  Footer.swift
//  Order
//
//  Created by macair2 elevenlab on 2019/07/19.
//  Copyright © 2019 Hiroshi Watanabe. All rights reserved.
//

import UIKit

protocol FooterDelegate {
    func confirmButtonTapped()
    func cancelButtonTapped()
}

class Footer: UICollectionReusableView {
    
    var delegate: FooterDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setupViews()
    }
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "¥0"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .right
        label.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    let confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("Confirm", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        return button
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("All Clear", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return button
    }()
    
    func setupViews() {
        
        addSubview(priceLabel)
        priceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        priceLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        priceLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(confirmButton)
        confirmButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 0).isActive = true
        confirmButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        confirmButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        confirmButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        confirmButton.addTarget(self, action: #selector(confirmButtonTappd), for: .touchUpInside)
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(cancelButton)
        cancelButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 0).isActive = true
        cancelButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        cancelButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        cancelButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    
    @objc func confirmButtonTappd() {
        delegate?.confirmButtonTapped()
    }
    
    
    @objc func cancelButtonTapped() {
        delegate?.cancelButtonTapped()
    }
    

    let emptyView: UILabel = {
        let view = UILabel()
        view.text = "Empty"
        view.font = UIFont.systemFont(ofSize: 30)
        view.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return view
    }()
    
    func showEmpty() {
        backgroundColor = .clear
        priceLabel.alpha = 0
        confirmButton.alpha = 0
        cancelButton.alpha = 0
        
        addSubview(emptyView)
        emptyView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        emptyView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        emptyView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
