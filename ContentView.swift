import SwiftUI
import NaturalLanguage

struct ContentView: View {
    @StateObject var diaryArray = DiaryModel()
    
    var body: some View {
        NavigationView{
            VStack(spacing:16){
                if self.diaryArray.allDiary.isEmpty{
                    HStack{
                        Spacer()
                        Text("No Diary")
                            .bold()
                            .font(.title)
                        Spacer()
                    }
                }
                // loop if there is any diary
                else{
                    List{
                        ForEach(self.diaryArray.allDiary.indices, id: \.self){ index in
                            DiaryView(diaryData: diaryArray.allDiary[index], doBack: {})
                        }
                    }
                    .tint(.clear)
                    .foregroundColor(.black)
                    .background(Color("yellow"))
                }
                
                Spacer()
                NavigationLink(destination: AddDiary(diaryArray: self.diaryArray)) {
                    Text("Tell me about your day")
                        .fontWeight(.bold)
                        .frame(maxWidth: 222, maxHeight: 5)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color("pink100"))
                .cornerRadius(8)
                .padding(.bottom, 10)
                
            }
            .background(Color("yellow"))
            
            AddDiary(diaryArray: self.diaryArray)
        }

        .navigationViewStyle(.automatic)
        .background(Color("yellow"))
    }
    
}

extension Date {
    static func getTodayName(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, dd MMMM yyyy"
        let dayName = dateFormatter.string(from: date)
        
        return dayName
    }
    static func getCurrentDate() -> String{
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let dateString = dateFormatter.string(from: date)
        
        return dateString
    }
}


