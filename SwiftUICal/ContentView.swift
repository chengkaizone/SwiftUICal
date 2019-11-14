//
//  ContentView.swift
//  SwiftUICal
//
//  Created by tony on 2019/11/1.
//  Copyright © 2019 tony. All rights reserved.
//

import SwiftUI

let scale: CGFloat = UIScreen.main.bounds.width / 414

struct ContentView: View {
    
    var body: some View {

        VStack(spacing: 12) {
            Spacer()
            Text("0124")
                .font(.system(size: 76))
                .padding(.trailing, 24)
                .lineLimit(1)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
            CalculatorButtonPad().padding(.bottom)
        }.scaleEffect(scale)
        
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            //ContentView().previewDevice("iPad Air 2")
            //ContentView().previewDevice("iPhone SE")
        }
        
    }
}
#endif
