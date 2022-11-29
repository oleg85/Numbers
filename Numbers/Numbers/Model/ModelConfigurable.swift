//
//  ModelConfigurable.swift
//  Numbers
//
//  Created by Oleg Arzutov on 29/11/2022.
//

import Foundation
protocol ModelConfigurable {
    associatedtype Model
    func configure(with model: Model)
}
