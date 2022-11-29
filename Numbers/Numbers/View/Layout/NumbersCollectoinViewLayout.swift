//
//  NumbersCollectoinViewLayout.swift
//  Numbers
//
//  Created by Oleg Arzutov on 29/11/2022.
//



import Foundation
import UIKit


class NumbersCollectoinViewLayout: UICollectionViewFlowLayout {
    
    var numberOfColumns:CGFloat = 4.0
    
    
    
    override init() {
        super.init()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override var itemSize: CGSize {
        set { }
        get {
            
            let itemWidth = (self.collectionView!.frame.width - (self.numberOfColumns - 1)) / self.numberOfColumns
            return CGSize(width: itemWidth, height: itemWidth)
        }
    }
    
    
}
