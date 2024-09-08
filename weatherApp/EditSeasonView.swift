//
//  EditSeasonView.swift
//  weatherApp
//
//  Created by Faraaz Rehan Junaidi Mohammed on 9/8/24.
//

import SwiftUI

struct EditSeasonView: View {
    
    
    var body: some View {
        
        HStack {
            Button(action: {}, label: {Text("Cancel")})
            
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Done")
            })
        }.padding()
        
        VStack{
            Text("Update Season Name")
                .bold()
                .font(.largeTitle)
            
            TextField("Edit Season", text: .constant("Default"))
                .textFieldStyle(.roundedBorder)
                .padding()
                .autocorrectionDisabled()
        }
        
        Spacer()
        
    }
}

#Preview {
        EditSeasonView()
}
