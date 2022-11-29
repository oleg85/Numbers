//
//  NetworkResponseError.swift
//  Numbers
//
//  Created by Oleg Arzutov on 28/11/2022.
//

import Foundation

public enum NetworkResponseError: Error {

    case httpURLResponseCastFailed
    case noData
    
    var localizedDescription: String {
        switch self {
        case .httpURLResponseCastFailed: return "HTTP url response cast failed."
        case .noData: return "Response returned with no data to decode."
        }
    }
}
