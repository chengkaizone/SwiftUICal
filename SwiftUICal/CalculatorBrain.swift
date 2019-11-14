//
//  CalculatorBrain.swift
//  SwiftUICal
//
//  Created by tony on 2019/11/14.
//  Copyright © 2019 tony. All rights reserved.
//

import Foundation

enum CalculatorBrain {
    case left(String)
    case leftOp(left: String, op: CalculatorButtonItem.Op)
    case leftOpRight(left: String, op: CalculatorButtonItem.Op, right: String)
    case error
}

extension CalculatorBrain {
    var output: String {
        let result: String
        switch self {
        case .left(let left): result = left
        
        default:
            result = ""
        }
        
        guard let value = Double(result) else {
            return "Error"
        }
        return formatter.string(from: value as NSNumber)!
    }
    
    var formatter: NumberFormatter {
        let f = NumberFormatter()
        f.minimumFractionDigits = 0
        f.maximumFractionDigits = 8
        f.numberStyle = .decimal
        return f
    }
}
