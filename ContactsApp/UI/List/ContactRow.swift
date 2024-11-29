//
//  ContactRow.swift
//  ContactsApp
//
//  Created by Doğukan Akyüz on 5.11.2024.
//

import SwiftUI

struct ContactRow: View {
    var contact = Contacts()
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            Text(contact.contact_name!).font(.system(size: 25)).bold()
            Text(contact.contact_tel!).font(.system(size: 20)).foregroundStyle(.white)
        }
    }
}

/* #Preview {
    ContactRow()
}
*/
