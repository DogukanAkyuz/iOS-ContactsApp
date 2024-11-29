//
//  HomepageVM.swift
//  ContactsApp
//
//  Created by Doğukan Akyüz on 28.11.2024.
//

import Foundation

class HomepageVM : ObservableObject {
    func del(at offsets:IndexSet){
        let contact = contactList[offsets.first!]
        contactList.remove(at: offsets.first!)
        print("Contact Deleted: \(contact.contact_id!)")
    }
}
