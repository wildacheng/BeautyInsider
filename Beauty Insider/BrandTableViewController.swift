//
//  BrandTableViewController.swift
//  Beauty Insider
//
//  Created by Wilda Cheng on 5/4/20.
//  Copyright © 2020 Wilda Cheng. All rights reserved.
//

import UIKit

class BrandTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var tableData: [BrandModel] = []
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let brand = tableData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "BrandCell") as! BrandCell
        
        cell.setBrand(brand: brand)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
