
// Abstract Factory

protocol AbstractComponentFactory {
    func makeCarouselView() -> CarouselViewable
    func makeBentoBoxView() -> BentoBoxViewable
    func makeCardStackView() -> CardStackViewable?
}

// Concrete Factory

class MacCarouselView: CarouselViewable {
    func stopCarousel() {
        print("Mac carousel stopped")
    }

    func startCarousel() {
        print("Mac carousel started")
    }
}

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

class MacBentoBoxView: BentoBoxViewable {
    let type: BentoBoxType
    
    init(type: BentoBoxType) {
        self.type = type
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

class MacCardStackView: CardStackViewable {
    let type: CardStackType
    
    init() {
        self.type = .adaptive
    }
    
    func nextCard() {
        print("Mac next card")
    }

    func previousCard() {
        print("Mac previous card")
    }
}

class iPadCardStackView: CardStackViewable {
    let type: CardStackType
    
    init() {
        self.type = .adaptive
    }
    
    func nextCard() {
        print("iPad next card")
    }

    func previousCard() {
        print("iPad previous card")
    }
}

class iPhoneCardStackView: CardStackViewable {
    let type: CardStackType
    
    init() {
        self.type = .adaptive
    }
    
    func nextCard() {
        print("iPhone next card")
    }

    func previousCard() {
        print("iPhone previous card")
    }
}

// Abstract Product

enum CardStackType: String {
    case adaptive
    case horizontal
    case vertical
}

protocol CardStackViewable {
    var type: CardStackType { get }
    func nextCard()
    func previousCard()
}

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

class MacComponentFactory: AbstractComponentFactory {
    func makeCardStackView() -> CardStackViewable? {
        return nil
    }
    
    func makeCarouselView() -> CarouselViewable {
        return iPadCarouselView()
    }

    func makeBentoBoxView() -> BentoBoxViewable {
        return iPadBentoBoxView(type: .small)
    }
}

class iPhoneComponentFactory: AbstractComponentFactory {
    func makeCardStackView() -> CardStackViewable? {
        return nil
    }
    
    func makeCarouselView() -> CarouselViewable {
        return iPhoneCarouselView()
    }

    func makeBentoBoxView() -> BentoBoxViewable {
        return iPhoneBentoBoxView(type: .small)
    }
}

class iPadComponentFactory: AbstractComponentFactory {
    func makeCardStackView() -> CardStackViewable? {
        return nil
    }
    
    func makeCarouselView() -> CarouselViewable {
        return iPadCarouselView()
    }

    func makeBentoBoxView() -> BentoBoxViewable {
        return iPadBentoBoxView(type: .large)
    }
}

// Client

class ProductView {
    let cardStackView: CardStackViewable?
    let bentoBoxView: BentoBoxViewable
    let carouselView: CarouselViewable

    init(factory: AbstractComponentFactory) {
        self.carouselView = factory.makeCarouselView()
        self.bentoBoxView = factory.makeBentoBoxView()
        self.cardStackView = factory.makeCardStackView()
    }
}
