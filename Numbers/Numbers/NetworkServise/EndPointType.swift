//
//  EndPointType.swift
//  Numbers
//
//  Created by Oleg Arzutov on 28/11/2022.
//

import Foundation
public protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    
}
