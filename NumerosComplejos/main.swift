//
//  main.swift
//  Complex Number Calculator
//  Alberto González Hernández - G31316255
//  Basic complex number calculator for add, substract, multiply and divide operations. Also converts from cartesian to polar and the other way around using computed properties, all the operations are executed taking a polar number given in the constructor and using a second operand number passed as a parameter for each operation.

import Foundation

class ComplexNumber {

    // Computed properties

    public var polarNumber: (mod: Double, arg: Double) {
        get {
            return basePolarNumber
        }
        set(cartNumb) {
            basePolarNumber = (0, 0)
            let realNumber = cartNumb.mod
            let imagNumber = cartNumb.arg
            basePolarNumber.mod = sqrt((realNumber * realNumber) + (imagNumber * imagNumber))
            basePolarNumber.arg = atan2(imagNumber, realNumber)
        }
    }
    
    public var cartesianNumber: (real: Double, imag: Double) {
        get {
            return baseCartesianNumber
        }
        set(polarNumber) {
            baseCartesianNumber = (0, 0)
            let mod = polarNumber.real
            let arg = polarNumber.imag
            baseCartesianNumber.real = mod * cos(arg)
            baseCartesianNumber.imag = mod * sin(arg)
        }
    }
    
    private var initPolarNumber: (mod: Double, arg: Double) = (0, 0)
    private var basePolarNumber: (mod: Double, arg: Double) = (0, 0)
    private var baseCartesianNumber: (real: Double, imag: Double) = (0, 0)
    
    // Constructor
    
    public init(polarNum: (mod: Double, arg: Double)) {
        initPolarNumber = polarNum;
        print("Your initial polar number (\(displayPolarResult(result: polarNum))) converted to cartesian is:")
        cartesianNumber = polarNum as (Double, Double)
        print(displayCartesianResult(result: cartesianNumber))
    }
    
    // Functions that operate directly with the constructor polar number
    
    public func simpleAddNumbers(polarToAdd: (mod: Double, arg: Double)) {
        cartesianNumber = initPolarNumber as (Double, Double)
        let complexA = cartesianNumber
        cartesianNumber = polarToAdd as (Double, Double)
        let complexB = cartesianNumber
        print("(\(displayCartesianResult(result: complexA))) + (\(displayCartesianResult(result: complexB))) = ")
        addNumbers(complexA: complexA, complexB: complexB)
    }
    
    public func simpleSubsNumbers(polarToSubs: (mod: Double, arg: Double)) {
        cartesianNumber = initPolarNumber as (Double, Double)
        let complexA = cartesianNumber
        cartesianNumber = polarToSubs as (Double, Double)
        let complexB = cartesianNumber
        print("(\(displayCartesianResult(result: complexA))) - (\(displayCartesianResult(result: complexB))) = ")
        subsNumbers(complexA: complexA, complexB: complexB)
    }
    
    public func simpleMultNumbers(polarToMult: (mod: Double, arg: Double)) {
        cartesianNumber = initPolarNumber as (Double, Double)
        let complexA = cartesianNumber
        cartesianNumber = polarToMult as (Double, Double)
        let complexB = cartesianNumber
        print("(\(displayCartesianResult(result: complexA))) * (\(displayCartesianResult(result: complexB))) = ")
        multNumbers(complexA: complexA, complexB: complexB)
    }
    
    public func simpleDivNumbers(polarToDiv: (mod: Double, arg: Double)) {
        print("(\(displayPolarResult(result: initPolarNumber))) / (\(displayPolarResult(result: polarToDiv))) = ")
        divNumbers(complexA: initPolarNumber, complexB: polarToDiv)
    }
    
    // Display functions
    
    public func displayCartesianResult(result: (real: Double, imag: Double)) -> String {
        let operChar = (result.imag > 0) ? "+" : "-"
        return "\(Double(round(result.real * 100) / 100)) \(operChar) \(abs(Double(round(result.imag * 100) / 100)))i"
    }
    
    public func displayPolarResult(result: (mod: Double, arg: Double)) -> String {
        return "Mod: \(Double(round(result.mod * 100) / 100)), Arg: \(Double(round(result.arg * 100) / 100))"
    }
    
    // Functions that accept 2 numbers to opperate directly
    
    private func addNumbers(complexA: (real: Double, imag: Double), complexB: (real: Double, imag: Double)) {
        let res = (complexA.real + complexB.real, complexA.imag + complexB.imag)
        print(displayCartesianResult(result: res))
    }
    
    private func subsNumbers(complexA: (real: Double, imag: Double), complexB: (real: Double, imag: Double)) {
        let res = (complexA.real - complexB.real, complexA.imag - complexB.imag)
        print(displayCartesianResult(result: res))
    }
    
    private func multNumbers(complexA: (real: Double, imag: Double), complexB: (real: Double, imag: Double)) {
        let res = ((complexA.real * complexB.real) - (complexA.imag * complexB.imag), (complexA.real * complexB.imag) + (complexA.imag * complexB.real))
        print(displayCartesianResult(result: res))
    }
    
    private func divNumbers(complexA: (mod: Double, arg: Double), complexB: (mod: Double, arg: Double)) {
        let res = ((complexA.mod / complexB.mod), (complexA.arg - complexB.arg))
        print(displayPolarResult(result: res))
    }
}

let complexNumber = ComplexNumber(polarNum: (mod: 3.61, arg: 0.983))
let polarOperand: (mod: Double, arg: Double) = (mod: 6.4, arg: -0.8955)
print("\n ==================== Operation test results ======================= \n")
// Operation add
print("\nAdd operation")
complexNumber.simpleAddNumbers(polarToAdd: polarOperand)
// Operation substract
print("\nSubstract operation")
complexNumber.simpleSubsNumbers(polarToSubs: polarOperand)
// Operation multiply
print("\nMultiply operation")
complexNumber.simpleMultNumbers(polarToMult: polarOperand)
// Operation divide
print("\nDivide operation")
complexNumber.simpleDivNumbers(polarToDiv: polarOperand)
// Polar to cartesian
let cartesianNumberToConvert: (Double, Double) = (2, 3)
complexNumber.polarNumber = cartesianNumberToConvert
let polarNumber = complexNumber.polarNumber
print("\nCartesian to polar for number: \(complexNumber.displayCartesianResult(result: cartesianNumberToConvert))")
print(complexNumber.displayPolarResult(result: polarNumber))
// Cartesian to polar
let polarNumberToConvert = polarNumber as (Double, Double)
complexNumber.cartesianNumber = polarNumberToConvert
let cartesianNumber = complexNumber.cartesianNumber
print("\nPolar to cartesian for number: \(complexNumber.displayPolarResult(result: polarNumber))")
print(complexNumber.displayCartesianResult(result: cartesianNumber))

