//
//  OrderdCollectionViewController.swift
//  Order
//
//  Created by macair2 elevenlab on 2019/07/19.
//  Copyright © 2019 Hiroshi Watanabe. All rights reserved.
//

import UIKit

protocol OrderdCollectionViewControllerDelegate {
    func sendOrderList(orderList: [Food])
}

class OrderdCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, FoodPriceViewDelegate, FooterDelegate {
    
    let cellId = "cellId"
    var orderList = [Food]()
    var delegate: OrderdCollectionViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Your Order"
        collectionView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        collectionView.register(OrderdCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView.register(Footer.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerId)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        var newOrderList = [Food]()
        for order in orderList {
            if order.num > 0 {
                newOrderList.append(order)
            }
        }
        delegate?.sendOrderList(orderList: newOrderList)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return orderList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! OrderdCollectionViewCell
        let food = orderList[indexPath.item]
        cell.foodImageView.image = UIImage(named: food.name)
        cell.foodNameLabel.text = food.name
        cell.foodPriceView.priceLabel.text = "¥\(food.price * food.num)"
        cell.foodPriceView.countLabel.text = "\(food.num)"
        cell.foodPriceView.food = food
        cell.foodPriceView.delegate = self
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 125)
    }
    
    
    func getTotalWithTax() -> Int {
        let taxRate = 1.08
        let priceList = orderList.map({ $0.price * $0.num })
        let total = priceList.reduce(0, { $0 + $1 })
        let totalWithTax = Double(total) * taxRate
        return Int(totalWithTax)
    }
    
    
    // MARK: FoodPriceViewDelegate
    func foodNumChanged() {
        collectionView.reloadData()
    }
    
    
    func add2OrderList(food: Food) {
        
        let result = orderList.filter({ $0 === food })
        if result.count == 0 {
            orderList.append(food)
            print("add: ", orderList.map({ $0.name }))
        }
    }
    
    
    func deleteFromOrderList(food: Food) {
        // Pass
    }
    
    
    
    // MARK: Header & Footer
    let headerId = "headerId"
    let UICollectionElementKindSectionHeader = "UICollectionElementKindSectionHeader"
    let footerId = "footerId"
    let UICollectionElementKindSectionFooter = "UICollectionElementKindSectionFooter"
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId, for: indexPath)
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerId, for: indexPath) as! Footer
            footer.delegate = self
            footer.priceLabel.text = "¥\(getTotalWithTax())"
            if orderList.count <= 0 {
                footer.showEmpty()
            }
            return footer
        }
        
    }
    
    // Header
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 0)
    }
    
    // Footer
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 140)
    }
    
    
    // MARK: FooterDelegate
    func confirmButtonTapped() {
        print("confirmButtonTapped")
        print("Total: ", getTotalWithTax())
    }
    
    
    func cancelButtonTapped() {
        print("cancelButtonTapped")
        for order in orderList {
            order.num = 0
        }
        collectionView.reloadData()
    }
    
    
}








class OrderdCollectionViewCell: CollectionViewCell {
    
}

class OrderdPriceView: FoodPriceView {
    
}
