//
//  viewD.swift
//  Ames
//
//  Created by Ciana on 12/05/23.
//

//import SwiftUI
//
//struct viewD: View {
//    var body: some View {
//        ZStack{
//            Color.gray
//
//            Image(systemName: "house")
//                .background(.thinMaterial)
//                .font(.system(size:200))
//        }.frame(width: 500)
//    }
//}
//
//struct viewD_Previews: PreviewProvider {
//    static var previews: some View {
//        viewD()
//    }
//}
import SwiftUI

struct viewD: View {
    var body: some View {
        
        Home()
        
    }
}



struct viewD_Previews: PreviewProvider {
    static var previews: some View {
        viewD()
    }
}
struct Home : View {
    @State var page = 0
    var body : some View{
        VStack{
            
            HStack{                            VStack(alignment:.leading, spacing:10){
                Text("AMES")
                    .font(.title)
                    .fontWeight(.bold)
                Text("building focus and concentration!!")
            }.foregroundColor(.black)
                Spacer(minLength: 0)
                
                Button(action:{}){
                    Image("logo")
                        .resizable()
                    
                        .frame(width:80,height:80)
                        .cornerRadius(15)
                    
                    
                }
            }
            .padding()
            
            Spacer()
            // Course image
            GeometryReader{g in
                Carousel(width: UIScreen.main.bounds.width, page: self.$page, height: g.frame(in: .global).height)
            }
            Spacer()
            
            Button(action: {
                
            }, label: {
                Text("Let's Begin")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .shadow(radius: 10)
            })
            
        }
        
        .background(Color.black.opacity(0.05).ignoresSafeArea(.all, edges : .all))
    }
    
    
}
struct List : View {
    var body: some View{
        HStack(spacing: 0){
            ForEach(data){i in
                Card(width: UIScreen.main.bounds.width, data: i)
                
            }
        }
    }
}
struct Card : View {
    var width : CGFloat
    var data : Type
    var body: some View {
        VStack{
            VStack{
                Image(self.data.image)
                    .resizable()
                    .frame(width: self.width - 100 ,height: 500)
                    .cornerRadius(20)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 25)
            .background(Color.black)
            .cornerRadius(20)
        }
        .frame(width: self.width)
    }
}
struct Carousel : UIViewRepresentable {
    var width : CGFloat
    @Binding var page : Int
    var height : CGFloat
    func makeUIView(context: Context) -> UIScrollView {
        let total = width * CGFloat(data.count)
        let view = UIScrollView()
        view.isPagingEnabled = true
        view.contentSize = CGSize(width: total, height: 1.0)
        view.bounces = true
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        
        let view1 = UIHostingController(rootView: List())
        view1.view.frame = CGRect(x: 0, y: 0, width: total, height: self.height)
        view1.view.backgroundColor = .clear
        view.addSubview(view1.view)
        return view
    }
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
    }
}
struct Type : Identifiable {
    var id: Int
    
    var image:String
}
var data = [
    Type(id: 0, image: "boy"),
    Type(id: 1, image: "girl_study"),
    Type(id: 2, image: "girl_ipad")
]

/*struct CourseCardView : View{
 var course : Course
 
 var body: some View{
 VStack{
 
 
 Image(course.asset)
 .resizable()
 .aspectRatio(contentMode: .fit)
 .padding(.top,10)
 .padding(.leading,10)
 .background(Color(course.asset))
 HStack{
 VStack(alignment:.leading, spacing: 10){
 Text("lets start")
 .fontWeight(.bold)
 
 }
 }
 }
 .background(Color.black)
 .cornerRadius(15)
 }
 }
 
 struct Course : Identifiable{
 var id = UUID().uuidString
 var name : String
 var numCourse: Int
 var asset: String
 }
 var courses = [
 Course(name:"Lets get started", numCourse: 13, asset: "first1")
 ]*/
