//
//  AddViewController.swift
//  PlanetasSQLite
//
//  Created by Aplimovil on 4/05/17.
//  Copyright © 2017 Aplimovil. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var gravity: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func addPlaneta(_ sender: Any) {
        let planeta = Planeta()
        planeta.nombre = name.text!
        planeta.gravity = Double(gravity.text!)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
