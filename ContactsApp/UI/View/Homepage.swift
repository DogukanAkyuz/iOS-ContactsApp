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

    func del(at offsets: IndexSet) {
        let contact = viewModel.contactList[offsets.first!]
        viewModel.del(contact_id: contact.contact_id!)
        viewModel.contactList.remove(at: offsets.first!)
        print("Contact Deleted: \(contact.contact_id!)")
        viewModel.loadContacts()
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.contactList) { contact in
                    NavigationLink(destination: ContactDetailView(contact: contact)) {
                        ContactRow(contact: contact)
                    }.listRowBackground(Color.mint)

                }.onDelete(perform: del)
            }
            .background(.mint)
            .scrollContentBackground(.hidden)
            .navigationTitle("Contacts")

            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: ContactAddView()) {
                        Image(systemName: "plus").foregroundStyle(Color(UIColor.black))
                    }
                }
            }
            .onAppear {
                copyDB()
                viewModel.loadContacts()
            }
            .toolbarBackground(.mint, for: .navigationBar)
            .searchable(text: $searchedWord, prompt: "Search")
            .onChange(of: searchedWord) { _, new in
                viewModel.search(searchedWord: new)
            }
        }
    }

    func copyDB() {
        let bundle = Bundle.main.path(forResource: "rehber", ofType: ".sqlite")
        let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let destinationPath = URL(fileURLWithPath: dbPath).appendingPathComponent("rehber.sqlite")
        let fm = FileManager.default

        if fm.fileExists(atPath: destinationPath.path) {
            print("DB already exists")
        } else {
            do {
                try fm.copyItem(atPath: bundle!, toPath: destinationPath.path)
                print("DB copied")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    Homepage()
}
