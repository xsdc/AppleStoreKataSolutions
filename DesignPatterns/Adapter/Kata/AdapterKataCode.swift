import Foundation

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

// Task 1: Complete the implementation for the new recommendation engine adapter: `PopularityBasedRecommendationEngineAdapter`.

class PopularityBasedRecommendationEngineAdapter: RecommendationEngineAdapter {
    private let popularityBasedServiceProducts: [PopularityBasedServiceProduct]

    init(products: [PopularityBasedServiceProduct]) {
        self.popularityBasedServiceProducts = products
    }

    func fetchProductRecommendations() -> [Product] {
        [
            Product(id: "", name: "", dateIntroduced: nil),
            Product(id: "", name: "", dateIntroduced: nil)
        ]
    }
}

// Task 2: Complete the implementation of the `dateIntroduced` property for the `Product` struct.

class MachineLearningRecommendationEngineAdapter: RecommendationEngineAdapter {
    private let machineLearningServiceProducts: [MachineLearningServiceProduct]

    init(products: [MachineLearningServiceProduct]) {
        self.machineLearningServiceProducts = products
    }

    func fetchProductRecommendations() -> [Product] {
        return machineLearningServiceProducts.map { machineLearningProduct in
            return Product(
                id: machineLearningProduct.machineLearningId,
                name: machineLearningProduct.machineLearningName,
                dateIntroduced: nil
            )
        }
    }
}

// Task 3: Complete the implementation of the `dateIntroduced` property for the `Product` struct.

class HistoryRecommendationEngineAdapter: RecommendationEngineAdapter {
    private let historyServiceProducts: [HistoryServiceProduct]

    init(products: [HistoryServiceProduct]) {
        self.historyServiceProducts = products
    }

    func fetchProductRecommendations() -> [Product] {
        return historyServiceProducts.map { historyServiceProduct in
            return Product(
                id: historyServiceProduct.historyId,
                name: historyServiceProduct.historyName,
                dateIntroduced: nil
            )
        }
    }
}
