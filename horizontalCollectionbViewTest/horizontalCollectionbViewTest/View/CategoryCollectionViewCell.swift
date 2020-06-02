//
//  CategoryCollectionViewCell.swift
//  swiftTraining2
//
//

import UIKit


protocol CellDelegate: class {
    func buttonPressed(_ cell: UICollectionViewCell)
}

class CategoryCollectionViewCell: UICollectionViewCell {

    var delegate : CellDelegate?
    @IBOutlet weak var category: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func buttonPressed(_ sender: Any) {
        delegate?.buttonPressed(self)
    }
}
