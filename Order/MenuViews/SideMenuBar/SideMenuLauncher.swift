//
//  SideMenuLauncher.swift
//  Order
//
//  Created by macair2 elevenlab on 2019/07/18.
//  Copyright © 2019 Hiroshi Watanabe. All rights reserved.
//

import UIKit

protocol CategoryDelegate {
    func setCategory(category: String)
}

class SideMenuLauncher: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let blackView = UIView()
    let cellId = "cellId"
    let category = ["beer", "dish", "pasta", "ice-cream"]
    let categoryIcon = ["beer", "dish", "pasta", "ice-cream"]
    var delegate: CategoryDelegate? = nil
    
    override init() {
        super.init()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SideMenuCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return cv
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SideMenuCell
        let item = category[indexPath.item]
        cell.nameLabel.text = item
        cell.iconImageView.image = UIImage(named: categoryIcon[indexPath.item])?.withRenderingMode(.alwaysOriginal)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height / 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = category[indexPath.item]
        delegate?.setCategory(category: item)
        print(item)
        handleDismiss()
    }
    
    
    func showSideMenu() {
        
        if let window = UIApplication.shared.keyWindow {
            
            blackView.backgroundColor = .init(white: 0, alpha: 0.5)
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            window.addSubview(blackView)
            blackView.frame = window.frame
            blackView.alpha = 0
            
            window.addSubview(collectionView)
            let width: CGFloat = window.frame.width * 0.5
            collectionView.frame = CGRect(x: -width, y: 0, width: width, height: window.frame.height)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                let frame = self.collectionView.frame
                self.collectionView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
            }, completion: nil)
            
        }
    }
    
    
    @objc func handleDismiss() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackView.alpha = 0
            let frame = self.collectionView.frame
            self.collectionView.frame = CGRect(x: -frame.width, y: 0, width: frame.width, height: frame.height)
        }, completion: nil)
        
    }

}
