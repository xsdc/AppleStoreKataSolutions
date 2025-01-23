import Foundation
import Testing

@testable import AppleStoreAdapter

extension Kata {
    struct Mocks {
        static let popularityBasedServiceProducts = [
            PopularityBasedServiceProduct(
                popularityIdentifier: "1234",
                popularityTitle: "Apple Watch Ultra",
                popularityDateIntroduced: DateMocks.appleWatchUltra
            ),
            PopularityBasedServiceProduct(
                popularityIdentifier: "4321",
                popularityTitle: "Vision Pro",
                popularityDateIntroduced: DateMocks.visionPro
            ),
        ]
        
        static let machineLearningServiceProducts = [
            MachineLearningServiceProduct(
                machineLearningId: "1234",
                machineLearningName: "Apple Watch Ultra",
                machineLearningUnixDateIntroduced: 1630972800
            ),
            MachineLearningServiceProduct(
                machineLearningId: "4321",
                machineLearningName: "Vision Pro",
                machineLearningUnixDateIntroduced: 1683331200
            ),
        ]
        
        static let historyServiceProducts = [
            HistoryServiceProduct(
                historyId: "1234",
                historyName: "Apple Watch Ultra",
                historyDateIntroduced: "07-09-2021"
            ),
            HistoryServiceProduct(
                historyId: "4321",
                historyName: "Vision Pro",
                historyDateIntroduced: "06-05-2023"
            ),
            HistoryServiceProduct(
                historyId: "2314",
                historyName: "iPhone 15 Pro",
                historyDateIntroduced: "12-09-2023"
            ),
        ]
    }
    
    @Test func testPopularityBasedRecommendationEngineAdapter() {
        let adapter = PopularityBasedRecommendationEngineAdapter(products: Mocks.popularityBasedServiceProducts)
        let recommendationEngine = RecommendationEngine(adapter: adapter)
        let products = recommendationEngine.fetchProductRecommendations()
        
        #expect(products.count == 2)
        
        #expect(products[0].id == "1234")
        #expect(products[0].name == "Apple Watch Ultra")
        #expect(products[0].dateIntroduced == DateMocks.appleWatchUltra)
        
        #expect(products[1].id == "4321")
        #expect(products[1].name == "Vision Pro")
        #expect(products[1].dateIntroduced == DateMocks.visionPro)
    }
    
    @Test func testMachineLearningRecommendationEngineAdapter() {
        let adapter = MachineLearningRecommendationEngineAdapter(products: Mocks.machineLearningServiceProducts)
        let recommendationEngine = RecommendationEngine(adapter: adapter)
        let products = recommendationEngine.fetchProductRecommendations()
        
        #expect(products.count == 2)
        #expect(products[0].id == "1234")
        #expect(products[0].name == "Apple Watch Ultra")
        #expect(products[0].dateIntroduced == DateMocks.appleWatchUltra)
        
        
        #expect(products[1].id == "4321")
        #expect(products[1].name == "Vision Pro")
        #expect(products[1].dateIntroduced == DateMocks.visionPro)
    }
    
    @Test func testHistoryRecommendationEngineAdapter() {
        let adapter = HistoryRecommendationEngineAdapter(products: Mocks.historyServiceProducts)
        let recommendationEngine = RecommendationEngine(adapter: adapter)
        let products = recommendationEngine.fetchProductRecommendations()
        
        #expect(products.count == 3)
        
        #expect(products[0].id == "1234")
        #expect(products[0].name == "Apple Watch Ultra")
        #expect(products[0].dateIntroduced == DateMocks.appleWatchUltra)
        
        #expect(products[1].id == "4321")
        #expect(products[1].name == "Vision Pro")
        #expect(products[1].dateIntroduced == DateMocks.visionPro)
        
        #expect(products[2].id == "2314")
        #expect(products[2].name == "iPhone 15 Pro")
        #expect(products[2].dateIntroduced == DateMocks.iPhone15Pro)
    }
    
    struct DateMocks {
        static let calendar = Calendar(identifier: .gregorian)
        static let timeZone = TimeZone(secondsFromGMT: 0)!
        
        static let appleWatchUltra: Date = {
            var components = DateComponents()
            components.year = 2021
            components.month = 9
            components.day = 7
            components.hour = 0
            components.minute = 0
            components.second = 0
            components.timeZone = timeZone
            
            return calendar.date(from: components)!
        }()
        
        static let visionPro: Date = {
            var components = DateComponents()
            components.year = 2023
            components.month = 5
            components.day = 6
            components.hour = 0
            components.minute = 0
            components.second = 0
            components.timeZone = timeZone
            
            return calendar.date(from: components)!
        }()
        
        static let iPhone15Pro: Date = {
            var components = DateComponents()
            components.year = 2023
            components.month = 9
            components.day = 12
            components.hour = 0
            components.minute = 0
            components.second = 0
            components.timeZone = timeZone
            
            return calendar.date(from: components)!
        }()
    }
}
