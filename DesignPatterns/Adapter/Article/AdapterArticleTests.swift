import Testing

@testable import AppleStoreAdapter

extension Article {
    struct Mocks {
        static let machineLearningServiceProducts = [
            MachineLearningServiceProduct(machineLearningId: "1234", machineLearningName: "Apple Watch Ultra"),
            MachineLearningServiceProduct(machineLearningId: "4321", machineLearningName: "Vision Pro")
        ]
        
        static let historyServiceProducts = [
            HistoryServiceProduct(historyId: "1234", historyName: "Apple Watch Ultra"),
            HistoryServiceProduct(historyId: "4321", historyName: "Vision Pro"),
            HistoryServiceProduct(historyId: "2314", historyName: "iPhone Pro")
        ]
    }
    
    @Test func testMachineLearningRecommendationEngineAdapter() {
        let adapter = MachineLearningRecommendationEngineAdapter(products: Mocks.machineLearningServiceProducts)
        let recommendationEngine = RecommendationEngine(adapter: adapter)
        let products = recommendationEngine.fetchProductRecommendations()

        #expect(products.count == 2)
    }

    @Test func testHistoryRecommendationEngineAdapter() {
        let adapter = HistoryRecommendationEngineAdapter(products: Mocks.historyServiceProducts)
        let recommendationEngine = RecommendationEngine(adapter: adapter)
        let products = recommendationEngine.fetchProductRecommendations()

        #expect(products.count == 3)
    }
}
