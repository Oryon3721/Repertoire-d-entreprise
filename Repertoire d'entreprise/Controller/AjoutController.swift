//
//  AjoutController.swift
//  Repertoire d'entreprise
//
//  Created by Theo Marie on 25/02/2019.
//  Copyright © 2019 Theo Marie. All rights reserved.
//

import UIKit
import CoreData

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
    
    
    var entreprises = [Entreprise]()
    // variable ici parce que on ne peux pas creer de var dans les extensions
    var imagePicker: UIImagePickerController?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        miseEnPlaceImagePicker()
        miseEnPlacePicker() // initialiser les la Picker View
        miseEnPlaceNotification()
        fetchEntreprises() // Reload les données puis les charges
        miseEnPlaceTextField()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        largeurContrainte.constant = view.frame.width
        Scroll.contentSize = CGSize(width: largeurContrainte.constant, height: Scroll.frame.height)
    }
    
    func fetchEntreprises() {
        let requete: NSFetchRequest<Entreprise> = Entreprise.fetchRequest()
        let tri = NSSortDescriptor(key: "nom", ascending: true) // tri dans l'ordre A..Z les données
        requete.sortDescriptors = [tri] // appel de la fonction tri
        do{
            entreprises = try contexte.fetch(requete)
            PickerView.reloadAllComponents()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    
    
    
    
    
    @IBAction func ajouterPersonneEntreprise(_ sender: Any) {
        let alerte = UIAlertController(title: "Votre entreprise n'est pas dans la liste", message: "Ajouter", preferredStyle: .alert)
        let ajout = UIAlertAction(title: "OK", style: .default) {(action) in
            let textField = alerte.textFields![0] as UITextField
            if let texte = textField.text, texte != ""{
                let nouvelleEntreprise = Entreprise(context: contexte)
                nouvelleEntreprise.nom = texte
                appDelegate.saveContext()
                self.fetchEntreprises()
            }
            
        }
        alerte.addTextField {(tf) in
            tf.placeholder = "Nom de l'entreprises"
        }
        let annuler = UIAlertAction(title: "Annuler", style: .default, handler: nil)
        alerte.addAction(ajout)
        alerte.addAction(annuler)
        self.present(alerte,animated: true, completion: nil)
    }
    
    @IBAction func ajouterPersonneAction(_ sender: Any) {
        view.endEditing(true)
        let nouvellePersonne = Personne(context: contexte)
        if prenomTextField.text != nil {
            nouvellePersonne.prenom = prenomTextField.text!
        }
        if nomTextField.text != nil {
            nouvellePersonne.nom = nomTextField.text!
        }
        if let numero = telTextField.text, let numeroInt = Int32(numero)  {
            nouvellePersonne.numero = numeroInt
        }
        if mailTextField.text != nil{
            nouvellePersonne.mail = mailTextField.text!
        }
        nouvellePersonne.photo = ImageDeProfil.image
        nouvellePersonne.employeur = entreprises[PickerView.selectedRow(inComponent: 0)]
        
        appDelegate.saveContext()
        navigationController?.popViewController(animated: true)
    }
    
    
    
}
