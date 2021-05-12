//
//  LoginViewController.swift
//  Desafio_iOS_Mobills
//
//  Created by Vitor Gomes on 10/05/21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = tfEmail.text, let password = tfPassword.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: "loginToExpenses", sender: self)
                }
            }
        }
    }
}
