//
//  ViewMusic.swift
//  MelodicDiary
//
//  Created by Kevin Christanto on 05/04/23.
//

import SwiftUI

struct ViewMusic: View {
    
    @State public var emoji: String = "😐"
    
    var body: some View {
        
        ZStack {
            Color("blue100")
                .ignoresSafeArea()
            
            VStack {
                Text("You seem to be feeling, \(emoji)") //emoji sesuain dengan sentiment score
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                    .foregroundColor(Color("darkblue"))
                    .padding(.top, 27)
                
                Text("Here are some Indonesian song recommendations based on your current mood.")
                    .padding(.horizontal, 20)
                    .padding(.top, -2)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 12))
                    .foregroundColor(Color("darkblue"))
                    .padding(.bottom, 47)
                
                resultCard()
                
                Spacer()
                
            }
        }
    }
}

struct ViewMusic_Previews: PreviewProvider {
    static var previews: some View {
        ViewMusic()
    }
}

struct resultCard: View {
    var body: some View {
        HStack{
            Image("song-1")
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.leading, 15)
            
            VStack {
                VStack(alignment: .leading) {
                    
                    Text("Cheating on you") //song title
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                        .padding(.top, 10)
                    
                    Text("Charlie puth") //song artist
                        .font(.caption)
                        .fontWeight(.light)
                    
                    Spacer()
                }
                
                
            }
            
            Spacer()
            
            VStack {
                Spacer()
                Button("Play Music") {
                    
                }
                .padding(3)
                .background(Color("pink100"))
                .cornerRadius(3)
                .foregroundColor(.white)
                .font(.system(size: 10, weight: Font.Weight.medium))
                .padding()
            }
            
        }
        .frame(width: 310, height: 75)
        .background(Color(.white))
        .cornerRadius(11)
    }
}
