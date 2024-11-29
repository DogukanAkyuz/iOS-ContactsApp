//
//  ContentView.swift
//  ContactsApp
//
//  Created by Doğukan Akyüz on 5.11.2024.
//

import SwiftUI

struct Homepage: View {
    @State private var contactList = [Contacts]()
    @State private var searchedWord = ""
    
    
    func del(at offsets:IndexSet){
        let contact = contactList[offsets.first!]
        contactList.remove(at: offsets.first!)
        print("Contact Deleted: \(contact.contact_id!)")
    }
    
    
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(contactList){ contact in
                    NavigationLink(destination: ContactDetailView(contact: contact)) {
                        ContactRow(contact: contact)
                    }.listRowBackground(Color.mint)
               
                }.onDelete(perform: del)
                
            }
            .background(.mint)
            .scrollContentBackground(.hidden)
            .navigationTitle("Contacts")
            

                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        NavigationLink(destination: ContactAddView()){
                            Image(systemName: "plus").foregroundStyle(Color(UIColor.black))
                        }
                        
                    }
                }
                .onAppear{
                    var list = [Contacts]()
                    let c1 = Contacts(contact_id: 1, contact_name: "Ahmet", contact_tel: "1111")
                    let c2 = Contacts(contact_id: 2, contact_name: "Mehmet", contact_tel: "2222")
                    let c3 = Contacts(contact_id: 3, contact_name: "Zeynep", contact_tel: "3333")
                    list.append(c1)
                    list.append(c2)
                    list.append(c3)
                    contactList = list
                }
                .toolbarBackground(.mint, for: .navigationBar)
                .searchable(text: $searchedWord, prompt: "Search")
                .onChange(of: searchedWord){_ , new in
                    print("Search: \(new)")
                }
        }
    }
}

#Preview {
    Homepage()
}
