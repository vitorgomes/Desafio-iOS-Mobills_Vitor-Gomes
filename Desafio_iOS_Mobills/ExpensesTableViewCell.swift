//
//  ExpensesTableViewCell.swift
//  Desafio_iOS_Mobills
//
//  Created by Vitor Gomes on 11/05/21.
//

import UIKit

class ExpensesTableViewCell: UITableViewCell {

    @IBOutlet weak var lbValue: UILabel!
    @IBOutlet weak var lbDescriiption: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var ivPaid: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ivPaid.layer.cornerRadius = 14
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
