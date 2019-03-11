//
//  imageArrondie.swift
//  Repertoire d'entreprise
//
//  Created by Theo Marie on 11/03/2019.
//  Copyright © 2019 Theo Marie. All rights reserved.
//

import UIKit

class ImageArrondie: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        miseEnPlace() // Appel de la fonction
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        miseEnPlace() //// Appel de la fonction
    }
    
    
    
    func miseEnPlace() { // définition du design de mon button Profil
        
        layer.cornerRadius = frame.width/2
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
        image = UIImage(named: "vador")
        contentMode = .scaleAspectFill
        clipsToBounds = true
        
    }
    

}
