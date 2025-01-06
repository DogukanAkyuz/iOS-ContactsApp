//
//  ContactAddVM.swift
//  ContactsApp
//
//  Created by Doğukan Akyüz on 28.11.2024.
//

import Foundation

class ContactAddVM {
    
    let db: FMDatabase?
    
    init(){
        let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let destinationPath = URL(fileURLWithPath: dbPath).appendingPathComponent("rehber.sqlite")
        db = FMDatabase(path: destinationPath.path)
        }
    
    func save(contact_name:String, contact_tel:String){
        db?.open()
        
        do{
            try db!.executeUpdate("INSERT INTO kisiler (kisi_ad, kisi_tel) VALUES (?,?)", values: [contact_name, contact_tel])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
}
