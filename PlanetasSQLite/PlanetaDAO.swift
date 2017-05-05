//
//  PlanetaDAO.swift
//  PlanetasSQLite
//
//  Created by Aplimovil on 4/05/17.
//  Copyright © 2017 Aplimovil. All rights reserved.
//

import Foundation
import SQLite


class PlanetaDAO {
    
    let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    
    var table:Table = Table("planeta")
    var id = Expression<Int64>("id")
    var nombre = Expression<String>("nombre")
    var gravedad = Expression<Double>("gravedad")
    
    var db:Connection!
    
    init(){
        do{
            db = try Connection("\(path)/planetas.db")
            let createTable = table.create(block: { (t) in
                t.column(id, primaryKey: true)
                t.column(nombre)
                t.column(gravedad)
            })
            try db.run(createTable)
        }catch{}
    }
    
    func insert(planeta:Planeta)->Int64{
        let insertPlaneta = table.insert(nombre <- planeta.nombre, gravedad <- planeta.gravity)
        do{
            return try db.run(insertPlaneta)
        }catch{
            return -1
        }
    }
    
    func update(planeta:Planeta){
        let filter = table.filter(id == planeta.id)
        let updatePlaneta = filter.update(nombre <- planeta.nombre, gravedad <- planeta.gravity)
        
        do{
            try db.run(updatePlaneta)
        }catch{}
        
    }
    
    func delete(id:Int64){
        let filter = table.filter(self.id == id)
        let deletePlaneta = filter.delete()
        do{
            try db.run(deletePlaneta)
        }catch{}
    }
    
    func getById(id:Int64)->Planeta?{
        let filter = table.filter(self.id == id)
        var planeta:Planeta?
        
        do{
            for stm in try db.prepare(filter) {
                planeta = Planeta()
                planeta?.id = stm[self.id]
                planeta?.nombre = stm[nombre]
                planeta?.gravity = stm[gravedad]
                break
            }
        }catch {}
        
        return planeta
    }
    
    func all()->[Planeta]{
        var data:[Planeta] = []
        let sql = "SELECT * FROM planeta"
        
        do{
            for row  in try db.prepare(sql){
                let p = Planeta()
                p.id = row[0] as! Int64
                p.nombre = row[1] as! String
                p.gravity = row[2] as! Double
                data.append(p)
            }
        }catch{}
        
        return data
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
