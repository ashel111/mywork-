//
//  viewA.swift
//  Ames
//
//  Created by Ciana on 12/05/23.
//

import SwiftUI

struct viewA: View {
    var body: some View {
        ZStack{
            Color.gray
            
            Image(systemName: "calendar")
                .background(.thinMaterial)
                .font(.system(size:200))
        }.frame(width: 500, height: 900)
    }
}

struct viewA_Previews: PreviewProvider {
    static var previews: some View {
        viewA()
    }
}
