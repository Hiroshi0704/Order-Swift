//
//  SideMenuLauncher.swift
//  Order
//
//  Created by macair2 elevenlab on 2019/07/18.
//  Copyright © 2019 Hiroshi Watanabe. All rights reserved.
//

import UIKit

protocol SideMenuLauncherDelegate {
    func setCategory(category: String)
    func checkButtonTapped()
}

class SideMenuLauncher: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let blackView = UIView()
    let cellId = "cellId"
    let category = ["beer", "dish", "pasta", "ice-cream"]
    let categoryIcon = ["beer", "dish", "pasta", "ice-cream"]
    let service = ["Check"]
    var delegate: SideMenuLauncherDelegate? = nil
    
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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return category.count
        case 1:
            return service.count
        default:
            print("error at numberOfItemsInSection")
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SideMenuCell
            let item = category[indexPath.item]
            cell.nameLabel.text = item
            cell.iconImageView.image = UIImage(named: categoryIcon[indexPath.item])?.withRenderingMode(.alwaysOriginal)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SideMenuCell
            let item = service[indexPath.item]
            cell.nameLabel.text = item
            return cell
        default:
            print("error at cellForItemAt")
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height / 10)
    }
    
    
    let lineSpacing: CGFloat = 10
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: lineSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            let item = category[indexPath.item]
            delegate?.setCategory(category: item)
            print(item)
            handleDismiss()
        case 1:
            let item = service[indexPath.item]
            print("\(item) tappend")
            delegate?.checkButtonTapped()
            handleDismiss()
        default:
            print("error at didSelectItemAt")
            break
        }
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
