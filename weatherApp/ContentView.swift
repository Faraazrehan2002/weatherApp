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
    
    @State private var showingActionSheet = false
    
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                Button(action: {}, label: {
                    Text("\(Image(systemName: "pencil"))Edit")
                        .font(.largeTitle)
                        .bold()
                })
            }
            
            Spacer()
            
            Text(seasons[seasonIdx])
                .font(.largeTitle)
//                    .bold()
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            Image("weather_\(seasonIdx + 1)")
                .resizable()
                .frame(width: 300, height: 300)
            Spacer()
            
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
    
    
}

#Preview {
    ContentView()
}
