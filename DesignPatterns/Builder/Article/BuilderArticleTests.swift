import Testing

@testable import BuilderArticleCode

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
    builder = builder.setSize(.fortySix).setMaterial(.titanium).setBand(.milaneseLoop)

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
    builder = builder.setSize(.fortySix).setMaterial(.titanium).setBand(.grand)

    let appleWatch = builder.build()

    #expect(appleWatch.collection == "Hèrmes Series 10")
    #expect(appleWatch.size == "46mm")
    #expect(appleWatch.material == "Titanium")
    #expect(appleWatch.band == "Grand H")
}

struct Stub {
    static func series10Builder() -> Series10Builder { Series10Builder() }
    static func hèrmesSeries10Builder() -> HèrmesSeries10Builder { HèrmesSeries10Builder() }
}
