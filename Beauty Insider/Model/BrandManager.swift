//
//  BrandManager.swift
//  Beauty Insider
//
//  Created by Wilda Cheng on 5/3/20.
//  Copyright © 2020 Wilda Cheng. All rights reserved.
//
//

import Foundation

protocol BrandManagerDelegate {
    func receivedBrandData(_ brandManager: BrandManager, brandData: [BrandModel])
}

struct BrandManager {
    let brandURL = "https://makeup-api.herokuapp.com/api/v1/products.json?brand="
    
    var delegate: BrandManagerDelegate?
    
    func fetchBrand(brandName: String) {
        let urlString = "\(brandURL)\(brandName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    if let brandData = self.parseJSON(brandData: safeData) {
                        self.delegate?.receivedBrandData(self, brandData: brandData)
                    }
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(brandData: Data) -> [BrandModel]? {
        let decoder = JSONDecoder()
        do {
           let decodedData = try decoder.decode([BrandData].self, from: brandData)
            var brandDataArray: [BrandModel] = []
            for oneData in decodedData {
                brandDataArray.append(BrandModel(brandId: oneData.id, name: oneData.name, brandName: oneData.brand, price: oneData.price, imageLink: oneData.image_link, description: oneData.description, rating: oneData.rating, productType: oneData.product_type))
            }
            return brandDataArray
        } catch {
            print(error)
            return nil
        }
        
    }
    
}
