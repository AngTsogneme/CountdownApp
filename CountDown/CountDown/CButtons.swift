//
//  CButtons.swift
//  CountDown
//
//  Created by Ang T on 2023-11-11.
//

import SwiftUI

struct CButtons: View {
    var title: String
    var body: some View {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .frame(width:280,height:50)
                .background(Color.yellow)
                .foregroundColor(.black)
                .cornerRadius(10)
        
    }
}

struct CButtons_Previews: PreviewProvider {
    static var previews: some View {
        CButtons(title: "test")
    }
}
