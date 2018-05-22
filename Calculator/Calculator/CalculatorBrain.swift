//
//  CalculatorBrain.swift
//  Swift-Caculator
//
//  Created by PengZK on 2018/5/7.
//  Copyright © 2018年 KUN. All rights reserved.
//

import Foundation

/*
 struct和class的重要区别：
 1. 类可以继承，结构体不行
 2. 类存储在堆上，通过指针传递。结构体存储在栈上，通过拷贝值传递。
 */
struct CalculatorBrain {
    
    private var accumulator: Double?
    
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double, Double) -> Double)
        case equals
    }
    
    private var operations: Dictionary<String, Operation> = [
        "π" : Operation.constant(Double.pi),
        "e" : Operation.constant(M_E),
        "√" : Operation.unaryOperation(sqrt),
        "cos" : Operation.unaryOperation(cos),
        "±" : Operation.unaryOperation({ -$0 }),
        "×" : Operation.binaryOperation({ $0 * $1 }), //({ (op1, op2) in return op1 * op2 }),
        "÷" : Operation.binaryOperation({ $0 / $1 }),
        "+" : Operation.binaryOperation({ $0 + $1 }),
        "-" : Operation.binaryOperation({ $0 - $1 }),
        "=" : Operation.equals
    ]
    
    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
                case .constant(let associateConstantValue):
                    accumulator = associateConstantValue
                case .unaryOperation(let function):
                    if accumulator != nil {
                        accumulator = function(accumulator!)
                    }
                case .binaryOperation(let function):
                    if accumulator != nil {
                        pendingBindaryOperation = PendingBindaryOperation(function: function, firstOperand: accumulator!)
                        accumulator = nil
                    }
                case .equals:
                    performPendingBindaryOperation()
            }
        }
    }
        
    private mutating func performPendingBindaryOperation() {
        if pendingBindaryOperation != nil && accumulator != nil {
            accumulator = pendingBindaryOperation!.perform(with: accumulator!)
            pendingBindaryOperation = nil
        }
    }
    
    private var pendingBindaryOperation: PendingBindaryOperation?
        
    private struct PendingBindaryOperation {
        let function: (Double,Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    var result: Double? {
        get {
            return accumulator
        }
    }
}
