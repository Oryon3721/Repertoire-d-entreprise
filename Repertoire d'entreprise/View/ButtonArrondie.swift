//
//  ButtonArrondie.swift
//  Repertoire d'entreprise
//
//  Created by Theo Marie on 11/03/2019.
//  Copyright © 2019 Theo Marie. All rights reserved.
//

import UIKit

class ButtonArrondie: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        miseEnPlace()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        miseEnPlace()
    }
    
    
    
    func miseEnPlace() {
        layer.cornerRadius = 10
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.darkGray.cgColor
        tintColor = UIColor.black
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
    }

}
