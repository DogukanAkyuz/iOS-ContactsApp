//
//  ContentView.swift
//  ContactsApp
//
//  Created by Doğukan Akyüz on 5.11.2024.
//

import SwiftUI

struct Homepage: View {
    @State private var searchedWord = ""
    
    @ObservedObject var viewModel = HomepageVM()
    
    func del(at offsets:IndexSet){
        let contact = viewModel.contactList[offsets.first!]
        viewModel.contactList.remove(at: offsets.first!)
        print("Contact Deleted: \(contact.contact_id!)")
    }
    
    
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.contactList){ contact in
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
                    viewModel.loadContacts()
                }
                .toolbarBackground(.mint, for: .navigationBar)
                .searchable(text: $searchedWord, prompt: "Search")
                .onChange(of: searchedWord){_ , new in
                    viewModel.search(searchedWord: new)
                }
        }
    }
}

#Preview {
    Homepage()
}
