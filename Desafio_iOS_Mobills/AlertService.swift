//
//  AlertService.swift
//  Desafio_iOS_Mobills
//
//  Created by Vitor Gomes on 12/05/21.
//

import UIKit

class AlertService {
    
    func alert(onComplete: @escaping () -> Void) -> AlertViewController {
        
        let storyboard = UIStoryboard(name: "AlertStoryboard", bundle: .main)
        
        let alertVC = storyboard.instantiateViewController(identifier: "AlertVC") as! AlertViewController
        
        alertVC.buttonAction = onComplete
        
        return alertVC
    }
}
