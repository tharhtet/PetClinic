//
//  PetCell.swift
//  PetClinic
//
//  Created by Thant Han Linn on 2/8/24.
//

import Foundation
import UIKit

class PetCell: UICollectionViewCell {
    @IBOutlet weak var viewShadow: UIView!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewShadow.dropShadow()
    }
}
