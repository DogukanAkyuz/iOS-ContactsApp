//
//  Contacts.swift
//  ContactsApp
//
//  Created by Doğukan Akyüz on 5.11.2024.
//

import Foundation

class Contacts : Identifiable{
    var contact_id : Int?
    var contact_name : String?
    var contact_tel : String?
    
    
    init() {
        
    }
    
    init(contact_id: Int, contact_name: String, contact_tel: String) {
        self.contact_id = contact_id
        self.contact_name = contact_name
        self.contact_tel = contact_tel
    }
    
}

