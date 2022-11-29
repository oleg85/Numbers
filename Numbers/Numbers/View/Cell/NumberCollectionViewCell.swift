//
//  NumberCollectionViewCell.swift
//  Numbers
//
//  Created by Oleg Arzutov on 29/11/2022.
//

import UIKit

class NumberCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var numlbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension NumberCollectionViewCell: ModelConfigurable {
    
    func configure(with model: NumberViewData) {
        numlbl.text = String(model.number)
        self.contentView.backgroundColor = model.isHaveOppositeNumber ? .red : .orange
        
        
        
    }
    
}


