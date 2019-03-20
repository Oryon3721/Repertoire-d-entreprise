//
//  TextFieldExtension.swift
//  Repertoire d'entreprise
//
//  Created by Theo Marie on 20/03/2019.
//  Copyright © 2019 Theo Marie. All rights reserved.
//

import UIKit

extension AjoutController: UITextFieldDelegate {
    
    
    func miseEnPlaceTextField() {
        prenomTextField.delegate = self
        nomTextField.delegate = self
        telTextField.delegate = self
        mailTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    
}
