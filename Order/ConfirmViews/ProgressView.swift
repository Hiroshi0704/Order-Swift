//
//  ProgressView.swift
//  Order
//
//  Created by 渡邉　博 on 2019/07/20.
//  Copyright © 2019 Hiroshi Watanabe. All rights reserved.

import UIKit

class ProgressView: NSObject {
    
    let blackView = UIView()
    let progress = UIView()
    let label = UILabel()
    
    override init() {
        super.init()
    }
    
    func show() {
        
        if let window = UIApplication.shared.keyWindow {
            
            blackView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            blackView.alpha = 0
            blackView.frame = CGRect(x: 0, y: 0, width: window.frame.width, height: window.frame.height)
            window.addSubview(blackView)
            
            
            progress.addSubview(label)
            label.centerYAnchor.constraint(equalTo: progress.centerYAnchor, constant: 0).isActive = true
            label.centerXAnchor.constraint(equalTo: progress.centerXAnchor, constant: 0).isActive = true
            label.translatesAutoresizingMaskIntoConstraints = false
            
            progress.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            progress.layer.cornerRadius = 20
            let width = window.frame.width * 0.9
            let height = window.frame.height * 0.2
            let x = (window.frame.width - width) / 2
            let y = (window.frame.height - height) / 2
            progress.frame = CGRect(x: x, y: 0 - y - height, width: width, height: height)
            window.addSubview(progress)
            
            UIView.animate(withDuration: 0.5) {
                self.blackView.alpha = 0.5
                self.progress.frame = CGRect(x: x, y: y, width: width, height: height)
            }
            
            UIView.animate(withDuration: 0.5, delay: 3, options: UIView.AnimationOptions(), animations: {
                self.blackView.alpha = 0
                self.progress.frame = CGRect(x: x, y: 0 - y - width, width: width, height: height)
            }, completion: nil)
        }
    }
}
