//
//  AlertViewController.swift
//  Desafio_iOS_Mobills
//
//  Created by Vitor Gomes on 11/05/21.
//

import UIKit

class AlertViewController: UIViewController {

    var valueText = Double()
    var descriptionText = String()
    var paidOption = Bool()
    var chosenDate = Date()
    var completeExpense: Expense?
    
    var buttonAction: (() -> Void)?
    
    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var tfDescription: UITextField!
    @IBOutlet weak var swPaid: UISwitch!
    @IBOutlet weak var dpExpenseDate: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func cancelPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addPressed(_ sender: Any) {
        
        valueText = Double(tfValue.text!)!
        descriptionText = tfDescription.text!
        paidOption = swPaid.isOn
        chosenDate = dpExpenseDate.date
        
        completeExpense?.value = valueText
        completeExpense?.description = descriptionText
        completeExpense?.paid = paidOption
        completeExpense?.date = chosenDate
        
        print(valueText, descriptionText, paidOption, chosenDate)
        
        dismiss(animated: true, completion: nil)
        
        buttonAction?()
    }
    
}
