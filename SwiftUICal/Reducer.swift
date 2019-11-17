//
//  Reducer.swift
//  SwiftUICal
//
//  Created by tony on 2019/11/15.
//  Copyright © 2019 tony. All rights reserved.
//

import Foundation

typealias CalculatorState = CalculatorBrain
typealias CalculatorStateAction = CalculatorButtonItem

struct Reducer {
    static func reduce(state: CalculatorState, action: CalculatorStateAction) -> CalculatorState {
        return state.apply(item: action)
    }
}
