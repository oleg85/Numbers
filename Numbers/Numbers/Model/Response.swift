//
//  Response.swift
//  Numbers
//
//  Created by Oleg Arzutov on 28/11/2022.
//

import Foundation
struct Response {
    var numbers: [Number] = []
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.numbers = try container.decode([Number].self, forKey: .numbers)
    }
}

extension Response: Decodable {
    enum CodingKeys: String, CodingKey {
        case numbers = "numbers"
       
    }
}
