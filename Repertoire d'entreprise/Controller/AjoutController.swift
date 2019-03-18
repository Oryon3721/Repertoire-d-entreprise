//
//  AjoutController.swift
//  Repertoire d'entreprise
//
//  Created by Theo Marie on 25/02/2019.
//  Copyright © 2019 Theo Marie. All rights reserved.
//

import UIKit

class AjoutController: UIViewController {

    @IBOutlet weak var Scroll: UIScrollView!
    @IBOutlet weak var PickerView: UIPickerView!
    @IBOutlet weak var ImageDeProfil: ImageArrondie!
    @IBOutlet weak var AjouterEntreprise: UIButton!
    @IBOutlet weak var nomTextField: UITextField!
    @IBOutlet weak var prenomTextField: UITextField!
    @IBOutlet weak var telTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var ajouterPersonneButton: ButtonArrondie!
    @IBOutlet weak var largeurContrainte: NSLayoutConstraint!
    @IBOutlet weak var contrainteDuBas: NSLayoutConstraint!
    
    
    var testPicker = ["Apple","Google","IBM","TheoCorp","Amazon"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        miseEnPlacePicker()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        largeurContrainte.constant = view.frame.width
        Scroll.contentSize = CGSize(width: largeurContrainte.constant, height: Scroll.frame.height)
    }
    
    
    
    
    @IBAction func ajouterPersonneEntreprise(_ sender: Any) {
    }
    
    @IBAction func ajouterPersonneAction(_ sender: Any) {
    }
    
    
    
}
