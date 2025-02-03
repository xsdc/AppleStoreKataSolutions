
struct Article {
    struct MachineLearningServiceProduct {
        let machineLearningId: String
        let machineLearningName: String
    }

    struct HistoryServiceProduct {
        let historyId: String
        let historyName: String
    }

    // Target

    struct Product: Identifiable {
        let id: String
        let name: String
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

    class MachineLearningRecommendationEngineAdapter: RecommendationEngineAdapter {
        private let machineLearningServiceProducts: [MachineLearningServiceProduct]

        init(products: [MachineLearningServiceProduct]) {
            self.machineLearningServiceProducts = products
        }

        func fetchProductRecommendations() -> [Product] {
            return machineLearningServiceProducts.map { machineLearningProduct in
                Product(
                    id: machineLearningProduct.machineLearningId,
                    name: machineLearningProduct.machineLearningName
                )
            }
        }
    }

    class HistoryRecommendationEngineAdapter: RecommendationEngineAdapter {
        private let historyServiceProducts: [HistoryServiceProduct]

        init(products: [HistoryServiceProduct]) {
            self.historyServiceProducts = products
        }

        func fetchProductRecommendations() -> [Product] {
            return historyServiceProducts.map { historyServiceProduct in
                Product(
                    id: historyServiceProduct.historyId,
                    name: historyServiceProduct.historyName
                )
            }
        }
    }
}
