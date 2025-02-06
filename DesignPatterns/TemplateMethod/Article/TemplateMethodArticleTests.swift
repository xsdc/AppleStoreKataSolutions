import Testing

@testable import TemplateMethodArticleCode

@Test func testSeries10AppleWatchProcess() {
    let configuration = MockSeries10AppleWatchConfiguration()
    configuration.process()

    #expect(configuration.operationOrder.count == 5)
    #expect(configuration.operationOrder[0] == "mapDataForWatchCaseSize")
    #expect(configuration.operationOrder[1] == "mapDataForWatchCaseMaterial")
    #expect(configuration.operationOrder[2] == "mapDataForWatchBand")
    #expect(configuration.operationOrder[3] == "mapDataForWatchBandSize")
    #expect(configuration.operationOrder[4] == "mapDataForWatchEngraving")
}

@Test func testHermèsSeries10AppleWatchProcess() {
    let configuration = MockHermèsSeries10AppleWatchConfiguration()
    configuration.process()

    #expect(configuration.operationOrder.count == 5)
    #expect(configuration.operationOrder[0] == "mapDataForWatchCaseSize")
    #expect(configuration.operationOrder[1] == "mapDataForWatchCaseMaterial")
    #expect(configuration.operationOrder[2] == "mapDataForWatchBand")
    #expect(configuration.operationOrder[3] == "mapDataForWatchBandSize")
    #expect(configuration.operationOrder[4] == "mapDataForWatchEngraving")
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
