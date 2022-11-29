//
//  Connectivity.swift
//  Numbers
//
//  Created by Oleg Arzutov on 28/11/2022.
//

import Foundation
import Alamofire
class Connectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
