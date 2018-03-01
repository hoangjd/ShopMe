//
//  ProductsTableViewController.swift
//  ShopMe
//
//  Created by Joseph Hoang on 2/28/18.
//  Copyright © 2018 Joe Hoang. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {
    
    class Product {
        var item: String?
        var description: String?
        var price: Double?
        var amountOfProduct = 0
        init(){
            item = "N/A"
            description = "N/A"
            price = 0.0
        }
    }
    
    var groceryArray: [Product] = [Product]()
    var gardenArray: [Product] = [Product]()
    var movieArray: [Product] = [Product]()
    
    let grocery = ["tomatoes", "bananas", "gala", "lettuce", "broccoli", "milk", "bread", "eggs"]
    let groceryImage: [UIImage] = [ UIImage(named:"grocery-1-tomatoes")!,
                            UIImage(named:"grocery-2-bananas")!,
                            UIImage(named:"grocery-3-gala")!,
                            UIImage(named:"grocery-4-lettuce")!,
                            UIImage(named:"grocery-5-broccoli")!,
                            UIImage(named:"grocery-6-milk")!,
                            UIImage(named:"grocery-7-bread")!,
                            UIImage(named:"grocery-8-eggs")!]
    let groceryDescription = ["On the vine", "Very durable", "Gala Apples", "Green leaf lettuce", "Brunch", "One box, Organic", "Whole grain", "Free range"]
    let groceryPrice: [Double] = [2.45, 0.49, 1.47, 3.19, 1.99, 4.49, 3.49, 1.99]
    let groceryCount: [Int] = [0, 0, 0, 0, 0, 0, 0, 0]
    
    let garden = ["shovel", "tomato plant", "mower", "garden soil", "fruit tree", "rake"]
    let gardenImage: [UIImage] = [
                            UIImage(named:"garden-1-shovel")!,
                            UIImage(named:"garden-2-tomato-plant")!,
                            UIImage(named:"garden-3-mower")!,
                            UIImage(named:"garden-4-garden-soil")!,
                            UIImage(named:"garden-5-fruit-tree")!,
                            UIImage(named:"garden-6-leaves-rake")!]
    let gardenDescription = ["Steel", "Easy to grow", "1.5 Horse Power", "Chunky", "Lemon", "For fall"]
    let gardenPrice: [Double] = [14.99, 10.99, 150.00, 10.99, 19.99, 9.99]
    let gardenCount: [Int] = [0, 0, 0, 0, 0, 0]
    
    let movies = ["Shawshank Redemption", "Lord of the Rings", "Godfather"]
    let movieDescription = ["Drama", "Sci-Fi", "Drama"]
    let moviePrice: [Double] = [9.99, 9.99, 9.99]
    let movieCount: [Int] = [0, 0, 0]
    let movieImage: [UIImage] = [
                            UIImage(named:"movies-1-shawshank")!,
                            UIImage(named:"movies-2-lord-of-the-rings")!,
                            UIImage(named:"movies-3-godfather")!]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeGroceryClass(title: grocery, descrip: groceryDescription, priceOf: groceryPrice, type: "grocery")
        makeGroceryClass(title: garden, descrip: gardenDescription, priceOf: gardenPrice, type: "garden")
        makeGroceryClass(title: movies, descrip: movieDescription, priceOf: moviePrice, type: "movie")
      //   navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "cart"), style: .plain, target: self, action: #selector())
    //   let item = ViewController.itemChoose
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func makeGroceryClass(title: [String], descrip: [String], priceOf: [Double], type: String){
        var i = 0
        if type == "grocery"{
            while i < title.count {
                let grocery = Product()
                grocery.item = title[i]
                grocery.description = descrip[i]
                grocery.price = priceOf[i]
                groceryArray.append(grocery)
                i = i + 1
            }
        } else if type == "garden" {
            while i < title.count {
                let garden = Product()
                garden.item = title[i]
                garden.description = descrip[i]
                garden.price = priceOf[i]
                gardenArray.append(garden)
                i = i + 1
            }
        } else {
            while i < title.count {
                let movie = Product()
                movie.item = title[i]
                movie.description = descrip[i]
                movie.price = priceOf[i]
                movieArray.append(movie)
                i = i + 1
            }
        }
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

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        if self.title == "Grocery" {
//            return groceries.count
//        } else if self.title == "Garden" {
//            return garden.count
//        } else if self.title == "Movies" {
//            return movies.count
//        } else {
//            return 0
//        }
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if self.title == "Grocery" {
            return groceryArray.count
        } else if self.title == "Garden" {
            return gardenArray.count
        } else if self.title == "Movies" {
            return movieArray.count
        } else {
            return 0
        }
    }

    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductTableViewCell
//
//        if self.title == "Grocery" {
//            cell.productImage.image = groceryImage[indexPath.row]
//            cell.productTitle.text = grocery[indexPath.row]
//            cell.productDescription.text = groceryDescription[indexPath.row]
//            cell.productCost.text = String(groceryPrice[indexPath.row])
//            cell.addToCart.tag = indexPath.row
//
//        } else if self.title == "Garden" {
//            cell.productImage.image = gardenImage[indexPath.row]
//            cell.productTitle.text = garden[indexPath.row]
//            cell.productDescription.text = gardenDescription[indexPath.row]
//            cell.productCost.text = String(gardenPrice[indexPath.row])
//
//        } else if self.title == "Movies" {
//            cell.productImage.image = movieImage[indexPath.row]
//            cell.productTitle.text = movies[indexPath.row]
//            cell.productDescription.text = movieDescription[indexPath.row]
//            cell.productCost.text = String(moviePrice[indexPath.row])
//        }
//
//        // Configure the cell...
//
//        return cell
//    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductTableViewCell
        
        if self.title == "Grocery" {
            cell.productImage.image = groceryImage[indexPath.row]
            cell.productTitle.text = groceryArray[indexPath.row].item
            cell.productDescription.text = groceryArray[indexPath.row].description
            cell.productCost.text = String(groceryArray[indexPath.row].price!)
            cell.addToCart.tag = indexPath.row
            
        } else if self.title == "Garden" {
            cell.productImage.image = gardenImage[indexPath.row]
            cell.productTitle.text = gardenArray[indexPath.row].item
            cell.productDescription.text = gardenArray[indexPath.row].description
            cell.productCost.text = String(gardenArray[indexPath.row].price!)
            
        } else if self.title == "Movies" {
            cell.productImage.image = movieImage[indexPath.row]
            cell.productTitle.text = movieArray[indexPath.row].item
            cell.productDescription.text = movieArray[indexPath.row].description
            cell.productCost.text = String(movieArray[indexPath.row].price!)
        }
        
        // Configure the cell...
        
        return cell
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
