//
//  EditSeasonView.swift
//  weatherApp
//
//  Created by Faraaz Rehan Junaidi Mohammed on 9/8/24.
//

import SwiftUI

struct EditSeasonView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var seasonName: String
    @State private var showEmptyAlert = false
    
    var onSave: () -> Void
    
//    @State private var isEditSheetNotPresented: Bool = false
    var body: some View {
        
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
//                isEditSheetNotPresented = true
            }, label: {Text("Cancel")})
//            .sheet(isPresented: $isEditSheetNotPresented){
//                ContentView()
//            }
            
            Spacer()
            
            Button(action: {
                if(seasonName.isEmpty){
                    print("Cannot be empty")
                }
                else{
                    onSave()
                    presentationMode.wrappedValue.dismiss()
                }
            }, label: {
                Text("Done")
            })
        }.padding()
        
        VStack{
            Text("Update Season Name")
                .bold()
                .font(.largeTitle)
            
            TextField("Edit Season", text: $seasonName)
                .textFieldStyle(.roundedBorder)
                .padding()
                .autocorrectionDisabled()
        }
        
        Spacer()
        
    }
}

#Preview {
    EditSeasonView(seasonName: .constant(""), onSave: {
        print("Saved")
    })
}
