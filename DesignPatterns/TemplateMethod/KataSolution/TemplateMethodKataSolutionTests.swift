import Testing

@testable import TemplateMethodKataSolutionCode

@Test func testTask1() {
    let configuration = MockSeries10AppleWatchConfiguration()
    configuration.process()

    #expect(configuration.operationOrder.count == 5)
    #expect(configuration.operationOrder[0] == "mapDataForWatchBand")
    #expect(configuration.operationOrder[1] == "mapDataForWatchBandSize")
    #expect(configuration.operationOrder[2] == "mapDataForWatchEngraving")
    #expect(configuration.operationOrder[3] == "mapDataForWatchCaseMaterial")
    #expect(configuration.operationOrder[4] == "mapDataForWatchCaseSize")
}

@Test func testTask2() {
    let configuration = MockReverseOrderSeries10AppleWatchConfiguration()
    configuration.process()

    #expect(configuration.operationOrder.count == 5)
    #expect(configuration.operationOrder[0] == "mapDataForWatchCaseSize")
    #expect(configuration.operationOrder[1] == "mapDataForWatchCaseMaterial")
    #expect(configuration.operationOrder[2] == "mapDataForWatchEngraving")
    #expect(configuration.operationOrder[3] == "mapDataForWatchBandSize")
    #expect(configuration.operationOrder[4] == "mapDataForWatchBand")
}

@Test func testTask3() {
    let configuration = MockHermèsSeries10AppleWatchConfiguration()
    configuration.process()

    #expect(configuration.operationOrder.count == 4)
    #expect(configuration.operationOrder[0] == "mapDataForWatchBand")
    #expect(configuration.operationOrder[1] == "mapDataForWatchBandSize")
    #expect(configuration.operationOrder[2] == "mapDataForWatchCaseMaterial")
    #expect(configuration.operationOrder[3] == "mapDataForWatchCaseSize")
}

class MockSeries10AppleWatchConfiguration: Series10AppleWatchConfiguration {
    var operationOrder: [String] = []

    override func mapDataForWatchCaseSize() {
        operationOrder.append("mapDataForWatchCaseSize")
    }

    override func mapDataForWatchCaseMaterial() {
        operationOrder.append("mapDataForWatchCaseMaterial")
    }

    override func mapDataForWatchBand() {
        operationOrder.append("mapDataForWatchBand")
    }

    override func mapDataForWatchBandSize() {
        operationOrder.append("mapDataForWatchBandSize")
    }

    override func mapDataForWatchEngraving() {
        operationOrder.append("mapDataForWatchEngraving")
    }
}

class MockReverseOrderSeries10AppleWatchConfiguration: ReverseOrderSeries10AppleWatchConfiguration {
    var operationOrder: [String] = []

    override func mapDataForWatchCaseSize() {
        operationOrder.append("mapDataForWatchCaseSize")
    }

    override func mapDataForWatchCaseMaterial() {
        operationOrder.append("mapDataForWatchCaseMaterial")
    }

    override func mapDataForWatchBand() {
        operationOrder.append("mapDataForWatchBand")
    }

    override func mapDataForWatchBandSize() {
        operationOrder.append("mapDataForWatchBandSize")
    }

    override func mapDataForWatchEngraving() {
        operationOrder.append("mapDataForWatchEngraving")
    }
}

class MockHermèsSeries10AppleWatchConfiguration: HermèsSeries10AppleWatchConfiguration {
    var operationOrder: [String] = []

    override func mapDataForWatchCaseSize() {
        operationOrder.append("mapDataForWatchCaseSize")
    }

    override func mapDataForWatchCaseMaterial() {
        operationOrder.append("mapDataForWatchCaseMaterial")
    }

    override func mapDataForWatchBand() {
        operationOrder.append("mapDataForWatchBand")
    }

    override func mapDataForWatchBandSize() {
        operationOrder.append("mapDataForWatchBandSize")
    }

    override func mapDataForWatchEngraving() {
        operationOrder.append("mapDataForWatchEngraving")
    }
}
