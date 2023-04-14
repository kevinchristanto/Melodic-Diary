//
//  ViewMusic.swift
//  MelodicDiary
//
//  Created by Kevin Christanto on 05/04/23.
//

import SwiftUI

struct ViewMusic: View {
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State public var emoji: String = "😐"
    @State var songs: [Songs] = []
    @StateObject var diaryArray = DiaryModel()
    
    
//    var doBack: () -> ()
    
    var body: some View {
        
        ZStack {
            Color("blue100")
                .ignoresSafeArea()
            
            VStack {
                Text("You seem to be feeling, \(emoji)") //emoji sesuain dengan sentiment score
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
                
                ForEach(0..<songs.count){index in
                    resultCard(song: songs[index])
                }
                Spacer()
                
                NavigationLink(destination: AddDiary(diaryArray: self.diaryArray)) {
                    Text("Back to Homepage")
                        .fontWeight(.bold)
                        .frame(maxWidth: 222, maxHeight: 5)
                }
                .padding()
                .foregroundColor(Color("darkblue"))
                .background(Color("yellow"))
                .cornerRadius(8)
                .navigationBarBackButtonHidden(true)
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct ViewMusic_Previews: PreviewProvider {
    static var previews: some View {
        ViewMusic()
    }
}

struct resultCard: View {
    @State var song: Songs
    var body: some View {
        HStack{
            song.image //song artwork
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.leading, 15)
            
            VStack {
                VStack(alignment: .leading) {
                    
                    Text("\(song.title)") //song title
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                        .padding(.top, 10)
                    
                    Text("\(song.artist)") //song artist
                        .font(.caption)
                        .fontWeight(.light)
                    
                    Spacer()
                }
            }
            Spacer()
            }
            .frame(width: 310, height: 75)
            .background(Color(.white))
            .cornerRadius(11)
        }
    }
