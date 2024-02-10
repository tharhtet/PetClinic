//
//  SignUpViewController.swift
//  PetClinic
//
//  Created by Thant Han Linn on 2/10/24.
//

import Foundation
import UIKit

class SignUpViewController: BaseViewController, Storyboarded {
    static var storyboard: AppStoryboard = .auth
    var viewModel: SignUpViewModel?
    
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var nameTextField: FloatingLabelInput!
    @IBOutlet weak var nameBorderView: UIView!
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var phoneTextField: FloatingLabelInput!
    @IBOutlet weak var phoneBorderView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordTextField: FloatingLabelInput!
    @IBOutlet weak var passwordBorderView: UIView!
    @IBOutlet weak var confirmPasswordView: UIView!
    @IBOutlet weak var confirmPasswordTextField: FloatingLabelInput!
    @IBOutlet weak var confirmPasswordBorderView: UIView!
    @IBOutlet weak var signUpView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
