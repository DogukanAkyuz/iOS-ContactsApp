//
//  ContactDetailVM.swift
//  ContactsApp
//
//  Created by Doğukan Akyüz on 28.11.2024.
//

import Foundation

class ContactDetailVM {
    
    let db: FMDatabase?
    
    init(){
        let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let destinationPath = URL(fileURLWithPath: dbPath).appendingPathComponent("rehber.sqlite")
        db = FMDatabase(path: destinationPath.path)
        }
    
    func update(contact_id:Int, contact_name:String, contact_tel:String){
        db?.open()
        
        do{
            try db!.executeUpdate("UPDATE kisiler SET kisi_ad = ?, kisi_tel = ? WHERE kisi_id = ?", values: [contact_name, contact_tel, contact_id])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
}
