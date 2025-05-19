//
//  TableViewModel.swift
//  testApp2
//
//  Created by Алексей Патрушев on 05.04.2025.
//

import Foundation
import UIKit

struct ProductResponceModel: Decodable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: CategoryResponceModel
    let image: String
    let rating: RatingResponceModel
}

enum CategoryResponceModel: String, Decodable {
    case electronics = "electronics"
    case jewelery = "jewelery"
    case menSClothing = "men's clothing"
    case womenSClothing = "women's clothing"
}

// MARK: - Rating
struct RatingResponceModel: Decodable {
    let rate: Double
    let count: Int
}


