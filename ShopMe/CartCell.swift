//
//  CartCell.swift
//  ShopMe
//
//  Created by Joseph Hoang on 3/2/18.
//  Copyright © 2018 Joe Hoang. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {

    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var numberOfItems: UILabel!
    @IBOutlet weak var priceOfItems: UILabel!
    @IBOutlet weak var cellItem: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
