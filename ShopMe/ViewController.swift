//
//  ViewController.swift
//  ShopMe
//
//  Created by Joseph Hoang on 2/26/18.
//  Copyright © 2018 Joe Hoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    let shoppingOptions = ["Recent Orders", "Cart", "Grocery", "Clothing", "Movies", "Garden", "Electronics", "Books", "Appliances", "Toys"]
    
    let shoppingImages: [UIImage] = [
        UIImage(named:"category-1-recent.png")!,
        UIImage(named:"category-2-cart.png")!,
        UIImage(named:"category-3-grocery.png")!,
        UIImage(named:"category-4-clothing.png")!,
        UIImage(named:"category-5-movies.png")!,
        UIImage(named:"category-6-garden.png")!,
        UIImage(named:"category-7-electronics.png")!,
        UIImage(named:"category-8-books.png")!,
        UIImage(named:"category-9-appliances.png")!,
        UIImage(named:"category-10-toys.png")!
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let logo = UIImage(named: "logo")
        self.navigationItem.titleView = UIImageView(image: logo)
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingOptions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ShoppingCell
        cell.shoppingLabel.text = shoppingOptions[indexPath.item]
        cell.shoppingImageView.image = shoppingImages[indexPath.item]
        return cell
    }
}

