//
//  HomepageVM.swift
//  ContactsApp
//
//  Created by Doğukan Akyüz on 28.11.2024.
//

import Foundation

class HomepageVM : ObservableObject {
    @Published var contactList = [Contacts]()
    
    let db: FMDatabase?
    
    init(){
        let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let destinationPath = URL(fileURLWithPath: dbPath).appendingPathComponent("rehber.sqlite")
        db = FMDatabase(path: destinationPath.path)
        }
    
    func del(contact_id:Int){
        db?.open()
        
        do{
            try db!.executeUpdate("DELETE FROM kisiler WHERE kisi_id = ?", values: [contact_id])
            loadContacts()
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    func loadContacts(){
        db?.open()
        var list = [Contacts]()
        
        do {
            let result = try db!.executeQuery("SELECT * FROM kisiler", values: nil)
            while result.next(){
                let contact_id = Int(result.string(forColumn: "kisi_id"))!
                let contact_name = result.string(forColumn: "kisi_ad")!
                let contact_tel = result.string(forColumn: "kisi_tel")!
                
                let contact = Contacts(contact_id: contact_id, contact_name: contact_name, contact_tel: contact_tel)
                list.append(contact)
              
            }
            
            contactList = list
            
        }catch {
            print(error.localizedDescription)
        }
        
        
        
        db?.close()
    }
    func search(searchedWord: String){
        db?.open()
        var list = [Contacts]()
        
        do {
            let result = try db!.executeQuery("SELECT * FROM kisiler WHERE kisi_ad like ?", values: ["%\(searchedWord)%"])
            while result.next(){
                let contact_id = Int(result.string(forColumn: "kisi_id"))!
                let contact_name = result.string(forColumn: "kisi_ad")!
                let contact_tel = result.string(forColumn: "kisi_tel")!
                
                let contact = Contacts(contact_id: contact_id, contact_name: contact_name, contact_tel: contact_tel)
                list.append(contact)
              
            }
            
            contactList = list
            
        }catch {
            print(error.localizedDescription)
        }
        
        
        
        db?.close()
    }
}
