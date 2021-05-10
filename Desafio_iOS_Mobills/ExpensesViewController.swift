//
//  ExpensesViewController.swift
//  Desafio_iOS_Mobills
//
//  Created by Vitor Gomes on 10/05/21.
//

import UIKit
import Firebase

class ExpensesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
      
    }
}
