import SwiftUI

@MainActor
final class UnitSettings: ObservableObject {
    @AppStorage("weightUnit") private var weightUnitRaw: String = WeightUnit.grams.rawValue {
        didSet {
            objectWillChange.send()
        }
    }

    var unit: WeightUnit {
        get { WeightUnit(rawValue: weightUnitRaw) ?? .grams }
        set { weightUnitRaw = newValue.rawValue }
    }
}
