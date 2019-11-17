//
//  CalculatorButton.swift
//  SwiftUICal
//
//  Created by tony on 2019/11/14.
//  Copyright © 2019 tony. All rights reserved.
//

import Foundation
import SwiftUI

struct CalculatorButton : View {
    
    let fontSize: CGFloat = 38
    let title: String
    var size: CGSize
    let backgroundColorName: String
    let foregroundColor: Color
    let action: () ->Void
    
    var body: some View {
        return Button(action: action) {
            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(foregroundColor)
                .frame(width: size.width, height: size.height, alignment: Alignment.center)
                .background(Color(backgroundColorName))
                .cornerRadius(size.width / 2)
        }
    }
}

struct CalculatorButtonRow: View {
    
    let row: [CalculatorButtonItem]
    //@Binding var brain: CalculatorBrain
    @EnvironmentObject var model: CalculatorModel
    
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { item in
                CalculatorButton(title: item.title, size: item.size, backgroundColorName: item.backgroundColorName, foregroundColor: item.foregroundColor) {
                    //self.brain = self.brain.apply(item: item)
                    self.model.apply(item)
                }
            }
        }
    }
}

struct CalculatorButtonPad: View {
    
    //@Binding var brain: CalculatorBrain
    //var model: CalculatorModel
    
    let pad: [[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip), .command(.percent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
        [.digit(0), .dot, .op(.equal)]
    ]
    
    var body: some View {
        VStack(spacing: 8) {
            ForEach(pad, id: \.self) {row in
                CalculatorButtonRow(row: row)
            }
        }
    }
}

