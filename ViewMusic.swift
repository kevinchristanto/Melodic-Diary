//
//  ViewMusic.swift
//  MelodicDiary
//
//  Created by Kevin Christanto on 05/04/23.
//

import SwiftUI

struct ViewMusic: View {
    
    @State var emoji: String?
    @State var songs: [Songs] = []
    
    var backToHomepage: () -> ()
    
    
    var body: some View {
        ZStack {
            
            Color("blue100")
                .ignoresSafeArea()
            
            VStack {
                Text("You seem to be feeling, \(emoji!)") //emoji sesuain dengan sentiment score
                    .fontWeight(.bold)
                    .font(.system(size: 28))
                    .foregroundColor(Color("darkblue"))
                    .padding(.top, 27)
                
                Text("Here are some Indonesian song recommendations based on your current mood.")
                    .padding(.horizontal, 20)
                    .padding(.top, -2)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 18))
                    .foregroundColor(Color("darkblue"))
                    .padding(.bottom, 47)
                
                ForEach(0..<songs.count, id: \.self){ index in
                    resultCard(song: $songs[index])
                        .padding(5.0)
                }
                
                HStack{
                    Text("Create this playlist on")
                        .foregroundColor(Color("darkblue"))
                        .font(.system(size: 20, weight: Font.Weight.semibold))
                    
                    Image("apple-music")
                        .resizable()
                        .frame(width: 90, height: 50)
                    
                }
                .padding(.vertical, 15)
                Button{
                    backToHomepage()
                }label: {
                    Text("Back to Homepage")
                        .fontWeight(.bold)
                        .frame(maxWidth: 222, maxHeight: 5)
                        .padding()
                        .foregroundColor(Color("darkblue"))
                        .background(Color("yellow"))
                        .cornerRadius(8)
                }
            }
        }
//        .navigationBarBackButtonHidden(true)
        
        
    }
}

struct resultCard: View {
    @Binding var song: Songs
    var body: some View {
        HStack{
            song.image //song artwork
                .resizable()
                .frame(width: 75, height: 75)
                .padding(.trailing, 5)
            
            VStack {
                VStack(alignment: .leading) {
                    
                    Text("\(song.title)") //song title
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .padding(.top, 10)
                    
                    Text("\(song.artist)") //song artist
                        .font(.system(size: 14))
                        .fontWeight(.light)
                        .padding(.top, -8)
                    
                    Spacer()
                }
            }
            Spacer()
            }
            .frame(width: 350, height: 75)
            .background(Color(.white))
            .cornerRadius(11)
            .shadow(radius: 3.0)
        }
    }

struct ViewMusic_Previews: PreviewProvider {
    static var previews: some View {
        ViewMusic(emoji: "😊", backToHomepage: {})
    }
}
