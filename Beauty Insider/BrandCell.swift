//
//  BrandCell.swift
//  Beauty Insider
//
//  Created by Wilda Cheng on 5/4/20.
//  Copyright © 2020 Wilda Cheng. All rights reserved.
//

import UIKit

class BrandCell: UITableViewCell {
    
    @IBOutlet weak var brandImageView: UIImageView!
    @IBOutlet weak var brandTextView: UILabel!
    
    func setBrand(brand: BrandModel) {
        brandTextView.text = brand.name
        
        let url = URL(string: brand.imageLink)
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url!) {
                DispatchQueue.main.async {
                    self.brandImageView.image = UIImage(data: data)
                }
            }
        }
    }
}
