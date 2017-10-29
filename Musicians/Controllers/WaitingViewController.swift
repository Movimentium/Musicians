//
//  WaitingViewController.swift
//  Musicians
//
//  Created by AltUser on 29/10/17.
//  Copyright © 2017 Miguel Galllego. All rights reserved.
//

import UIKit

class WaitingViewController: UIViewController {

    class func newWaitVC() -> WaitingViewController {
        let mainSb = UIStoryboard(name: "Musicians", bundle: nil)
        let vc = mainSb.instantiateViewController(withIdentifier: "WaitingViewController") as! WaitingViewController
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        return vc
    }
}
