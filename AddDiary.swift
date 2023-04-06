//
//  AddDiary.swift
//  MelodicDiary
//
//  Created by Kevin Christanto on 05/04/23.
//

import SwiftUI

struct AddDiary: View {
//    @State var diaryArray: [Diary]?
    
    @State var textFieldText = ""
    
    
    var body: some View {
        ZStack{
            Color("pink100")
                .ignoresSafeArea()
            
            VStack{
                
                Text("How is your day?")
                    .font(.system(size: 24))
                    .fontWeight(.medium)
                    .foregroundColor(Color("darkblue"))

                TextEditor(text: $textFieldText)
                    .background(Color.red)
                    .cornerRadius(5)
                    .shadow(radius: 1.0)
                    .frame(width: 260, height: max(30,300))
                    .padding()
                    .colorMultiply(Color("grey"))
                    
                //append into array
                //navigate to view-music
                NavigationLink(destination: ViewMusic().onAppear(){
                    // blm ada nlp, emojinya masih hardcode
//                    diaryArray?.append(Diary(date: Date(), journal: textFieldText, emoji: "😌", songs: kSadSongs))
                    allDiary.append(Diary(date: Date(), journal: textFieldText, emoji: "😌", songs: kSadSongs))
                    print("Berhasil onappear cok !")
                }) {
                    Text("Play me some music")
                        .fontWeight(.bold)
                        .frame(maxWidth: 222, maxHeight: 5)
                }
                .padding(10)
                .background(Color("darkblue"))
                .cornerRadius(11)
                .foregroundColor(.white)
                .font(.system(size: 14, weight: Font.Weight.semibold))
            }
            .frame(width: 309, height: 478)
            .background(.white)
            .cornerRadius(11)
            .shadow(radius: 22)
        }
        .navigationBarBackButtonHidden()
    }
}

struct AddDiary_Previews: PreviewProvider {
    static var previews: some View {
        AddDiary()
    }
}
