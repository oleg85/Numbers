//
//  NumbersRepository.swift
//  Numbers
//
//  Created by Oleg Arzutov on 28/11/2022.
//

import Foundation
import Network

protocol NumbersRepositoryProtocol {
    typealias FetchCompletion = (Result<Response, Error>) -> Void
   
    
    func getNumbers(completion: @escaping FetchCompletion)
}

final class NumbersRepository: NumbersRepositoryProtocol {
    
    private let interactor: NumbersInteractor
 
    var networkAvailable: Bool!
    
    init(interactor: NumbersInteractor) {
        self.interactor = interactor
    }
    
     func getNumbers(completion: @escaping FetchCompletion) {
        
        if Connectivity.isConnectedToInternet() {
            interactorFetch(completion: completion)
         }
      else{
            completion(.failure(NetworkResponseError.httpURLResponseCastFailed))
        }
    }
    
  
    
}

private extension NumbersRepository {
  
    func interactorFetch( completion: @escaping FetchCompletion) {
        interactor.getNumbers(completion: completion)
    }
    
}


