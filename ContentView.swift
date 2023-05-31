

import SwiftUI

struct ContentView: View {
    
    @State var timermode: Timermode = .initial
    @State var selectedPickerIndex = 0
    
    let availableMinutes = Array(1...59)
    
    
    var body: some View {
        
        
        NavigationView {
            
            
            
            TabView{
                viewD()
                    .tabItem(){
                        Image(systemName: "house")
                        
                    }
                viewA()
                    .tabItem(){
                        Image(systemName: "calendar")
                    }
                viewB()
                    .tabItem(){
                        Image(systemName: "clock")
                    }
                viewC()
                    .tabItem(){
                        Image(systemName: "mic")
                    }
            }.accentColor(.black)
                .frame(width: 400, height: 800)
                .background(.thinMaterial)
            
            
            ZStack {
                Color(red: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/, green: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/, blue: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/)
            }
            .frame(width: 500, height: 500)
            .padding()
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
