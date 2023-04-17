import SwiftUI

struct ContentView: View {
    @StateObject var diaryArray = DiaryModel()
    
    @State private var showIndex = 0
    @State private var allDiaryIndex = -1
    
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
                else{
                    List{
                        ForEach(self.diaryArray.allDiary.indices, id: \.self){ index in
                            DiaryView(diaryData: self.diaryArray.allDiary[index], goToViewMusic: goToViewMusic)
                        }
                    }
                    .tint(.clear)
                    .foregroundColor(.black)
                    .background(Color("yellow"))
                }
                
                Spacer()
                
//                NavigationLink(destination: AddDiary().environmentObject(self.diaryArray)) {
//                    Text("Tell me about your day")
//                        .fontWeight(.bold)
//                        .frame(maxWidth: 222, maxHeight: 5)
//                }
//                .padding()
//                .foregroundColor(.white)
//                .background(Color("pink100"))
//                .cornerRadius(8)
//                .padding(.bottom, 10)
                
            }
            .background(Color("yellow"))
            
            if showIndex == 0 {
                AddDiary(doViewMusic: addViewMusic).environmentObject(self.diaryArray)
            } else if showIndex == 1 {
                ViewMusic(emoji: self.diaryArray.allDiary[allDiaryIndex].emoji, songs: self.diaryArray.allDiary[allDiaryIndex].songs, backToHomepage: backToHomePage)
            }
        }
        .navigationViewStyle(.automatic)
        .background(Color("yellow"))
    }
    func goToViewMusic(diaryIndex: Int){
        allDiaryIndex = diaryIndex
        showIndex = 1
    }
    
    func addViewMusic(){
        allDiaryIndex = self.diaryArray.allDiary.count - 1
        showIndex = 1
    }
    
    func backToHomePage(){
        showIndex = 0
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


struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
