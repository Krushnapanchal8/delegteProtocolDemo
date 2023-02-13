//
//  SwitchViewController.swift
//  delegateProtocolDemo
//
//  Created by Mac on 13/02/23.
//

import UIKit

protocol BulbDelegate {
    func toggleBulb(_ state: Bool)
}

class SwitchViewController: UIViewController {
    
    
    @IBOutlet weak var switchView: UISwitch!
    var switchIsOn: Bool!
    var delegate: BulbDelegate!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        switchView.setOn(switchIsOn, animated: true)
    }
    

    @IBAction func switchToggled(_ sender: UISwitch) {
        delegate.toggleBulb(sender.isOn)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
