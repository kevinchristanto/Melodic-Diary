//
//  CardView.swift
//  MelodicDiary
//
//  Created by Kevin Christanto on 04/04/23.
//

import SwiftUI

struct DiaryView: View {
    var diaryData: Diary?
//
//    @State var textDiary = ""
//    @State var dateDiary = ""
//    @State var emoji = "😊"
    public var doBack: () -> ()
    
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("\(Date.getTodayName(date: diaryData!.date))")
                    .padding(.bottom, 5)
                    .font(.system(size: 12, weight: Font.Weight.semibold))
                    
                Text(diaryData!.journal)
                    .font(.caption2)
                    .multilineTextAlignment(.leading)
                
            }
            
            VStack(alignment: .trailing){
                Text("\(diaryData!.emoji)")
                    .padding(.top, 6)
                Spacer()
                NavigationLink(destination: ViewMusic(emoji: diaryData!.emoji, songs: diaryData!.songs)) {
                    Text("View Songs")
                        .fontWeight(.bold)
                }
                .padding(3)
                .background(Color("darkblue"))
                .cornerRadius(3)
                .foregroundColor(.white)
                .font(.system(size: 10, weight: Font.Weight.semibold))
            }
            .padding(.leading, 10)
        }
        .padding(10)
        .frame(maxWidth: .infinity, maxHeight: 100)
        .background(Color(.white))
        .cornerRadius(8)
        .padding(.horizontal, 20)
        .shadow(radius: 5)
        .navigationTitle("Melodic Diary")
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView(diaryData: Diary(date: Date(), journal: "im so happy today ,daksjdklajsl", emoji: "😊", score: 1, songs: kSadSongs), doBack: {})
    }
}
