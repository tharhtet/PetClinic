//
//  AddPetViewController.swift
//  PetClinic
//
//  Created by Thant Han Linn on 2/12/24.
//

import Foundation
import UIKit

class AddPetViewController: BaseViewController, Storyboarded {
    static var storyboard: AppStoryboard = .addPet
    var viewModel: AddPetViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Hello world"
    }
}
