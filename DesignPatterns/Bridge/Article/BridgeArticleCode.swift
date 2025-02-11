
protocol ComponentView {
    var name: String { get }
}

struct Product {
    let name: String
    let price: Double
}
    
struct TitleView: ComponentView {
    var name: String
}

struct PriceView: ComponentView {
    var name: String
}

struct CarouselView: ComponentView {
    var name: String
}

struct TechSpecsView: ComponentView {
    var name: String
}

// Abstraction

protocol RenderableProductView {
    var product: Product { get }
    var componentRenderer: ProductComponentRenderer { get }

    func render()
}

// Refined Abstraction

class AppleWatchSummaryView: RenderableProductView {
    private(set) var views: [ComponentView] = []
    private(set) var product: Product
    private(set) var componentRenderer: ProductComponentRenderer

    init(product: Product, componentRenderer: ProductComponentRenderer) {
        self.product = product
        self.componentRenderer = componentRenderer
    }

    func render() {
        views.append(componentRenderer.renderTitleView(for: product))
        views.append(componentRenderer.renderPriceView(for: product))
        views.append(componentRenderer.renderCarouselView(for: product))
    }
}

class AppleWatchTechSpecsView: RenderableProductView {
    private(set) var views: [ComponentView] = []
    private(set) var product: Product
    private(set) var componentRenderer: ProductComponentRenderer

    init(product: Product, componentRenderer: ProductComponentRenderer) {
        self.product = product
        self.componentRenderer = componentRenderer
    }

    func render() {
        views.append(componentRenderer.renderTitleView(for: product))
        views.append(componentRenderer.renderPriceView(for: product))
        views.append(componentRenderer.renderTechSpecsView(for: product))
    }
}

// Implementor

protocol ProductComponentRenderer {
    func renderTitleView(for product: Product) -> ComponentView
    func renderPriceView(for product: Product) -> ComponentView
    func renderCarouselView(for product: Product) -> ComponentView
    func renderTechSpecsView(for product: Product) -> ComponentView
}

// Concrete Implementor

struct iPhoneProductComponentRenderer: ProductComponentRenderer {
    func renderTitleView(for product: Product) -> ComponentView {
        return TitleView(name: "Title view for iPhone")
    }

    func renderPriceView(for product: Product) -> ComponentView {
        return PriceView(name: "Price view for iPhone")
    }

    func renderCarouselView(for product: Product) -> ComponentView {
        return CarouselView(name: "Carousel view for iPhone")
    }

    func renderTechSpecsView(for product: Product) -> ComponentView {
        return TechSpecsView(name: "Tech specs view for iPhone")
    }
}

struct iPadProductComponentRenderer: ProductComponentRenderer {
    func renderTitleView(for product: Product) -> ComponentView {
        return TitleView(name: "Title view for iPad")
    }

    func renderPriceView(for product: Product) -> ComponentView {
        return PriceView(name: "Price view for iPad")
    }

    func renderCarouselView(for product: Product) -> ComponentView {
        return CarouselView(name: "Carousel view for iPad")
    }

    func renderTechSpecsView(for product: Product) -> ComponentView {
        return TechSpecsView(name: "Tech specs view for iPad")
    }
}
