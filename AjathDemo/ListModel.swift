//
//  ListModel.swift
//  AjathDemo
//
//  Created by SURYA PRATAP SINGH on 25/08/21.
//

import UIKit

class ListModel: NSObject {
    var name: String?
    var rank: String?
    var symbol: String?
    var id: String?
    var percent: String?
    var price: String?

    init(dic: [String: Any]) {
        self.id = dic["id"] as? String ?? ""
        self.name = dic["name"] as? String ?? ""
        self.rank = dic["rank"] as? String ?? ""
        self.symbol = dic["symbol"] as? String ?? ""
        self.percent = dic["changePercent24Hr"] as? String ?? ""
        self.price = dic["priceUsd"] as? String ?? ""
    }
}
