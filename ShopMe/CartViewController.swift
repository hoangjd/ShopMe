//
//  CartViewController.swift
//  ShopMe
//
//  Created by Joseph Hoang on 3/1/18.
//  Copyright © 2018 Joe Hoang. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var cartTableView: UITableView!
    var cartItems = ItemsInCart()
    var indexOfSectionGrocery: Int?
    var indexOfSectionGarden: Int?
    var indexOfSectionMovie: Int?
    var titleOfSections = [String]()
    var itemsInSection = [[String]]()
    var isGrocery = false
    var isGarden = false
    var isMovie = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title =  "Cart"
        
        
    }
    // create our 1d array
    func createSections() -> [String] {
        var sections = [String]()
        if cartItems.howManyItemsinGrocery() > 0 {
            sections.append("Grocery")
            isGrocery = true
        }
        if cartItems.howManyItemsinGarden() > 0 {
            sections.append("Garden")
            isGarden = true
        }
        if cartItems.howManyItemsinMovie() > 0 {
            sections.append("Movie")
            isMovie = true
        }
        
        return sections
    }
    
    //for populating movie goes with createItemsinsections
    func populateMovies() -> [String] {
        var productsArray = [String]()
        for good in cartItems.movieSection! {
            if good.amountOfProduct > 0{
                productsArray.append(good.item!)
            }
        }
        return productsArray
    }
    //for populating garden goes with createItemsinsections
    func populateGarden() -> [String] {
        var productsArray = [String]()
        for good in cartItems.gardenSection! {
            if good.amountOfProduct > 0{
                productsArray.append(good.item!)
            }
        }
        return productsArray
    }
    //for populating grocery goes with createItemsinsections
    func populateGrocery() -> [String] {
        var productsArray = [String]()
        for good in cartItems.grocerySection! {
            if good.amountOfProduct > 0{
                productsArray.append(good.item!)
            }
        }
        return productsArray
    }
    
    //for populating our 2d items array
    func createItemsInSections() -> [[String]] {
        var productsBySection = [[String]]()
        if titleOfSections.count > 0 {
            
            if titleOfSections[0] == "Grocery" {
                productsBySection.insert(populateGrocery(), at: 0)
            } else if titleOfSections[0] == "Garden" {
                productsBySection.insert(populateGarden(), at: 0)
            } else if titleOfSections[0] == "Movie" {
                productsBySection.insert(populateMovies(), at: 0)
            }
            if titleOfSections.count > 1 {
                
                if titleOfSections[1] == "Garden" {
                    productsBySection.insert(populateGarden(), at: 1)
                } else if titleOfSections[1] == "Movie" {
                    productsBySection.insert(populateMovies(), at: 1)
                }
            }
            if titleOfSections.count > 2 {
                if titleOfSections[2] == "Movie" {
                    productsBySection.insert(populateMovies(), at: 2)
                }
            }
        }
        return productsBySection
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    // get number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        titleOfSections = createSections()
        itemsInSection = createItemsInSections()
        
        return titleOfSections.count
    }
    // get titles of sections
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //logic for finding title
        if section == 0{
            if isGrocery {
                indexOfSectionGrocery = 0
                return "Grocery"
            } else if isGarden {
                indexOfSectionGarden = 0
                return "Garden"
            } else {
                indexOfSectionMovie = 0
                return "Movie"
            }
        } else if section == 1 {
            if isGarden {
                indexOfSectionGarden = 1
                return "Garden"
            } else {
                indexOfSectionMovie = 1
                return "Movie"
            }
        } else {
            indexOfSectionMovie = 2
            return "Movie"
        }
        
    }
    
    //get number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of row
        //returns number of unique items in a section
        if isGrocery && section < 1 {
            return cartItems.howManyItemsinGrocery()
        } else if isGarden && section < 2 {
            return cartItems.howManyItemsinGarden()
        } else if isMovie && section < 3 {
            return cartItems.howManyItemsinMovie()
        }
        return 0
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "theCartCell", for: indexPath) as! CartCell
        print("\(itemsInSection)")
        print("\(titleOfSections)")
        let category: String = titleOfSections[indexPath.section]
        let theItem: String = itemsInSection[indexPath.section][indexPath.row]
        var itemNumber: Int = numberOfItems(catIdentifier: category, itemIdentifier: theItem, itemsToSearch: cartItems)
        var itemPrice: Double = itemPricing(number: itemNumber, catIdentifier: category, itemIdentifier: theItem, itemsToSearch: cartItems)
        var total = Double(itemNumber) * itemPrice
        
        cell.cellItem.text = theItem
        cell.numberOfItems.text = String(itemNumber)
        cell.priceOfItems.text = String(total)
        
        if category == "Grocery"{
            cell.decreaseButton.tag = indexPath.row
            cell.decreaseButton.addTarget(self, action: #selector(subItemGrocery(sender:)) ,for: .touchUpInside)
            cell.increaseButton.tag = indexPath.row + 20
            cell.increaseButton.addTarget(self, action: #selector(addItemGrocery(sender:)) ,for: .touchUpInside)
        } else if category == "Garden"{
            cell.decreaseButton.tag = indexPath.row + 40
            cell.decreaseButton.addTarget(self, action: #selector(subItemGarden(sender:)) ,for: .touchUpInside)
            cell.increaseButton.tag = indexPath.row + 60
            cell.increaseButton.addTarget(self, action: #selector(addItemGarden(sender:)) ,for: .touchUpInside)
        } else {
            cell.decreaseButton.tag = indexPath.row + 80
            cell.decreaseButton.addTarget(self, action: #selector(subItemMovie(sender:)) ,for: .touchUpInside)
            cell.increaseButton.tag = indexPath.row + 100
            cell.increaseButton.addTarget(self, action: #selector(addItemMovie(sender:)) ,for: .touchUpInside)
        }
        // Configure the cell...
        
        return cell
    }
    
    //to -1 grocery
    @objc func subItemGrocery(sender: UIButton) {
        
        //this line tells the index of the item to be decremented in our table
        let index = searchForGroceryItem(theItem:self.itemsInSection[indexOfSectionGrocery!][sender.tag])
        if cartItems.grocerySection![index].amountOfProduct > 0 {
            cartItems.grocerySection![index].amountOfProduct = cartItems.grocerySection![index].amountOfProduct - 1
            self.cartTableView.reloadData()
        }
    }
    
    @objc func addItemGrocery(sender: UIButton) {
        
        //this line tells the index of the item to be decremented in our table
        let index = searchForGroceryItem(theItem:self.itemsInSection[indexOfSectionGrocery!][sender.tag - 20])
        if cartItems.grocerySection![index].amountOfProduct > 0 {
            cartItems.grocerySection![index].amountOfProduct = cartItems.grocerySection![index].amountOfProduct + 1
            self.cartTableView.reloadData()
        }
    }
    
    @objc func subItemGarden(sender: UIButton) {
        
        //this line tells the index of the item to be decremented in our table
        let index = searchForGardenItem(theItem:self.itemsInSection[indexOfSectionGarden!][sender.tag-40])
        if cartItems.gardenSection![index].amountOfProduct > 0 {
            cartItems.gardenSection![index].amountOfProduct = cartItems.gardenSection![index].amountOfProduct - 1
            self.cartTableView.reloadData()
        }
    }
    
    @objc func addItemGarden(sender: UIButton) {
        
        //this line tells the index of the item to be decremented in our table
        let index = searchForGardenItem(theItem:self.itemsInSection[indexOfSectionGarden!][sender.tag - 60])
        if cartItems.gardenSection![index].amountOfProduct > 0 {
            cartItems.gardenSection![index].amountOfProduct = cartItems.gardenSection![index].amountOfProduct + 1
            self.cartTableView.reloadData()
        }
    }
    
    @objc func subItemMovie(sender: UIButton) {
        
        //this line tells the index of the item to be decremented in our table
        let index = searchForMovieItem(theItem:self.itemsInSection[indexOfSectionMovie!][sender.tag-80])
        if cartItems.movieSection![index].amountOfProduct > 0 {
            cartItems.movieSection![index].amountOfProduct = cartItems.movieSection![index].amountOfProduct - 1
            self.cartTableView.reloadData()
        }
    }
    
    @objc func addItemMovie(sender: UIButton) {
        
        //this line tells the index of the item to be decremented in our table
        let index = searchForMovieItem(theItem:self.itemsInSection[indexOfSectionMovie!][sender.tag - 100])
        if cartItems.movieSection![index].amountOfProduct > 0 {
            cartItems.movieSection![index].amountOfProduct = cartItems.movieSection![index].amountOfProduct + 1
            self.cartTableView.reloadData()
        }
    }
    //goes along with -1 grocery
    func searchForGroceryItem(theItem: String) -> Int {
        var index = 0
        for good in cartItems.grocerySection!{
            if good.item == theItem {
                return index
            }
            index = index + 1
        }
        return 0
    }
    
    func searchForGardenItem(theItem: String) -> Int {
        var index = 0
        for good in cartItems.gardenSection!{
            if good.item == theItem {
                return index
            }
            index = index + 1
        }
        return 0
    }
    
    func searchForMovieItem(theItem: String) -> Int {
        var index = 0
        for good in cartItems.movieSection!{
            if good.item == theItem {
                return index
            }
            index = index + 1
        }
        return 0
    }
    
    //find price of item
    func itemPricing(number: Int, catIdentifier: String, itemIdentifier: String, itemsToSearch: ItemsInCart) -> (Double) {
        if catIdentifier == "Grocery" {
            for good in itemsToSearch.grocerySection!{
                if itemIdentifier == good.item {
                    return good.price!
                    
                }
            }
        } else if catIdentifier == "Garden" {
            for good in itemsToSearch.gardenSection!{
                if itemIdentifier == good.item {
                    return good.price!
                    
                }
            }
        } else {
            for good in itemsToSearch.movieSection!{
                if itemIdentifier == good.item {
                    return good.price!                }
            }
        }
        return 0
    }
    
    //find number of items
    func numberOfItems(catIdentifier: String, itemIdentifier: String, itemsToSearch: ItemsInCart) -> Int{
        if catIdentifier == "Grocery" {
            for good in itemsToSearch.grocerySection!{
                if itemIdentifier == good.item {
                    return good.amountOfProduct
                }
            }
        } else if catIdentifier == "Garden" {
            for good in itemsToSearch.gardenSection!{
                if itemIdentifier == good.item {
                    return good.amountOfProduct
                }
            }
        } else {
            for good in itemsToSearch.movieSection!{
                if itemIdentifier == good.item {
                    return good.amountOfProduct
                }
            }
        }
        return 0
    }
    
}
