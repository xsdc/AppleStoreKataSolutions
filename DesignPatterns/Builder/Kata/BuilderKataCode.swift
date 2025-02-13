
// Builder

protocol AppleWatchBuilder {
    associatedtype SizeType
    associatedtype MaterialType
    associatedtype BandType
    associatedtype EngravingType

    func setSize(_ size: SizeType) -> Self?
    func setMaterial(_ material: MaterialType) -> Self?
    func setBand(_ band: BandType) -> Self?
    func setEngraving(_ engraving: EngravingType) -> Self?
    func build() -> AppleWatch
}

// Concrete Builder

class HèrmesSeries10Builder: AppleWatchBuilder {
    private var appleWatch = AppleWatch(
        collection: "Hèrmes Series 10",
        size: Size.fortyTwo.rawValue,
        material: Material.titanium.rawValue,
        band: Band.torsade.rawValue
    )

    enum Size: String {
        case fortyTwo = "42mm"
        case fortySix = "46mm"
    }

    enum Material: String {
        case titanium = "Titanium"
    }

    enum Band: String {
        case torsade = "Torsade Single Tour"
        case grand = "Grand H"
    }

    typealias SizeType = Size
    typealias MaterialType = Material
    typealias BandType = Band
    typealias EngravingType = String

    func setSize(_ size: Size) -> Self? {
        appleWatch.size = size.rawValue
        return self
    }

    func setMaterial(_ material: Material) -> Self? {
        appleWatch.material = material.rawValue
        return self
    }

    func setBand(_ band: Band) -> Self? {
        appleWatch.band = band.rawValue
        return self
    }
    
    func setEngraving(_ engraving: String) -> Self? {
        appleWatch.engraving = engraving
        return self
    }

    func build() -> AppleWatch {
        return appleWatch
    }
}

class Series10Builder: AppleWatchBuilder {
    private var appleWatch = AppleWatch(
        collection: "Series 10",
        size: Size.fortyTwo.rawValue,
        material: Material.aluminum.rawValue,
        band: Band.sportBand.rawValue
    )

    enum Size: String {
        case fortyTwo = "42mm"
        case fortySix = "46mm"
    }

    enum Material: String {
        case aluminum = "Aluminum"
        case titanium = "Titanium"
    }

    enum Band: String {
        case sportBand = "Sport Band"
        case milaneseLoop = "Milanese Loop"
    }

    typealias SizeType = Size
    typealias MaterialType = Material
    typealias BandType = Band
    typealias EngravingType = String

    func setSize(_ size: Size) -> Self? {
        appleWatch.size = size.rawValue
        return self
    }

    func setMaterial(_ material: Material) -> Self? {
        appleWatch.material = material.rawValue
        return self
    }

    func setBand(_ band: Band) -> Self? {
        appleWatch.band = band.rawValue
        return self
    }
    
    func setEngraving(_ engraving: String) -> Self? {
        return nil
    }

    func build() -> AppleWatch {
        return appleWatch
    }
}

class UltraSeriesBuilder: AppleWatchBuilder {
    private var appleWatch = AppleWatch(
        collection: "",
        size: "",
        material: "",
        band: ""
    )

    enum Size: String {
        case fortyNine = "49mm"
    }

    enum Material: String {
        case naturalTitanium = "Natural Titanium"
        case blackTitanium = "Black Titanium"
    }

    enum Band: String {
        case alpineLoop = "Alpine Loop"
        case trailLoop = "Trail Loop"
        case oceanBand = "Ocean Band"
        case titaniumMilaneseLoop = "Titanium Milanese Loop"
    }
    
    enum Engraving {
        case none
    }

    typealias SizeType = Size
    typealias MaterialType = Material
    typealias BandType = Band
    typealias EngravingType = Engraving

    func setSize(_ size: Size) -> Self? {
        return nil
    }

    func setMaterial(_ material: Material) -> Self? {
        return nil
    }

    func setBand(_ band: Band) -> Self? {
        return nil
    }

    func setEngraving(_ engraving: Engraving) -> Self? {
        return nil
    }

    func build() -> AppleWatch {
        return appleWatch
    }
}

// Product

struct AppleWatch {
    var collection: String
    var size: String
    var material: String
    var band: String
    var engraving: String?
}
