//
//  TableViewListCell.swift
//  AjathDemo
//
//  Created by SURYA PRATAP SINGH on 25/08/21.
//

import UIKit

class TableViewListCell: UITableViewCell {
    @IBOutlet weak var symbolLabel : UILabel?
    @IBOutlet weak var rankLabel : UILabel?
    @IBOutlet weak var nameLabel : UILabel?
    @IBOutlet weak var priceLabel : UILabel?
    @IBOutlet weak var percentLabel : UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
