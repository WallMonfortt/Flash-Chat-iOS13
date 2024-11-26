//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error {
                    print(error.localizedDescription)
                    self.showAuthenticationError(message: error.localizedDescription)
                } else {
                    print("User created")
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }
    }
    func showAuthenticationError(message: String) {
            let alertController = UIAlertController(title: "Error de Autenticación",
                                                    message: message,
                                                    preferredStyle: .alert)
            
            let acceptAction = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
            alertController.addAction(acceptAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
    
}
