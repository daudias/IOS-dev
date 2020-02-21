//
//  Calculator.swift
//  Calculator
//
//  Created by Dias on 26.01.2020.
//  Copyright © 2020 Dias Dauletov. All rights reserved.
//

import Foundation

class Calculator{
    // MARK: - Variables
    public var temp:Double = 0
    public var result:Double = 0
    
    var lastBinaryOperation:((Double, Double) -> Double)?
    
    // MARK: -Constants
    enum Operation {
        case equals
        case constant(value: Double)
        case unary(function: (Double) -> Double)
        case binary(function: (Double, Double) -> Double)
        case AC
    }
    
    var map: [String : Operation] = [
        "+" : .binary(function: {a, b in return a + b}),
        "-" : .binary(function: {a, b in return a - b}),
        "x" : .binary(function: {a, b in return a * b}),
        "/" : .binary(function: {a, b in return a / b}),
        "x^y" : .binary(function: {a, b in return pow(a, b)}),
        "%" : .unary(function: {a in return a / 100}),
        "sqrt" : .unary(function: {a in return sqrt(a)}),
        "fact" : .unary(function: {a in fact(n: a)}),
        "PI" : .constant(value: Double.pi),
        "RND" : .constant(value: Double.random(in: DBL_MIN + 1...DBL_MAX) - 1),
        "GPA" : .constant(value: 1.99),
        "C" : .constant(value: 0),
        "=" : .equals,
        "AC": .AC
    ]
    
    // Operation Functions
    static func fact(n: Double) -> Double {
        var x:Double = Double(Int(n))
        var ans:Double = 1
        guard x >= 0 && x <= 20 else {
            return n
        }
        while(x > 0){
            ans *= x
            x -= 1
        }
        return ans
    }
    
    
    // MARK: -Methods
    func setOperand(number: Double){
        result = number
    }
    
    func executeOperation(symbol: String) {
        guard let operation = map[symbol] else{
            print("ERROR: no such symbol in map")
            return
        }
        switch operation {
        case .binary(let function):
            if(lastBinaryOperation != nil){
                executeOperation(symbol: "=")
            }
            lastBinaryOperation = function
            temp = result
        case .unary(let function):
            result = function(result)
        case .constant(let value):
            result = value
        case .equals:
            if let lastOperation = lastBinaryOperation{
                result = lastOperation(temp, result)
                temp = 0
                lastBinaryOperation = nil
            }
        case .AC:
            AC()
        }
    }
    
    func AC(){
        result = 0
        temp = 0
        lastBinaryOperation = nil
    }
}
