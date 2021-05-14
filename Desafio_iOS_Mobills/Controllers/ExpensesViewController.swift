//
//  ExpensesViewController.swift
//  Desafio_iOS_Mobills
//
//  Created by Vitor Gomes on 10/05/21.
//

import UIKit
import Firebase

class ExpensesViewController: UIViewController {

    @IBOutlet weak var tvExpenses: UITableView!
    
    var expenses: [Expense] = [
        Expense(value: 20.0, description: "padaria", date: Date(), paid: false),
        Expense(value: 40.0, description: "shopping", date: Date(), paid: true),
        Expense(value: 19.0, description: "mecanica", date: Date(), paid: false)
    ]
    
    var receivedExpense: Expense?
    var expensesTotal = 0.0
    
    let alertService = AlertService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tvExpenses.dataSource = self
        tvExpenses.delegate = self
        tvExpenses.register(UINib(nibName: "ExpensesTableViewCell", bundle: nil), forCellReuseIdentifier: "ExpensesTableViewCell")
        
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
    
    @IBAction func addExpensePressed(_ sender: UIButton) {
        
        let alertVC = alertService.alert() {
            
        }

        present(alertVC, animated: true)
    }
    
//    func sumExpenses(_ expenses: [Expense]) -> Double {
//
//        var total = 0.0
//
//        for total in expenses[inde]
//
//        return total
//    }

}

extension ExpensesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tvExpenses.dequeueReusableCell(withIdentifier: "ExpensesTableViewCell", for: indexPath) as! ExpensesTableViewCell

        cell.lbValue.text = "\(expenses[indexPath.row].value)"
        cell.lbDescriiption.text = expenses[indexPath.row].description
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        cell.lbDate.text = formatter.string(from: expenses[indexPath.row].date)
        
        if expenses[indexPath.row].paid == true {
            cell.ivPaid.tintColor = .green
        } else {
            cell.ivPaid.tintColor = .red
        }
        
        return cell
    }
}

extension ExpensesViewController: UITableViewDelegate {
    
}
