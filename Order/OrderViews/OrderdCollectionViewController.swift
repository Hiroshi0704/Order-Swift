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
    func sendDecidedOrder(decidedOrder: [Food])
}

class OrderdCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, FoodPriceViewDelegate, FooterDelegate, ProgressViewDelegate {
    
    let cellId = "cellId"
    var orderList = [Food]()
    var decidedOrder = [Food]()
    var delegate: OrderdCollectionViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Your Order"
        collectionView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        collectionView.register(OrderdCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: ElementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView.register(Footer.self, forSupplementaryViewOfKind: ElementKindSectionFooter, withReuseIdentifier: footerId)
        setupNav()
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
        delegate?.sendDecidedOrder(decidedOrder: decidedOrder)
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
    
    func setupNav() {
//        let cartImage = UIImage(named: "cart")?.withRenderingMode(.alwaysOriginal)
//        let cartButtonItem = UIBarButtonItem(image: cartImage, style: .plain, target: self, action: #selector(cartButtonTapped))
//        navigationItem.rightBarButtonItem = cartButtonItem
        let billButtonItem = UIBarButtonItem(title: "注文履歴", style: .plain, target: self, action: #selector(billButtonTappend))
        navigationItem.rightBarButtonItem = billButtonItem
    }
    
    @objc func billButtonTappend() {
        print("billButtonTappend")
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
    let ElementKindSectionHeader = "UICollectionElementKindSectionHeader"
    let footerId = "footerId"
    let ElementKindSectionFooter = "UICollectionElementKindSectionFooter"
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == ElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: ElementKindSectionHeader, withReuseIdentifier: headerId, for: indexPath)
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: ElementKindSectionFooter, withReuseIdentifier: footerId, for: indexPath) as! Footer
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
    let progressView = ProgressView()
    
    func confirmButtonTapped() {
        print("confirmButtonTapped")
        print("Total: ", getTotalWithTax())
        progressView.label.text = "¥\(getTotalWithTax())"
        progressView.delegate = self
        addOrder2DecidedOrder()
        progressView.show()
        
    }
    
    func addOrder2DecidedOrder() {
        
        for order in self.orderList {
            if order.num <= 0 { continue }
            if decidedOrder.contains(where: { $0 === order }) {
                order.orderdNum += order.num
                order.num = 0
            } else {
                order.orderdNum += order.num
                decidedOrder.append(order)
                order.num = 0
            }
        }
        print(decidedOrder)
        print(decidedOrder.map({ $0.name }), decidedOrder.map({ $0.orderdNum }))
    }
    
    
    func cancelButtonTapped() {
        print("cancelButtonTapped")
        for order in orderList {
            order.num = 0
        }
        collectionView.reloadData()
    }
    
    // MARK: ProgressViewDelegate
    func showProgressFinished() {
        navigationController?.popViewController(animated: true)
    }
    
    
}



class OrderdCollectionViewCell: CollectionViewCell {
    
}

class OrderdPriceView: FoodPriceView {
    
}
