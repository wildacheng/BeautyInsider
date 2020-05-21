//
//  BrandData.swift
//  Beauty Insider
//
//  Created by Wilda Cheng on 5/3/20.
//  Copyright © 2020 Wilda Cheng. All rights reserved.
//
// How data coming in looks like and how to parse the into json

import Foundation

struct BrandData: Codable {
    let id: Int
    let name: String
    let brand: String
    let price: String
    let image_link: String
    let description: String
    let rating: Double?
    let product_type: String
}
