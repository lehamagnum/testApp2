//
//  TableViewModel.swift
//  testApp2
//
//  Created by Алексей Патрушев on 05.04.2025.
//

import Foundation
import UIKit

struct ProductModel {
    
    var image: UIImage?
    var title: String
    var description: String
    var price: String
}

struct TestModel: Decodable {
    
    var userId: Int
    var id: Int
    var title: String
    var body: String

}

