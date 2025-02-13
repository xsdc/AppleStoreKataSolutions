import Testing

@testable import BuilderKataCode

@Test func testTask1() {
    var builder = Stub.series10Builder()
    
    var appleWatch = builder.build()

    #expect(appleWatch.engraving == "None")
    
    builder = builder.setEngraving("Hello, World!") ?? Stub.series10Builder()
    
    appleWatch = builder.build()
    
    #expect(appleWatch.engraving == "Hello, World!")
}

@Test func testTask2() {
    let builder = Stub.ultraSeriesBuilder()
    
    let appleWatch = builder.build()
    
    #expect(appleWatch.collection == "Ultra Series")
    #expect(appleWatch.size == "49mm")
    #expect(appleWatch.material == "Natural Titanium")
    #expect(appleWatch.band == "Trail Loop")
}

@Test func testTask3() {
    var builder = Stub.ultraSeriesBuilder()
    builder = builder.setSize(.fortyNine)?.setMaterial(.blackTitanium)?.setBand(.alpineLoop) ?? Stub.ultraSeriesBuilder()
    
    let appleWatch = builder.build()
    
    #expect(appleWatch.collection == "Ultra Series")
    #expect(appleWatch.size == "49mm")
    #expect(appleWatch.material == "Black Titanium")
    #expect(appleWatch.band == "Alpine Loop")
}

@Test func testSeries10BuilderDefaults() {
    let builder = Stub.series10Builder()

    let appleWatch = builder.build()

    #expect(appleWatch.collection == "Series 10")
    #expect(appleWatch.size == "42mm")
    #expect(appleWatch.material == "Aluminum")
    #expect(appleWatch.band == "Sport Band")
}

@Test func testSeries10BuilderConfiguration() {
    var builder = Stub.series10Builder()
    builder = builder.setSize(.fortySix)?.setMaterial(.titanium)?.setBand(.milaneseLoop) ?? Stub.series10Builder()

    let appleWatch = builder.build()

    #expect(appleWatch.collection == "Series 10")
    #expect(appleWatch.size == "46mm")
    #expect(appleWatch.material == "Titanium")
    #expect(appleWatch.band == "Milanese Loop")
}

@Test func testHèrmesSeries10BuilderDefaults() {
    let builder = Stub.hèrmesSeries10Builder()

    let appleWatch = builder.build()

    #expect(appleWatch.collection == "Hèrmes Series 10")
    #expect(appleWatch.size == "42mm")
    #expect(appleWatch.material == "Titanium")
    #expect(appleWatch.band == "Torsade Single Tour")
}

@Test func testHèrmesSeries10BuilderConfiguration() {
    var builder = Stub.hèrmesSeries10Builder()
    builder = builder.setSize(.fortySix)?.setMaterial(.titanium)?.setBand(.grand) ?? Stub.hèrmesSeries10Builder()

    let appleWatch = builder.build()

    #expect(appleWatch.collection == "Hèrmes Series 10")
    #expect(appleWatch.size == "46mm")
    #expect(appleWatch.material == "Titanium")
    #expect(appleWatch.band == "Grand H")
}

struct Stub {
    static func ultraSeriesBuilder() -> UltraSeriesBuilder { UltraSeriesBuilder() }
    static func series10Builder() -> Series10Builder { Series10Builder() }
    static func hèrmesSeries10Builder() -> HèrmesSeries10Builder { HèrmesSeries10Builder() }
}
