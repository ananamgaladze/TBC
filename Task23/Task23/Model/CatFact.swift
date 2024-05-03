//
//  model.swift
//  Task23
//
//  Created by ana namgaladze on 02.05.24.
//

import Foundation
 
struct Facts: Decodable {
    var fact: String
    var length: Int
}
 
struct FactsInfo: Decodable {
    var data: [Facts]
}
