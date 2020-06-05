//
//  IMCCalculator.swift
//  IMC
//

import UIKit

enum IMCResult: String {
    case thinnes = "Magreza"
    case under = "Abaixo do peso"
    case ideal = "Peso ideal"
    case over = "Sobrepeso"
    case obesity = "Obesidade"
}

class IMCCalculator {

    private(set) var imcResult: IMCResult = .ideal
    private(set) var imageName: String = ""
    private(set) var weight: Double
    private(set) var height: Double
    private(set) var value: Double = 0.0
    var result: String {
        return "\(Int(value)): \(imcResult.rawValue)"
    }
    
    init(weight: Double, height: Double) {
        self.weight = weight
        self.height = height
        calculate(weight: weight, height: height)
    }
    
    convenience init() {
        self.init(weight: 75.0, height: 1.80)
    }
    
    func refresh(weight: Double, height: Double) {
        self.weight = weight
        self.height = height
        self.calculate(weight: weight, height: height)
    }
    
    private func calculate(weight: Double, height: Double) {
        value = weight/(height*height)
        switch value {
        case 0..<16:
            imcResult = .thinnes
            imageName = "magreza"
        case 16..<18.5:
            imcResult = .under
            imageName = "abaixo"
        case 18.5..<25:
            imcResult = .ideal
            imageName = "ideal"
        case 25..<30:
            imcResult = .over
            imageName = "sobre"
        default:
            imcResult = .obesity
            imageName = "obesidade"
        }
    }
}
