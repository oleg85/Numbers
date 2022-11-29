//
//  Number.swift
//  Numbers
//
//  Created by Oleg Arzutov on 28/11/2022.
//

import Foundation
struct Number: Decodable,Equatable{
    var number: Int?
    
    enum CodingKeys: CodingKey {
        case number
    }
}
