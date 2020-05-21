//
//  BrandModel.swift
//  Beauty Insider
//
//  Created by Wilda Cheng on 5/3/20.
//  Copyright © 2020 Wilda Cheng. All rights reserved.
//
// How our data should be modeled 

import Foundation

struct BrandModel {
    let brandId: Int
    let name: String
    let brandName: String
    let price: String
    let imageLink: String
    let description: String
    let rating: Double?
    let productType: String
}
