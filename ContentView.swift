import SwiftUI
import NaturalLanguage

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                DiaryView()
                DiaryView()
                DiaryView()
                Spacer()
                Button(){
                    //navigation link to add-diary page
                }label: {
                    Text("Tell me about your day")
                        .fontWeight(.bold)
                        .frame(maxWidth: 222, maxHeight: 5)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color("pink"))
                .cornerRadius(8)
            }.background(Color("yellow"))
        }
        
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


