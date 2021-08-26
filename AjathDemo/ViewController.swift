//
//  ViewController.swift
//  AjathDemo
//
//  Created by SURYA PRATAP SINGH on 25/08/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, URLSessionDelegate {
    
    @IBOutlet weak var listTableView: UITableView?
    var array = [ListModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        callApi()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewListCell") as! TableViewListCell
        let model = array[indexPath.row]
        cell.nameLabel?.text = model.name
        cell.percentLabel?.text = model.percent
        cell.priceLabel?.text = model.price
        cell.rankLabel?.text = model.rank
        cell.symbolLabel?.text = model.symbol
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = (self.storyboard?.instantiateViewController(identifier: "DetailsVC"))! as DetailsVC
        controller.model = self.array[indexPath.row]
        self.present(controller, animated: true, completion: nil)
    }
    
    
    func callApi() {
        let session = URLSession.init(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        guard let urlString = "https://api.coincap.io/v2/assets".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        var request = URLRequest.init(url: URL.init(string: urlString)!)
        request.httpMethod = "GET"
        request.timeoutInterval = 2.0
        let task = session.dataTask(with: request) { (data, response, error) in
            if error == nil{
                if data != nil {
                    do {
                        let dictionary = try JSONSerialization.jsonObject(with: data!, options: []) as! NSDictionary
                        if let arrayApi = dictionary["data"] as? NSArray {
                        
                        if arrayApi != nil {
                            for dic in arrayApi {
                                self.array.append(ListModel.init(dic: dic as! [String : Any]))
                            }
                            DispatchQueue.main.async {
                                let array =  self.array.sorted { (model, listmodel) -> Bool in
                                    Int(model.rank!)! < Int(listmodel.rank!)!
                                }
                                self.array = array
                                self.listTableView?.reloadData()
                            }
                        }
                        }
                    } catch _ {
                        
                    }
                    // self.array =
                }
            }
            
        }
        task.resume()
    }
}
