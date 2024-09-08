//
//  ContentView.swift
//  lecture2_class2
//
//  Created by Faraaz Rehan Junaidi Mohammed on 8/29/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var seasons = ["Spring", "Fall", "Summer", "Winter"]
    
    @State private var seasonImages = ["weather_1", "weather_2", "weather_3", "weather_4"]
    
    @State private var seasonIdx = 0
    
    @State private var isNameEditSheetPresented: Bool = false
    
    @State private var showingActionSheet = false
    
    @State private var seasonToEdit: String = ""
    
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                Button(action: {
                    seasonToEdit = seasons[seasonIdx]
                    isNameEditSheetPresented = true
                }, label: {
                    Text("\(Image(systemName: "pencil"))Edit")
                        .font(.largeTitle)
                        .bold()
                })
                .sheet(isPresented: $isNameEditSheetPresented){
                    EditSeasonView(seasonName: $seasonToEdit, onSave: {
                        updateNameOnSave()
                    })
                }
            }
            
            Spacer()
            
            SeasonView(seasons: seasons, seasonIdx: seasonIdx)
            
            Button(action: {
                showNextSeasonWeather()
            }, label: {
                Text("Next Season")
                    .padding()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.bold())
                    .frame(maxWidth: .infinity)
                    .background(Color(red:23/255, green:155/255, blue:14/255))
                    .foregroundColor(.white)
            })
            
            
            Button(action: {
                showingActionSheet = true
            }, label: {
                Text("Select Season")
                    .padding()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.bold())
                    .frame(maxWidth: .infinity)
                    .background(Color(.orange))
                    .foregroundColor(.white)
            })
            .actionSheet(isPresented: $showingActionSheet){
                ActionSheet(title: Text("Pick a season"),
                buttons: createActionButton())
            }
            
            Spacer()
        }
        .padding()
    }
    
    func showNextSeasonWeather(){
        seasonIdx = (seasonIdx + 1) % seasons.count
    }
    
    func createActionButton() -> [ActionSheet.Button] {
        var buttons: [ActionSheet.Button] = seasons.map{
            season in .default(Text(season)){
                seasonIdx = seasons.firstIndex(of: season) ?? 0
            }
        }
        buttons.append(.cancel())
        return buttons
    }
    
    
    func updateNameOnSave(){
        
        if let index = seasons.firstIndex(of: seasons[seasonIdx]){
            seasons[index] = seasonToEdit
        }
        
    }
    
}

#Preview {
    ContentView()
}
