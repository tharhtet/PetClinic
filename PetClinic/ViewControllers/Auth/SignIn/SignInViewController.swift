//
//  SignInViewController.swift
//  PetClinic
//
//  Created by Thant Han Linn on 2/9/24.
//

import Foundation
import UIKit

class SignInViewController: BaseViewController, Storyboarded {
    static var storyboard: AppStoryboard = .auth
    var viewModel: SignInViewModel?
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTextField: FloatingLabelInput!
    @IBOutlet weak var emailBorderView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordTextField: FloatingLabelInput!
    @IBOutlet weak var passwordBorderView: UIView!
    @IBOutlet weak var loginView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setUpBindings()
    }
    
    private func configUI() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordTextField.addViewPasswordButton()
        loginView.layer.cornerRadius = 12
    }
    
    private func setUpBindings() {
        //guard let viewModel = viewModel else { return }
    }
    
    
    @IBAction func loginAction(_ sender: Any) {
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        viewModel?.loginAction()
    }
}


extension SignInViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailBorderView.isHidden = true
            emailView.dropShadow()
        } else if textField == passwordTextField {
            passwordBorderView.isHidden = true
            passwordView.dropShadow()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailBorderView.isHidden = false
            emailView.removeDropShadow()
        } else if textField == passwordTextField {
            passwordBorderView.isHidden = false
            passwordView.removeDropShadow()
        }
    }
}
