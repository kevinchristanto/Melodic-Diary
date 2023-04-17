//
//  CardView.swift
//  MelodicDiary
//
//  Created by Kevin Christanto on 04/04/23.
//

import SwiftUI

struct DiaryView: View {
    var diaryData: Diary?
    var goToViewMusic: (Int) -> ()
    
    
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
                Button{
//                    ViewMusic(emoji: diaryData!.emoji, songs: diaryData!.songs)
                    goToViewMusic(0)
                }label: {
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
        .padding(8)
        .frame(width: 260, height: 80)
        .background(Color(.white))
        .cornerRadius(8)
        .padding(.horizontal, 10)
        .padding(.bottom, 10)
        .shadow(radius: 5)
        .navigationTitle("Melodic Diary")
    }
}
