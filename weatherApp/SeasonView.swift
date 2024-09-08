//
//  SeasonView.swift
//  weatherApp
//
//  Created by Faraaz Rehan Junaidi Mohammed on 9/8/24.
//

import SwiftUI

struct SeasonView: View {
    var seasons: [String]
    var seasonIdx: Int
    
    init(seasons: [String], seasonIdx: Int) {
        self.seasons = seasons
        self.seasonIdx = seasonIdx
    }
    
    var body: some View {
        
        Text(seasons[seasonIdx])
            .font(.largeTitle)
//                    .bold()
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        
        Image("weather_\(seasonIdx + 1)")
            .resizable()
            .frame(width: 300, height: 300)
        Spacer()
        
    }
}

#Preview {
    SeasonView(seasons: ["Spring"], seasonIdx: 0)
}
