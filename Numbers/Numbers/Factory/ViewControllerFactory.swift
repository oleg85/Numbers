//
//  ViewControllerFactory.swift
//  Numbers
//
//  Created by Oleg Arzutov on 29/11/2022.
//

import Foundation
import UIKit

struct StoryboardRepresentation {
    let bundle: Bundle?
    let storyboardName: String
    let storyboardId: String
}

enum TypeOfViewController {
    case main
}

extension TypeOfViewController {
    func storyboardRepresentation() -> StoryboardRepresentation {
        switch self {
        case .main:
            return StoryboardRepresentation(bundle: nil, storyboardName: "Main", storyboardId: "NumbersViewController")
       
    }
  }
}
class ViewControllerFactory: NSObject {
    static func viewController(for typeOfVC: TypeOfViewController) -> UIViewController {
        let metadata = typeOfVC.storyboardRepresentation()
        let sb = UIStoryboard(name: metadata.storyboardName, bundle: metadata.bundle)
        let vc = sb.instantiateViewController(withIdentifier: metadata.storyboardId)
        return vc
    }
    
}




