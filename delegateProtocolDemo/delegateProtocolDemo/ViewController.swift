//
//  ViewController.swift
//  delegateProtocolDemo
//
//  Created by Mac on 13/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bulbImageView: UIImageView!
    var lightOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.goToSwitchView))
        bulbImageView.addGestureRecognizer(tap)
        bulbImageView.isUserInteractionEnabled = true
    }
    
    @objc func goToSwitchView() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "SwitchViewController") as! SwitchViewController
        controller.switchIsOn = lightOn
        controller.delegate = self
        present(controller, animated: true, completion: nil)
    }

}


extension ViewController: BulbDelegate {
    func toggleBulb(_ state: Bool) {
        lightOn = state
        if state {
            self.view.backgroundColor = .orange
            bulbImageView.image = UIImage(named: "bulb.jpeg")
        } else {
            self.view.backgroundColor = .darkGray
            bulbImageView.image = UIImage(named: "bulb1.jpeg")
        }
    }
    
}

