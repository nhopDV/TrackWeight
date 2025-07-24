import XCTest
@testable import TrackWeight

final class TrackWeightTests: XCTestCase {
    func testZeroScaleAdjustsOffsetAndWeight() {
        let vm = ScaleViewModel()
        vm.hasTouch = true
        vm.currentWeight = 50.0
        vm.zeroOffset = 10.0

        vm.zeroScale()

        XCTAssertEqual(vm.zeroOffset, 60.0, accuracy: 0.001)

        let touch = OMSTouchData(
            id: 0,
            position: OMSPosition(x: 0, y: 0),
            total: 0,
            pressure: 60.0,
            axis: OMSAxis(major: 0, minor: 0),
            angle: 0,
            density: 0,
            state: .touching,
            timestamp: ""
        )
        vm.processTouchData([touch])
        XCTAssertEqual(vm.currentWeight, 0.0, accuracy: 0.001)
    }
}
