//
//  ContentView.swift
//  SwiftUICal
//
//  Created by tony on 2019/11/1.
//  Copyright © 2019 tony. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {

        VStack(spacing: 12) {
            Text("012")
                .font(.system(size: 76))
            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
            CalculatorButtonPad()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

