//
//  UIViewControllerFactory.swift
//  Numbers
//
//  Created by Oleg Arzutov on 29/11/2022.
//

import Foundation

import Foundation
import UIKit

struct UIViewControllerFactory {
    
    static func make(for typeOfVC: TypeOfViewController) -> UIViewController {
        
        let interactor = NumbersInteractor()
        let respository = NumbersRepository(interactor: interactor)
        let viewController = ViewControllerFactory.viewController(for: typeOfVC)
        switch typeOfVC {
        case .main:
            let numbersMainVC = viewController as! NumbersViewController
            let viewModel = NumbersViewModel(resository: respository)
            numbersMainVC.viewModel = viewModel
            viewModel.delegate = numbersMainVC
            return numbersMainVC
            
    }
  }

}
