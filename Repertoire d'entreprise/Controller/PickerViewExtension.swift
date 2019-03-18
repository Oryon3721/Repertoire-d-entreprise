//
//  PickerViewExtension.swift
//  Repertoire d'entreprise
//
//  Created by Theo Marie on 18/03/2019.
//  Copyright © 2019 Theo Marie. All rights reserved.
//

import UIKit

extension AjoutController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    func miseEnPlacePicker(){
        PickerView.delegate = self
        PickerView.dataSource = self
    }
    // nombre de choix disponnible egal au nombre d'entree de mon tableau
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return testPicker.count
    }
    // Nombre de collonnes de ma picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // Renvoie une string egal au contenue de la ligne de mon tableau
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return testPicker[row]
    }
    // Quand on choisi un ligne
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Ligne Choisie:  " + testPicker[row])
    }
}
