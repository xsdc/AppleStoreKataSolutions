
// Abstract Factory

protocol AbstractComponentFactory {
    func makeCarouselView() -> CarouselViewable
    func makeBentoBoxView() -> BentoBoxViewable
}

// Concrete Factory

class iPhoneCarouselView: CarouselViewable {
    func stopCarousel() {
        print("iPhone carousel stopped")
    }

    func startCarousel() {
        print("iPhone carousel started")
    }
}

class iPadCarouselView: CarouselViewable {
    func stopCarousel() {
        print("iPad carousel stopped")
    }

    func startCarousel() {
        print("iPad carousel started")
    }
}

class iPhoneBentoBoxView: BentoBoxViewable {
    let type: BentoBoxType

    init(type: BentoBoxType) {
        self.type = type
    }
}

class iPadBentoBoxView: BentoBoxViewable {
    let type: BentoBoxType

    init(type: BentoBoxType) {
        self.type = type
    }
}

// Abstract Product

protocol CarouselViewable {
    func stopCarousel()
    func startCarousel()
}

enum BentoBoxType: String {
    case small
    case medium
    case large
}

protocol BentoBoxViewable {
    var type: BentoBoxType { get }
}

// Concrete Product

class iPhoneComponentFactory: AbstractComponentFactory {
    func makeCarouselView() -> CarouselViewable {
        return iPhoneCarouselView()
    }

    func makeBentoBoxView() -> BentoBoxViewable {
        return iPhoneBentoBoxView(type: .small)
    }
}

class iPadComponentFactory: AbstractComponentFactory {
    func makeCarouselView() -> CarouselViewable {
        return iPadCarouselView()
    }

    func makeBentoBoxView() -> BentoBoxViewable {
        return iPadBentoBoxView(type: .large)
    }
}

// Client

class ProductView {
    let bentoBoxView: BentoBoxViewable
    let carouselView: CarouselViewable

    init(factory: AbstractComponentFactory) {
        self.carouselView = factory.makeCarouselView()
        self.bentoBoxView = factory.makeBentoBoxView()
    }
}
