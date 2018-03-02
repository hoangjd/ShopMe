//
//  ItemsInCart.swift
//  ShopMe
//
//  Created by Joseph Hoang on 3/1/18.
//  Copyright © 2018 Joe Hoang. All rights reserved.
//

import Foundation



class ItemsInCart {
    var grocerySection: [Product]?
    var gardenSection: [Product]?
    var movieSection:[Product]?
    init(){
        initializeEverything()
    }
    
    
    func initializeEverything(){
        self.grocerySection = createGroceryArray()
        self.gardenSection = createGardenArray()
        self.movieSection = createMovieArray()
    }
    
    func howManyItemsinGrocery() -> Int {
        var count = 0
        var i = 0
        while i < grocerySection!.count {
            if grocerySection![i].amountOfProduct > 0 {
                count = count + 1
            }
            i = i + 1
        }
        return count
    }
    
    func howManyItemsinGarden() -> Int {
        var count = 0
        var i = 0
        while i < gardenSection!.count {
            if gardenSection![i].amountOfProduct > 0 {
                count = count + 1
            }
            i = i + 1
        }
        return count
    }
    
    func howManyItemsinMovie() -> Int {
        var count = 0
        var i = 0
        while i < movieSection!.count {
            if movieSection![i].amountOfProduct > 0 {
                count = count + 1
            }
            i = i + 1
        }
        return count
    }
    
    var groceryArray = [Product]()
    var gardenArray = [Product]()
    var movieArray = [Product]()
    
    func createGroceryArray() -> [Product]{
        let grocery = ["tomatoes", "bananas", "gala", "lettuce", "broccoli", "milk", "bread", "eggs"]
        let groceryDescription = ["On the vine", "Very durable", "Gala Apples", "Green leaf lettuce", "Brunch", "One box, Organic", "Whole grain", "Free range"]
        let groceryPrice: [Double] = [2.45, 0.49, 1.47, 3.19, 1.99, 4.49, 3.49, 1.99]
        let groceryArray = makeArrayHelper(title: grocery, descrip: groceryDescription, priceOf: groceryPrice, type: "grocery")
        return groceryArray
    }
    
    func createGardenArray()->[Product]{
        let garden = ["shovel", "tomato plant", "mower", "garden soil", "fruit tree", "rake"]
        let gardenDescription = ["Steel", "Easy to grow", "1.5 Horse Power", "Chunky", "Lemon", "For fall"]
        let gardenPrice: [Double] = [14.99, 10.99, 150.00, 10.99, 19.99, 9.99]
        let gardenArray = makeArrayHelper(title: garden, descrip: gardenDescription, priceOf: gardenPrice, type: "garden")
        return gardenArray
    }
    
    func createMovieArray()->[Product]{
        let movies = ["Shawshank Redemption", "Lord of the Rings", "Godfather"]
        let movieDescription = ["Drama", "Sci-Fi", "Drama"]
        let moviePrice: [Double] = [9.99, 9.99, 9.99]
        let movieArray = makeArrayHelper(title: movies, descrip: movieDescription, priceOf: moviePrice, type: "movie")
        return movieArray
    }
    
    func makeArrayHelper(title: [String], descrip: [String], priceOf: [Double], type: String) -> [Product]{
        var i = 0
//        var groceryArray = [Product]()
//        var gardenArray = [Product]()
//        var movieArray = [Product]()
        if type == "grocery"{
            while i < title.count {
                let grocery = Product()
                grocery.item = title[i]
                grocery.description = descrip[i]
                grocery.price = priceOf[i]
                groceryArray.append(grocery)
                //   productsAndCategories.grocerySection!.append(grocery)
                i = i + 1
            }
            return groceryArray
        } else if type == "garden" {
            while i < title.count {
                let garden = Product()
                garden.item = title[i]
                garden.description = descrip[i]
                garden.price = priceOf[i]
                gardenArray.append(garden)
                //       productsAndCategories.gardenSection!.append(garden)
                i = i + 1
            }
            return gardenArray
        } else {
            while i < title.count {
                let movie = Product()
                movie.item = title[i]
                movie.description = descrip[i]
                movie.price = priceOf[i]
                movieArray.append(movie)
                //          productsAndCategories.movieSection!.append(movie)
                i = i + 1
            }
            return movieArray
        }
    }
    
    
}
