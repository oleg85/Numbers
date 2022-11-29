//
//  NetworkServise.swift
//  Numbers
//
//  Created by Oleg Arzutov on 28/11/2022.
//

import Foundation
import Alamofire
public typealias ResultWithError<Model> = Result<Model, Error>
public typealias NetworkServiceCompletion<Model: Decodable> = (ResultWithError<Model>) -> Void

public protocol NetworkServiceProtocol: AnyObject {
    associatedtype EndPoint: EndPointType
    
    func request<Model: Decodable>(_ route: EndPoint, completion: @escaping NetworkServiceCompletion<Model>)
   
}

class NetworkServices<EndPoint: EndPointType>: NetworkServiceProtocol{
    func request<Model>(_ route: EndPoint, completion: @escaping NetworkServiceCompletion<Model>){
        DispatchQueue.global().async{
            let url =  self.buildUrlForRequest(from: route)
                let request = AF.request(url)
            request.responseDecodable(of: Response.self) { response in
                  
                    switch response.result {
                  
                    case .success(let result):
                        completion(.success(result as! Model))
                        
                    case .failure(let error):
                       
                        completion(.failure(error))
                    }
               
           }
        }
    }
    
 }


private extension NetworkServices{
    func buildUrlForRequest(from route: EndPointType) -> URL{
        route.baseURL.appendingPathComponent(route.path)
    }
}
