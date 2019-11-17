//
//  CalculatorButtonItem.swift
//  SwiftUICal
//
//  Created by tony on 2019/11/11.
//  Copyright © 2019 tony. All rights reserved.
//

import Foundation
import SwiftUI

enum CalculatorButtonItem {
    
    enum Op: String {
        case plus = "+"
        case minus = "-"
        case divide = "÷"
        case multiply = "x"
        case equal = "="
        
        func calculate(l: String, r: String) -> String? {
            
            guard let left = Double(l), let right = Double(r) else {
                return nil
            }
            
            let result: Double?
            switch self {
            case .plus: result = left + right
            case .minus: result = left - right
            case .multiply: result = left * right
            case .divide: result = right == 0 ? nil : left / right
            case .equal: fatalError()
            }
            
            return result.map {
                String($0)
            }
        }
        
    }
    
    enum Command: String {
        case clear = "AC"
        case flip = "+/-"
        case percent = "%"
    }
    
    case digit(Int)
    case dot
    case op(Op)
    case command(Command)
}

extension CalculatorButtonItem: Hashable {
    
    var title: String {
        switch self {
        case .digit(let value): return String(value)
        case .dot: return "."
        case .op(let op): return op.rawValue
        case .command(let command): return command.rawValue
        }
    }
    
    var size: CGSize {
        if case .digit(let value) = self, value == 0 {
            return CGSize(width: 88 * 2, height: 88)
        }
        return CGSize(width: 88, height: 88)
    }
    
    var backgroundColorName: String {
        switch self {
        case .digit, .dot: return "digitBackground"
        case .op: return "operatorBackground"
        case .command: return "commandBackground"
        }
    }
    
}

extension CalculatorButtonItem: CustomStringConvertible {
    
    var description: String {
        switch self {
        case .digit(let num): return String(num)
        case .dot: return "."
        case .op(let op): return op.rawValue
        case .command(let command): return command.rawValue
        }
    }
}

