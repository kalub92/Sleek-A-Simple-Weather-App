//
//  SettingsVC.swift
//  Sleek
//
//  Created by Caleb Stultz on 3/20/16.
//  Copyright © 2016 Caleb Stultz. All rights reserved.
//

import Foundation
import UIKit

class SettingsVC: UIViewController {
    
    @IBOutlet weak var transparentView: UIView!
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.2, animations: {
            self.transparentView.alpha = 0.7
        })

    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    @IBAction func onCancelPressed(sender: AnyObject) {
        UIView.animateWithDuration(0.2, animations: {
            self.transparentView.alpha = 0
        })
        dismissViewControllerAnimated(true, completion: nil)
    }
}
