import SwiftUI
import NaturalLanguage

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack(spacing:16){
                
                // loop if there is any diary
                DiaryView()
                DiaryView()
                DiaryView()
                
                Spacer()
                
                NavigationLink(destination: AddDiary()) {
                    Text("Tell me about your day")
                        .fontWeight(.bold)
                        .frame(maxWidth: 222, maxHeight: 5)
                }                .padding()
                    .foregroundColor(.white)
                    .background(Color("pink100"))
                    .cornerRadius(8)
                
            }.background(Color("yellow"))
        }
//.navigationViewStyle(StackNavigationViewStyle()) kalau mau diilangin sidebar di swiftplayground
        
    }
    
}

extension Date {
    static func getTodayName() -> String{
        let date = Date()
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


