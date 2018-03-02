//
//  CartTableViewCell.swift
//  ShopMe
//
//  Created by Joseph Hoang on 3/1/18.
//  Copyright © 2018 Joe Hoang. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var priceOfItems: UILabel!
    @IBOutlet weak var numberOfItems: UILabel!
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
