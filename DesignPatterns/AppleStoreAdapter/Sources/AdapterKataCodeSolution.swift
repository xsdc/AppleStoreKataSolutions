import Foundation

struct KataSolution {
    struct PopularityBasedServiceProduct {
        let popularityIdentifier: String
        let popularityTitle: String
        let popularityDateIntroduced: Date
    }

    struct MachineLearningServiceProduct {
        let machineLearningId: String
        let machineLearningName: String
        let machineLearningUnixDateIntroduced: Int
    }

    struct HistoryServiceProduct {
        let historyId: String
        let historyName: String
        let historyDateIntroduced: String
    }

    // Target

    struct Product: Identifiable {
        let id: String
        let name: String
        let dateIntroduced: Date?
    }

    // Client

    class RecommendationEngine {
        private let adapter: RecommendationEngineAdapter

        init(adapter: RecommendationEngineAdapter) {
            self.adapter = adapter
        }

        func fetchProductRecommendations() -> [Product] {
            return adapter.fetchProductRecommendations()
        }
    }

    // Adaptee

    protocol RecommendationEngineAdapter {
        func fetchProductRecommendations() -> [Product]
    }

    // Adapter

    class PopularityBasedRecommendationEngineAdapter: RecommendationEngineAdapter {
        private let popularityBasedServiceProducts: [PopularityBasedServiceProduct]

        init(products: [PopularityBasedServiceProduct]) {
            self.popularityBasedServiceProducts = products
        }

        func fetchProductRecommendations() -> [Product] {
            return popularityBasedServiceProducts.map { product in
                Product(
                    id: product.popularityIdentifier,
                    name: product.popularityTitle,
                    dateIntroduced: product.popularityDateIntroduced
                )
            }
        }
    }

    class MachineLearningRecommendationEngineAdapter: RecommendationEngineAdapter {
        private let machineLearningServiceProducts: [MachineLearningServiceProduct]

        init(products: [MachineLearningServiceProduct]) {
            self.machineLearningServiceProducts = products
        }

        func fetchProductRecommendations() -> [Product] {
            return machineLearningServiceProducts.map { machineLearningProduct in
                let dateIntroduced = convertUnixTimeToDate(unixTime: machineLearningProduct.machineLearningUnixDateIntroduced)
                
                return Product(
                    id: machineLearningProduct.machineLearningId,
                    name: machineLearningProduct.machineLearningName,
                    dateIntroduced: dateIntroduced
                )
            }
        }
        
        private func convertUnixTimeToDate(unixTime: Int) -> Date? {
            return Date(timeIntervalSince1970: TimeInterval(unixTime))
        }
    }

    class HistoryRecommendationEngineAdapter: RecommendationEngineAdapter {
        private let historyServiceProducts: [HistoryServiceProduct]

        init(products: [HistoryServiceProduct]) {
            self.historyServiceProducts = products
        }

        func fetchProductRecommendations() -> [Product] {
            return historyServiceProducts.map { historyServiceProduct in
                let dateIntroduced = convertStringToDate(stringDate: historyServiceProduct.historyDateIntroduced, withDateFormat: "dd-MM-yyyy")
                
                return Product(
                    id: historyServiceProduct.historyId,
                    name: historyServiceProduct.historyName,
                    dateIntroduced: dateIntroduced
                )
            }
        }
        
        private func convertStringToDate(stringDate: String, withDateFormat dateFormat: String) -> Date? {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = dateFormat
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            
            return dateFormatter.date(from: stringDate)
        }
    }
}
