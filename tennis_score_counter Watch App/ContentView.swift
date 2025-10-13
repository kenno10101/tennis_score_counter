//
//  ContentView.swift
//  tennis_score_counter Watch App
//
//  Created by Kenn-Michael Sanga on 13.10.25.
//

import SwiftUI

struct ContentView: View {
    struct Party {
        @State var name: String
        @State var points = 0
        @State var games = 0
        @State var sets = 0
    }
    
    private var party_1 = Party(name: "player_1")
    private var party_2 = Party(name: "player_2")
    
    @State private var party_1_name = "player_1"
    @State private var party_2_name = "player_2"
    
    @State private var point_score_1 = 0
    @State private var game_score_1 = 0
    @State private var set_score_1 = 0
    
    @State private var point_score_2 = 0
    @State private var game_score_2 = 0
    @State private var set_score_2 = 0
    
    private var points = ["0", "15", "30", "40", "adv"]
    
    func reset_points() -> Void {
        point_score_1 = 0
        point_score_2 = 0
    }
    
    func reset_games() -> Void {
        reset_points()
        game_score_1 = 0
        game_score_2 = 0
    }
    
    func reset_scores() -> Void {
        reset_points()
        reset_games()
        set_score_1 = 0
        set_score_2 = 0
    }
    
    func point_winner(party: Int) -> Void {
        switch party {
        case 1:
            if point_score_1 == 3 {
                if point_score_2 == 3 {
                    point_score_1 += 1
                    return
                }
                if point_score_2 == 4 {
                    point_score_2 -= 1
                    return
                }
                game_score_1 = game_score_1 < 6 ? game_score_1 + 1 : game_score_1
                reset_points()
            } else if (point_score_1 == 4){
                game_score_1 = game_score_1 < 6 ? game_score_1 + 1 : game_score_1
                reset_points()
            } else {
                point_score_1 = point_score_1 < 3 ? point_score_1 + 1 : point_score_1
            }
        case 2:
            if point_score_2 == 3 {
                if point_score_1 == 3 {
                    point_score_2 += 1
                    return
                }
                if point_score_1 == 4 {
                    point_score_1 -= 1
                    return
                }
                game_score_2 = game_score_2 < 6 ? game_score_2 + 1 : game_score_2
                reset_points()
            } else if (point_score_2 == 4){
                game_score_2 = game_score_2 < 6 ? game_score_2 + 1 : game_score_2
                reset_points()
            } else {
                point_score_2 = point_score_2 < 3 ? point_score_2 + 1 : point_score_2
            }
        default:
            return
        }
    }
    
    var body: some View {
        VStack
        {
            // buttons to add scores
            HStack {
                VStack {
                    // party_1 button
                    Button(action: {
                        point_winner(party: 1)
                             }) {
                             Text(points[point_score_1])
                                .font(.title).padding()
                                .foregroundColor(.white)
                                .cornerRadius(15)
                             }
                    Text(party_1_name)
                }
                
                VStack{
                    // party_2 button
                    Button(action: {
                        point_winner(party: 2)
                             }) {
                             Text(points[point_score_2])
                                .font(.title).padding()
                                .foregroundColor(.white)
                                .cornerRadius(15)
                             }
                    Text(party_2_name)
                }
                
            }
            
            // scores
            HStack {
                Text(party_1_name)
                Text("\(set_score_1)")
                Text("\(game_score_1)")
            }
            
            HStack {
                Text(party_2_name)
                Text("\(set_score_2)")
                Text("\(game_score_2)")
            }
            
            
            // misc
            HStack {
                // reset scores button
                Button(action: {
                    reset_scores()
                         }) {
                         Text("reset")
                            .font(.title).padding()
                            .foregroundColor(.white)
                            .cornerRadius(15)
                         }
            }
        }
    }
}

#Preview {
    ContentView()
}
