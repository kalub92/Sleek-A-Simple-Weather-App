//
//  RoundedButton.swift
//  Sleek
//
//  Created by Caleb Stultz on 3/20/16.
//  Copyright © 2016 Caleb Stultz. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 25
        self.clipsToBounds = true
    }

}
