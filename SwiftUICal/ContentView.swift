//
//  ContentView.swift
//  SwiftUICal
//
//  Created by tony on 2019/11/1.
//  Copyright © 2019 tony. All rights reserved.
//

import SwiftUI
import Combine

let scale: CGFloat = UIScreen.main.bounds.width / 414

struct ContentView: View {
    
    //@State
    //private var brain: CalculatorBrain = .left("0")
    @ObservedObject var model = CalculatorModel()
    
    var body: some View {

        VStack(spacing: 12) {
            Spacer()
            Button("操作历史：\(model.history.count)") {
                print(self.model.history.count)
            }
            Text(model.brain.output)
                .font(.system(size: 76))
                .padding(.trailing, 24)
                .lineLimit(1)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
            CalculatorButtonPad(model: model).padding(.bottom)
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


struct HistoryView: View {
    @ObservedObject var model: CalculatorModel
    
    var body: some View {
        VStack {
            if model.totalCount == 0 {
                Text("没有履历")
            } else {
                HStack {
                    Text("履历").font(.headline)
                    Text("\(model.historyDetail)").lineLimit(nil)
                
                }
                HStack {
                    Text("显示履历").font(.headline)
                    Text("\(model.brain.output)")
                }
                
                Slider(value: $model.slidingIndex, in: 0 ... Float(model.totalCount), step: 1)
            }
        }.padding()
    }
}
