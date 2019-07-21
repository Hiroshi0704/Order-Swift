//
//  BillCollectionViewController.swift
//  Order
//
//  Created by 渡邉　博 on 2019/07/20.
//  Copyright © 2019 Hiroshi Watanabe. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class BillCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var decidedOrder = [Food]()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.collectionView!.register(BillCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return decidedOrder.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BillCollectionViewCell
        let food = decidedOrder[indexPath.item]
        cell.foodImageView.image = UIImage(named: food.name)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 125)
    }

}

