//
//  ProductsTableViewController.swift
//  ShopMe
//
//  Created by Joseph Hoang on 2/28/18.
//  Copyright © 2018 Joe Hoang. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {

    var allProducts: ItemsInCart = ItemsInCart()

    let groceryImage: [UIImage] = [
                            UIImage(named:"grocery-1-tomatoes")!,
                            UIImage(named:"grocery-2-bananas")!,
                            UIImage(named:"grocery-3-gala")!,
                            UIImage(named:"grocery-4-lettuce")!,
                            UIImage(named:"grocery-5-broccoli")!,
                            UIImage(named:"grocery-6-milk")!,
                            UIImage(named:"grocery-7-bread")!,
                            UIImage(named:"grocery-8-eggs")!]

    let gardenImage: [UIImage] = [
                            UIImage(named:"garden-1-shovel")!,
                            UIImage(named:"garden-2-tomato-plant")!,
                            UIImage(named:"garden-3-mower")!,
                            UIImage(named:"garden-4-garden-soil")!,
                            UIImage(named:"garden-5-fruit-tree")!,
                            UIImage(named:"garden-6-leaves-rake")!]

    let movieImage: [UIImage] = [
                            UIImage(named:"movies-1-shawshank")!,
                            UIImage(named:"movies-2-lord-of-the-rings")!,
                            UIImage(named:"movies-3-godfather")!]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "cart"), style: .plain, target: self, action: #selector(self.toTheCart(_sender:)))
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @objc func toTheCart(_sender: UIButton) {
        performSegue(withIdentifier: "toCart", sender: self)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if self.title == "Grocery" {
            return allProducts.grocerySection!.count
        } else if self.title == "Garden" {
            return allProducts.gardenSection!.count
        } else if self.title == "Movies" {
            return allProducts.movieSection!.count
        } else {
            return 0
        }
    }


    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductTableViewCell
        
        if self.title == "Grocery" {
            cell.productImage.image = groceryImage[indexPath.row]
            cell.productTitle.text = allProducts.grocerySection![indexPath.row].item
            cell.productDescription.text = allProducts.grocerySection![indexPath.row].description
            cell.productCost.text = String(allProducts.grocerySection![indexPath.row].price!)

            cell.addToCart.tag = indexPath.row
            cell.addToCart.addTarget(self, action: #selector(addItemGrocery(sender:)) ,for: .touchUpInside)
            
        } else if self.title == "Garden" {
            cell.productImage.image = gardenImage[indexPath.row]
            cell.productTitle.text = allProducts.gardenSection![indexPath.row].item
            cell.productDescription.text = allProducts.gardenSection![indexPath.row].description
            cell.productCost.text = String(allProducts.gardenSection![indexPath.row].price!)

            cell.addToCart.tag = indexPath.row
            cell.addToCart.addTarget(self, action: #selector(addItemGarden(sender:)) ,for: .touchUpInside)
            
        } else if self.title == "Movies" {
            cell.productImage.image = movieImage[indexPath.row]
            cell.productTitle.text = allProducts.movieSection![indexPath.row].item
            cell.productDescription.text = allProducts.movieSection![indexPath.row].description
            cell.productCost.text = String(allProducts.movieSection![indexPath.row].price!)

            cell.addToCart.tag = indexPath.row
            cell.addToCart.addTarget(self, action: #selector(addItemMovie(sender:)) ,for: .touchUpInside)
        }
        
        // Configure the cell...
        
        return cell
    }
    
    @objc func addItemGrocery(sender: UIButton) {
        self.allProducts.grocerySection![sender.tag].amountOfProduct = self.allProducts.grocerySection![sender.tag].amountOfProduct + 1
        print("\(self.allProducts.grocerySection![sender.tag].amountOfProduct)")
    }
    
    @objc func addItemGarden(sender: UIButton) {
        self.allProducts.gardenSection![sender.tag].amountOfProduct = self.allProducts.gardenSection![sender.tag].amountOfProduct + 1
        print("\(self.allProducts.gardenSection![sender.tag].amountOfProduct)")
        
    }
    
    @objc func addItemMovie(sender: UIButton) {
        self.allProducts.movieSection![sender.tag].amountOfProduct = self.allProducts.movieSection![sender.tag].amountOfProduct + 1
        print("\(self.allProducts.movieSection![sender.tag].amountOfProduct)")
        
    }
    
    
    

    
    
    
    
    
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
