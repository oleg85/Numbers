//
//  NumbersAPI.swift
//  Numbers
//
//  Created by Oleg Arzutov on 28/11/2022.
//

import Foundation
enum NumbersAPI {
    case getNumbers
}

extension NumbersAPI: EndPointType {
    var baseURL: URL {
        URL(string: "https://pastebin.com")!
    }

    var path: String {
        switch self {
        case .getNumbers:
            return "/raw/cKT8eYt5"
        }
    }
  
}
