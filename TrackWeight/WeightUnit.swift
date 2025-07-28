import Foundation

enum WeightUnit: String, CaseIterable, Identifiable {
    case grams
    case ounces

    var id: String { rawValue }

    var symbol: String {
        switch self {
        case .grams: return "g"
        case .ounces: return "oz"
        }
    }

    /// Factor to convert from grams to this unit
    var factor: Float {
        switch self {
        case .grams: return 1.0
        case .ounces: return 0.03527396
        }
    }

    func convertFromGrams(_ grams: Float) -> Float {
        return grams * factor
    }
}
