//
//  ViewController.swift
//  Order
//
//  Created by 渡邉　博 on 2019/07/17.
//  Copyright © 2019 Hiroshi Watanabe. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, SideMenuLauncherDelegate, FoodPriceViewDelegate, OrderdCollectionViewControllerDelegate {

    let foodModel = FoodModel()
    let foodPriceView = FoodPriceView()
    let sideMenuLauncher = SideMenuLauncher()
    let cellId = "cellId"
    
    var foodArray = [Food]()
    var orderList = [Food]()
    var decidedOrder = [Food]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "List"
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        foodArray = foodModel.getFoodArray(category: "beer")
        sideMenuLauncher.delegate = self
        setupNav()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        collectionView.reloadData()
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodArray.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CollectionViewCell
        let food = foodArray[indexPath.item]
        cell.foodImageView.image = UIImage(named: food.name)
        cell.foodNameLabel.text = food.name
        cell.foodPriceView.priceLabel.text = "¥\(food.price)"
        cell.foodPriceView.countLabel.text = "\(food.num)"
        cell.foodPriceView.food = food
        cell.foodPriceView.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 125)
    }
    
    // MARK: SideMenu & CartButton
    func setupNav() {
        let categoryImage = UIImage(named: "menu-button")?.withRenderingMode(.alwaysOriginal)
        let categoryButtonItem = UIBarButtonItem(image: categoryImage, style: .plain, target: self, action: #selector(categoryButtonTapped))
        navigationItem.leftBarButtonItem = categoryButtonItem
        
        let cartImage = UIImage(named: "cart")?.withRenderingMode(.alwaysOriginal)
        let cartButtonItem = UIBarButtonItem(image: cartImage, style: .plain, target: self, action: #selector(cartButtonTapped))
        navigationItem.rightBarButtonItem = cartButtonItem
        
    }
    
    @objc func categoryButtonTapped() {
        print("categoryButtonTapped")
        sideMenuLauncher.showSideMenu()
    }
    
    @objc func cartButtonTapped() {
        print("cartButtonTapped")
        let layout = UICollectionViewFlowLayout()
        let orderdCV = OrderdCollectionViewController(collectionViewLayout: layout)
        orderdCV.orderList = self.orderList
        orderdCV.decidedOrder = self.decidedOrder
        orderdCV.delegate = self
        self.navigationController?.pushViewController(orderdCV, animated: true)
    }
    
    
    // MARK: SideMenuLauncherDelegate
    func setCategory(category: String) {
        foodArray = foodModel.getFoodArray(category: category)
        collectionView.reloadData()
    }
    
    func checkButtonTapped() {
        let layout = UICollectionViewFlowLayout()
        let billCV = BillCollectionViewController(collectionViewLayout: layout)
        billCV.decidedOrder = self.decidedOrder
        navigationController?.pushViewController(billCV, animated: true)
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
        
        var orderCopy = orderList
        for (index, order) in orderCopy.enumerated() {
            if order === food {
                orderCopy.remove(at: index)
            }
        }
        orderList = orderCopy
        print("del: ", orderList.map({ $0.name }))
    }
    
    
    // MARK: OrderdCollectionViewControllerDelegate
    func sendOrderList(orderList: [Food]) {
        self.orderList = orderList
    }
    
    func sendDecidedOrder(decidedOrder: [Food]) {
        self.decidedOrder = decidedOrder
    }

}

