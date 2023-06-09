//
//  AddDiary.swift
//  MelodicDiary
//
//  Created by Kevin Christanto on 05/04/23.
//

import SwiftUI
import NaturalLanguage

struct AddDiary: View {
    @EnvironmentObject var diaryArray: DiaryModel
    
    @State var textFieldText = ""
    
    @State private var score = 0.0
    @State private var sentimentEmoticon = ""
    
    @State var recommendedSongs: [Songs] = []
    
    var doViewMusic: () -> ()
    
    
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
                        .frame(width: 350, height: max(30,300))
                        .padding()
                        .colorMultiply(Color("grey"))

                    Button{
                        let newDiary = Diary(date: Date(), journal: textFieldText, emoji: analyzeSentiment(textInput: textFieldText, emotScore: score), score: score, songs: getRecommendationSongs(sentimentScore: score))
                        self.diaryArray.allDiary.append(newDiary)
                        doViewMusic()
                    }label: {
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
    
    func analyzeSentiment(textInput: String, emotScore: Double) -> String {
        let tagger = NLTagger(tagSchemes: [.sentimentScore])
        tagger.string = textInput
        
        let (sentiment, _) = tagger.tag(at: textInput.startIndex, unit: .paragraph, scheme: .sentimentScore)
        let emotScore = Double(sentiment?.rawValue ?? "0") ?? 0.0
        
        var emotion = ""
        
        if emotScore >= -1 && emotScore <= -0.3 {
            emotion = "😔"
        } else if  emotScore > -0.3 && emotScore <= 0.3 {
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
        // sentiment happy
        else {
            var randomizedSadSongs = kHappySongs
            randomizedSadSongs.shuffle()
            songRecommendation = Array(randomizedSadSongs.prefix(5))
            
        }
        return songRecommendation
    }
}

