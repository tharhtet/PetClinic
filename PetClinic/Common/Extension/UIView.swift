//
//  UIView.swift
//  PetClinic
//
//  Created by Thant Han Linn on 2/8/24.
//

import Foundation
import UIKit

extension UIView {
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 1, height: 2)
    }
    
    func removeDropShadow() {
        self.layer.shadowColor = UIColor.clear.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowOpacity = 0
      }
}
