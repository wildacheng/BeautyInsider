//
//  ViewController.swift
//  Beauty Insider
//
//  Created by Wilda Cheng on 5/1/20.
//  Copyright © 2020 Wilda Cheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, BrandManagerDelegate {

    @IBOutlet weak var searchTextField: UITextField!
    
    var brandManager = BrandManager()
    
    var brands: [BrandModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        brandManager.delegate = self
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type Something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let brand = searchTextField.text {
            brandManager.fetchBrand(brandName: brand)
        }
        searchTextField.text = ""
    }
    
    func receivedBrandData(_ brandManager: BrandManager, brandData: [BrandModel]) {
        self.brands = brandData
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "brandTableView", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! BrandTableViewController
        vc.tableData = self.brands
    }
    
    
    
}

