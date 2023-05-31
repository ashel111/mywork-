

import SwiftUI

struct viewC: View {
    var body: some View {
        ZStack{
            Color.gray

            Image(systemName: "mic")
                .background(.thinMaterial)
                .font(.system(size:200))
        }.frame(width: 500, height: 900)
    }
}

struct viewC_Previews: PreviewProvider {
    static var previews: some View {
        viewC()
    }
}





//
//import SwiftUI
//import AVKit
//
//struct viewC: View {
//    var body: some View {
//        Ashel()
//            // always dark mode...
//            .preferredColorScheme(.dark)
//    }
//}
//
//struct viewC_Previews: PreviewProvider {
//    static var previews: some View {
//        viewC()
//    }
//}
//
//
//
//
//
//
//
//import SwiftUI
//import AVKit
//
//
//
//struct Ashel : View {
//
//    @State var record = false
//    // creating instance for recroding...
//    @State var session : AVAudioSession!
//    @State var recorder : AVAudioRecorder!
//    @State var alert = false
//    // Fetch Audios...
//    @State var audios : [URL] = []
//
//    var body: some View{
//
//        NavigationView{
//
//            VStack{
//
//                List(self.audios,id: \.self){i in
//
//                    // printing only file name...
//
//                    Text(i.relativeString)
//                }
//
//
//                Button(action: {
//
//                    // Now going to record audio...
//
//                    // Intialization...
//
//                    // Were going to store audio in document directory...
//
//                    do{
//
//                        if self.record{
//
//                            // Already Started Recording means stopping and saving...
//
//                            self.recorder.stop()
//                            self.record.toggle()
//                            // updating data for every rcd...
//                            self.getAudios()
//                            return
//                        }
//
//                        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//
//                        // same file name...
//                        // so were updating based on audio count...
//                        let filName = url.appendingPathComponent("myRcd\(self.audios.count + 1).m4a")
//
//                        let settings = [
//
//                            AVFormatIDKey : Int(kAudioFormatMPEG4AAC),
//                            AVSampleRateKey : 12000,
//                            AVNumberOfChannelsKey : 1,
//                            AVEncoderAudioQualityKey : AVAudioQuality.high.rawValue
//
//                        ]
//
//                        self.recorder = try AVAudioRecorder(url: filName, settings: settings)
//                        self.recorder.record()
//                        self.record.toggle()
//                    }
//                    catch{
//
//                        print(error.localizedDescription)
//                    }
//
//
//                }) {
//
//                    ZStack{
//
//                        Circle()
//                            .fill(Color.red)
//                            .frame(width: 70, height: 70)
//
//                        if self.record{
//
//                            Circle()
//                                .stroke(Color.white, lineWidth: 6)
//                                .frame(width: 85, height: 85)
//                        }
//                    }
//                }
//                .padding(.vertical, 25)
//            }
//            .navigationBarTitle("Record Audio")
//        }
//        .alert(isPresented: self.$alert, content: {
//
//            Alert(title: Text("Error"), message: Text("Enable Acess"))
//        })
//        .onAppear {
//
//            do{
//
//                // Intializing...
//
//                self.session = AVAudioSession.sharedInstance()
//                try self.session.setCategory(.playAndRecord)
//
//                // requesting permission
//                // for this we require microphone usage description in info.plist...
//                self.session.requestRecordPermission { (status) in
//
//                    if !status{
//
//                        // error msg...
//                        self.alert.toggle()
//                    }
//                    else{
//
//                        // if permission granted means fetching all data...
//
//                        self.getAudios()
//                    }
//                }
//
//
//            }
//            catch{
//
//                print(error.localizedDescription)
//            }
//        }
//    }
//
//    func getAudios(){
//
//        do{
//
//            let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//
//            // fetch all data from document directory...
//
//            let result = try FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: .producesRelativePathURLs)
//
//            // updated means remove all old data..
//
//            self.audios.removeAll()
//
//            for i in result{
//
//                self.audios.append(i)
//            }
//        }
//        catch{
//
//            print(error.localizedDescription)
//        }
//    }
//}
//
//
//
//import SwiftUI
//import AVFoundation
//
//struct viewC: View {
//    @State private var isRecording = false
//    @State private var audioRecorder: AVAudioRecorder?
//    @State private var uploadStatus: String = ""
//
//    var body: some View {
//        VStack {
//            Button(action: {
//                if self.isRecording {
//                    self.stopRecording()
//                    self.uploadAudio()
//                } else {
//                    self.startRecording()
//                }
//                self.isRecording.toggle()
//            }) {
//                Text(self.isRecording ? "Stop Recording and Upload" : "Start Recording")
//                    .padding()
//                    .background(self.isRecording ? Color.red : Color.green)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//            Text(uploadStatus)
//                .padding()
//        }
//    }
//
//    func startRecording() {
//        // Your audio recording code here
//    }
//
//    func stopRecording() {
//        // Your audio recording code here
//    }
//
//    func uploadAudio() {
//        guard let audioFileURL = getDocumentsDirectory().appendingPathComponent("recording.wav") else {
//            print("Audio file not found.")
//            return
//        }
//
//        let request = URLRequest(url: URL(string: "http://your-backend-endpoint.com/upload")!)
//        let session = URLSession.shared
//
//        let task = session.uploadTask(with: request, fromFile: audioFileURL) { data, response, error in
//            if let error = error {
//                print("Error uploading audio: \(error.localizedDescription)")
//                self.uploadStatus = "Upload failed"
//                return
//            }
//
//            // Handle the response from the server if needed
//
//            DispatchQueue.main.async {
//                self.uploadStatus = "Upload completed"
//            }
//        }
//
//        task.resume()
//    }
//
//    func getDocumentsDirectory() -> URL {
//        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        return paths[0]
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        viewC()
//    }
//}
