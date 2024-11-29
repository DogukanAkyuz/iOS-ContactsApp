//
//  HomepageVM.swift
//  ContactsApp
//
//  Created by Doğukan Akyüz on 28.11.2024.
//

import Foundation

class HomepageVM : ObservableObject {
    @Published var contactList = [Contacts]()
    
    func del(at offsets:IndexSet){
        let contact = contactList[offsets.first!]
        contactList.remove(at: offsets.first!)
        print("Contact Deleted: \(contact.contact_id!)")
    }
    func loadContacts(){
        var list = [Contacts]()
        let c1 = Contacts(contact_id: 1, contact_name: "Ahmet", contact_tel: "1111")
        let c2 = Contacts(contact_id: 2, contact_name: "Mehmet", contact_tel: "2222")
        let c3 = Contacts(contact_id: 3, contact_name: "Zeynep", contact_tel: "3333")
        list.append(c1)
        list.append(c2)
        list.append(c3)
        contactList = list
    }
    func search(searchedWord: String){
        print("Search: \(searchedWord)" )
    }
}
