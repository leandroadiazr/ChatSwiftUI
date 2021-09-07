//
//  ImageBtn.swift
//  NetFlixClone
//
//  Created by Leandro A diaz R on 8/25/21.
//

import SwiftUI

struct ImageBtn: View {
    var imageName: String
    var foregroundColor: Color = Color.black
    var title: String = ""
    var fontSize: Font = Font.system(size: 44)
    var backgroundColor = Color.clear

    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Image(systemName: imageName)
                .font(fontSize)
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                
            Text(title)
                .foregroundColor(foregroundColor)
        })
        
    }
}

struct ImageBtn_Previews: PreviewProvider {
    static var previews: some View {
        ImageBtn(imageName: "xmark.circle.fill", action: {
            
        })
    }
}
