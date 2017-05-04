//
//  ViewController.swift
//  PlanetasSQLite
//
//  Created by Aplimovil on 4/05/17.
//  Copyright © 2017 Aplimovil. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    var data:[Planeta]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = []
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PlanetaTableViewCell
        
        let p = data[indexPath.row]
        
        cell.name.text = p.nombre
        cell.gravity.text = "Gravedad \(p.gravity)"
        
        return cell
    }


}

