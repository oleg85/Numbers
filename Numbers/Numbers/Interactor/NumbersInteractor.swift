//
//  NumbersInteractor.swift
//  Numbers
//
//  Created by Oleg Arzutov on 28/11/2022.
//

import Foundation
import Alamofire

protocol NumbersInteractorProtocol {
    typealias FetchCompletion = (Result<Response, Error>) -> Void
    
    func getNumbers(completion: @escaping FetchCompletion)
}

struct NumbersInteractor: NumbersInteractorProtocol {
    let service = NetworkServices<NumbersAPI>()
    func getNumbers(completion: @escaping FetchCompletion) {
        service.request(.getNumbers, completion: completion)
    }
}
