//
//  AddDiary.swift
//  MelodicDiary
//
//  Created by Kevin Christanto on 05/04/23.
//

import SwiftUI
import NaturalLanguage

struct AddDiary: View {
    @StateObject var diaryArray = DiaryModel()
    
    @State var textFieldText = ""
    
    @State private var score = 0.0
    @State private var sentimentEmoticon = ""
    
    @State var recommendedSongs: [Songs] = []
    @State var showResult = false
    
    func doBack(){
        self.showResult = false
    }
    
    var body: some View {
        if showResult{
            ViewMusic(emoji: analyzeSentiment(textInput: textFieldText), songs: getRecommendationSongs(sentimentScore: score), diaryArray: self.diaryArray)
        }else {
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
                        .frame(width: 350, height: max(30,300))
                        .padding()
                        .colorMultiply(Color("grey"))
                        .onChange(of: textFieldText) { newText in
                            textFieldText = newText
                        }
                        

                    Button(){
                        showResult = true
                        appendDiary()
                        textFieldText = ""
                    } label: {
                        Text("Add to diary")
                            .fontWeight(.bold)
                            .frame(maxWidth: 200, maxHeight: 10)
                            .font(.system(size: 16))
                    }
                    .padding(10)
                    .background(Color("darkblue"))
                    .cornerRadius(11)
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: Font.Weight.semibold))
                }
                .frame(width: 400, height: 478)
                .background(.white)
                .cornerRadius(11)
                .shadow(radius: 22)
            }
        }
    }
    
    func analyzeSentiment(textInput: String) -> String {
        let tagger = NLTagger(tagSchemes: [.sentimentScore])
        tagger.string = textInput
        
        let (sentiment, _) = tagger.tag(at: textInput.startIndex, unit: .paragraph, scheme: .sentimentScore)
        score = Double(sentiment?.rawValue ?? "0") ?? 0.0
        
        var emotion = ""
        
        if score >= -1 && score <= -0.3 {
            emotion = "😔"
        } else if  score > -0.3 && score <= 0.3 {
            emotion = "😐"
        } else {
            emotion = "😃"
        }
        return emotion
    }
    
    func getRecommendationSongs(sentimentScore: Double) -> [Songs]{
        var songRecommendation: [Songs]
        // sentiment is sad
        if sentimentScore >= -1 && sentimentScore <= -0.3{
            var randomizedSadSongs = kSadSongs
            randomizedSadSongs.shuffle()
            songRecommendation = Array(randomizedSadSongs.prefix(5))
    
        }
        // sentiment neutral
        else if score > -0.3 && score <= 0.3 {
            var randomizedSadSongs = kRelaxedSongs
            randomizedSadSongs.shuffle()
            songRecommendation = Array(randomizedSadSongs.prefix(5))
            
        }
        // sentimen happy
        else {
            var randomizedSadSongs = kHappySongs
            randomizedSadSongs.shuffle()
            songRecommendation = Array(randomizedSadSongs.prefix(5))
            
        }
        return songRecommendation
    }
    
    func appendDiary() {
        self.diaryArray.objectWillChange.send()
//                        var recommendedSongs = [Songs]()
        self.diaryArray.allDiary.append(Diary(date: Date(), journal: textFieldText, emoji: analyzeSentiment(textInput: textFieldText), score: score, songs: getRecommendationSongs(sentimentScore: score)))
    }
}

struct AddDiary_Previews: PreviewProvider {
    static var previews: some View {
        AddDiary()
    }
}
