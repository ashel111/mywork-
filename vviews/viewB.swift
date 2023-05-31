
//import SwiftUI
//
//struct viewB: View {
//    var body: some View {
//        ZStack{
//            Color.gray
//
//            Image(systemName: "clock")
//                .background(.thinMaterial)
//                .font(.system(size:200))
//        }.frame(width: 500, height: 900)
//    }
//}
//
//struct viewB_Previews: PreviewProvider {
//    static var previews: some View {
//        viewB()
//    }
//}


import SwiftUI

struct viewB: View {

    
    @ObservedObject var timerManager = timermanager()
        @State var selectedPickerIndex = 0
    
    let availableMinutes = Array(1...59)
    
    
    
    var body: some View {
        
        
        NavigationView {
            VStack {
                Text(secondsToMinutesAndSeconds(seconds: timerManager.secondsleft))
                Text("\(timerManager.secondsleft)")
                    .font(.system(size: 80))
                    .padding(.top, 80)
                Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:180,height:180)
                    .foregroundColor(.blue)
                    .onTapGesture(perform: {
                        if self.timerManager.timerMode == .initial {
                            self.timerManager.setTimerLength(minutes: self.availableMinutes[self.selectedPickerIndex]*60)
                        }
                        self.timerManager.timerMode == .running ? self.timerManager.pause() : self.timerManager.start()

                        
                        })
                if timerManager.timerMode  == .paused {
                    Image(systemName: "gobackward")
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 50)
                        .padding(.top, 40)
                        .onTapGesture(perform: {
                            self.timerManager.reset()
                        })
                }
                if timerManager.timerMode == .initial {
                    Picker(selection: $selectedPickerIndex, label: Text("")) {
                        ForEach(0 ..< availableMinutes.count)
                        {
                            Text("\(self.availableMinutes[$0]) min")
                        }
                         
                    }
                    .labelsHidden()

                }
                Spacer()
            }
            .navigationBarTitle("Timer")
        }
        .environment(\.colorScheme, .light)
    }
}
struct viewB_Previews: PreviewProvider {
    static var previews: some View {
        viewB()
    }
}
