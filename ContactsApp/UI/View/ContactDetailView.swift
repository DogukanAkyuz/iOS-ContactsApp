//
//  ContactDetailView.swift
//  ContactsApp
//
//  Created by Doğukan Akyüz on 5.11.2024.
//

import SwiftUI

struct ContactDetailView: View {
    @State private var tfContName = ""
    @State private var tfContTel = ""
    
    var contact = Contacts()
    var viewModel = ContactDetailVM()
    
    
    
    var body: some View {
        VStack(){
            TextField("Name", text: $tfContName).textFieldStyle(RoundedBorderTextFieldStyle()).padding().shadow(radius: 8).bold()
            TextField("Telephone", text: $tfContTel).textFieldStyle(RoundedBorderTextFieldStyle()).padding().shadow(radius: 8).bold()
            
            Button("Update"){
                viewModel.update(contact_id: contact.contact_id!, contact_name: tfContName, contact_tel: tfContTel)
            }.padding().background(.pink).foregroundStyle(.white).bold().font(.system(size: 20))
            
            
        }.navigationTitle("Contact Detail")
            .frame(maxWidth: .infinity, maxHeight: .infinity).background(.mint)
            .onAppear{
                tfContName = contact.contact_name!
                tfContTel = contact.contact_tel!
            }
    }
        
}

#Preview {
    ContactDetailView()
}
