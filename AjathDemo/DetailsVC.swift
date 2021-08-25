//
//  DetailsVC.swift
//  AjathDemo
//
//  Created by SURYA PRATAP SINGH on 25/08/21.
//

import UIKit

class DetailsVC: UIViewController {
    var model : ListModel?
    
    @IBOutlet weak var symbolLabel : UILabel?
    @IBOutlet weak var rankLabel : UILabel?
    @IBOutlet weak var nameLabel : UILabel?
    @IBOutlet weak var priceLabel : UILabel?
    @IBOutlet weak var percentLabel : UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel?.text = model?.name
        self.percentLabel?.text = model?.percent
        self.priceLabel?.text = model?.price
        self.rankLabel?.text = model?.rank
        self.symbolLabel?.text = model?.symbol

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
