//
//  Storyboarded.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/16/23.
//

import Foundation
import UIKit

protocol Storyboarded {
    static var storyboard: AppStoryboard { get }
    static func instantiate() -> Self
}

extension Storyboarded {
    static func instantiate() -> Self {
        let identifier = String(describing: self)
        let uiStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        let viewController = uiStoryboard.instantiateViewController(withIdentifier: identifier) as! Self

        return viewController
    }
}
