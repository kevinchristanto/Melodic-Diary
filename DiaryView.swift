//
//  CardView.swift
//  MelodicDiary
//
//  Created by Kevin Christanto on 04/04/23.
//

import SwiftUI

struct DiaryView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("\(Date.getTodayName())")
                    .bold()
                    .padding(.bottom, -2)
                
                Text("WWDC 2023 swift student challenge is announced today. We are very excited and looking forward to explore any ideas to submit into WWDC.")
                    .font(.caption2)
                
            }.padding(.bottom, -3)
            
            VStack(alignment: .trailing){
                Text("😊")
                Spacer()
                Button("View Songs"){
                    //navigation link to view-music page
                }.padding(3)
                    .background(Color(.systemBlue))
                    .cornerRadius(3)
                    .foregroundColor(.white)
                    .font(.caption)
            }
        }
        .padding(10)
        .frame(maxWidth: .infinity, maxHeight: 100)
        .background(Color(.white))
        .cornerRadius(8)
        .padding(15)
        .shadow(radius: 5)
        .navigationTitle("Melodic Diary")
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
    }
}
