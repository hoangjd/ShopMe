//
//  CartTableViewController.swift
//  ShopMe
//
//  Created by Joseph Hoang on 2/28/18.
//  Copyright © 2018 Joe Hoang. All rights reserved.
//

import UIKit

class CartTableViewController: ProductsTableViewController {
    
    var isGrocerySection = false
    var isGardenSection = false
    var isMovieSection = false

    var titleOfSections = ["Grocery", "Garden", "Movies"]
    var numberOfRows = [0, 0, 0]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title =  "Cart"
        
        print("\(groceryArray[0].amountOfProduct)")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
//    func checkNumberOfItems(array: [Product]) -> Int {
//        var count = 0
//        var i = 0
//        while i < array.count {
//            if array[i].amountOfProduct > 0 {
//                count = count + 1
//            }
//            i = i + 1
//        }
//        return count
//    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
//        var sections = 0
//        if checkNumberOfItems(array: groceryArray) > 0{
//            sections = sections + 1
//            isGrocerySection = true
//        } else {
//            isGrocerySection = false
//        }
//        if checkNumberOfItems(array: gardenArray) > 0{
//            sections = sections + 1
//            isGardenSection = true
//        } else {
//            isGardenSection = false
//        }
//        if checkNumberOfItems(array: movieArray) > 0{
//            sections = sections + 1
//            isMovieSection = true
//        } else {
//            isMovieSection = false
//        }
//
//        return sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        if isGrocerySection == true {
//            numberOfRows[0] = checkNumberOfItems(array: groceryArray)
//        }
//        if isGardenSection == true {
//            numberOfRows[1] = checkNumberOfItems(array: gardenArray)
//        }
//        if isMovieSection == true {
//            numberOfRows[2] = checkNumberOfItems(array: movieArray)
//        }

        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
