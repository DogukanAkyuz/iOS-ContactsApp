//
//  ContactAddView.swift
//  ContactsApp
//
//  Created by Doğukan Akyüz on 5.11.2024.
//

import SwiftUI

struct ContactAddView: View {
    @State private var tfContName = ""
    @State private var tfContTel = ""
    
    var viewModel = ContactAddVM()
    
    
    var body: some View {
        VStack(){
            TextField("Name", text: $tfContName).textFieldStyle(RoundedBorderTextFieldStyle()).padding().shadow(radius: 8).bold()
            TextField("Telephone", text: $tfContTel).textFieldStyle(RoundedBorderTextFieldStyle()).padding().shadow(radius: 8).bold()
            
            Button("Save"){
                viewModel.save(contact_name: tfContName, contact_tel: tfContTel)
            }.padding().background(.pink).foregroundStyle(.white).bold().font(.system(size: 20))
            
            
        }.navigationTitle("Add Contact")
            .frame(maxWidth: .infinity, maxHeight: .infinity).background(.mint)
    }
        
}

#Preview {
    ContactAddView()
}
