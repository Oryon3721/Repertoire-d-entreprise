//
//  imagePickerExtension.swift
//  Repertoire d'entreprise
//
//  Created by Theo Marie on 19/03/2019.
//  Copyright © 2019 Theo Marie. All rights reserved.
//

import UIKit

extension AjoutController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    
    
    func miseEnPlaceImagePicker()  {
        imagePicker = UIImagePickerController()
        imagePicker?.allowsEditing = true
        imagePicker?.delegate = self
        ImageDeProfil.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(prendrePhoto))
        ImageDeProfil.addGestureRecognizer(tap)
    }
    
    
    @objc func prendrePhoto() {
        guard imagePicker != nil else {return}
        let alerte = UIAlertController(title: "prendre Photo", message: "choisissez votre médias", preferredStyle: .actionSheet)
        let appareil = UIAlertAction(title: "Appareil photo", style: .default) { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                self.imagePicker?.sourceType = .camera
                self.present(self.imagePicker!, animated: true, completion: nil)
            }
        }
        let librairie = UIAlertAction(title: "Librairie", style: .default) { (action) in
            self.imagePicker?.sourceType = .photoLibrary
            self.present(self .imagePicker!, animated: true, completion: nil)
        }
        let annuler = UIAlertAction(title: "Annuler", style: .destructive, handler: nil)
        alerte.addAction(appareil)
        alerte.addAction(librairie)
        alerte.addAction(annuler)
        self.present(alerte, animated: true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.imagePicker?.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var image: UIImage?
        
        if let editee = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            image = editee
        } else if let originale = [UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image = originale
        }
        ImageDeProfil.image = image
        imagePicker?.dismiss(animated: true, completion: nil)
    }
    
    
    
    
}
