
// Abstract Class

protocol AppleWatchConfiguration {
    func process()
    func mapDataForWatchCaseSize()
    func mapDataForWatchCaseMaterial()
    func mapDataForWatchBand()
    func mapDataForWatchBandSize()
    func mapDataForWatchEngraving()
}

class DefaultAppleWatchConfiguration: AppleWatchConfiguration {
    var engravingIsEnabled: Bool = true
    
    final func process() {
        mapDataForWatchBand()
        mapDataForWatchBandSize()
        if engravingIsEnabled {
            mapDataForWatchEngraving()
        }
        mapDataForWatchCaseMaterial()
        mapDataForWatchCaseSize()
    }

    func mapDataForWatchCaseSize() {
        print("Default implementation for case size.")
    }

    func mapDataForWatchCaseMaterial() {
        print("Default implementation for case material.")
    }

    func mapDataForWatchBand() {
        print("Default implementation for watch band.")
    }

    func mapDataForWatchBandSize() {
        print("Default implementation for band size.")
    }

    func mapDataForWatchEngraving() {
        print("Default implementation for engraving.")
    }
}

class ReverseOrderAppleWatchConfiguration: AppleWatchConfiguration {
    final func process() {
        mapDataForWatchCaseSize()
        mapDataForWatchCaseMaterial()
        mapDataForWatchEngraving()
        mapDataForWatchBandSize()
        mapDataForWatchBand()
    }

    func mapDataForWatchCaseSize() {
        print("Default implementation for case size.")
    }

    func mapDataForWatchCaseMaterial() {
        print("Default implementation for case material.")
    }

    func mapDataForWatchBand() {
        print("Default implementation for watch band.")
    }

    func mapDataForWatchBandSize() {
        print("Default implementation for band size.")
    }

    func mapDataForWatchEngraving() {
        print("Default implementation for engraving.")
    }
}

// Concrete Classes

class Series10AppleWatchConfiguration: DefaultAppleWatchConfiguration {
    override func mapDataForWatchCaseSize() {
        print("Implementation for converting the data structure for the Apple Watch Series 10 case size.")
    }

    override func mapDataForWatchCaseMaterial() {
        print("Implementation for converting the data structure for the Apple Watch Series 10 case material.")
    }

    override func mapDataForWatchBand() {
        print("Implementation for converting the data structure for the Apple Watch Series 10 band.")
    }

    override func mapDataForWatchBandSize() {
        print("Implementation for converting the data structure for the Apple Watch Series 10 band size.")
    }

    override func mapDataForWatchEngraving() {
        print("Implementation for converting the data structure for the Apple Watch Series 10 engraving.")
    }
}

class ReverseOrderSeries10AppleWatchConfiguration: ReverseOrderAppleWatchConfiguration {
    override func mapDataForWatchCaseSize() {
        print("Implementation for converting the data structure for the Apple Watch Series 10 case size.")
    }

    override func mapDataForWatchCaseMaterial() {
        print("Implementation for converting the data structure for the Apple Watch Series 10 case material.")
    }

    override func mapDataForWatchBand() {
        print("Implementation for converting the data structure for the Apple Watch Series 10 band.")
    }

    override func mapDataForWatchBandSize() {
        print("Implementation for converting the data structure for the Apple Watch Series 10 band size.")
    }

    override func mapDataForWatchEngraving() {
        print("Implementation for converting the data structure for the Apple Watch Series 10 engraving.")
    }
}

class HermèsSeries10AppleWatchConfiguration: DefaultAppleWatchConfiguration {
    override init() {
        super.init()
        engravingIsEnabled = false
    }
    
    override func mapDataForWatchCaseSize() {
        print("Implementation for converting the data structure for the Apple Watch Hermès Series case size.")
    }

    override func mapDataForWatchCaseMaterial() {
        print("Implementation for converting the data structure for the Apple Watch Hermès Series case material.")
    }

    override func mapDataForWatchBand() {
        print("Implementation for converting the data structure for the Apple Watch Hermès Series band.")
    }

    override func mapDataForWatchBandSize() {
        print("Implementation for converting the data structure for the Apple Watch Hermès Series band size.")
    }

    override func mapDataForWatchEngraving() {
        print("Implementation for converting the data structure for the Apple Watch Hermès Series 10 engraving.")
    }
}
