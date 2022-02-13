import Foundation

// Bu prensip OOP ile iliskilidir. Bir protocolden uretilmis alt class, o protocolun barindirdigi tum fonksiyonlari almalidir ama class kendisiyle alakasiz fonksiyonlari almamasi gereklidir. (ileride cikabilecek sorunlar icin) Swift'de biz bu sorunu protocol kullanarak cozuyoruz.
// Asagidaki ornekte de gordugumuz gibi Kartal, BirdProtocol'un tum fonksiyonlarina uyum sagliyor ama Penguen saglamiyor. Saglamiyorsa gereksiz kod kalabaligi yapmamaliyiz, proje buyudukce karisiklik cikabilir.

// YANLIS
protocol BirdProtocol {
    func walk()
    func fly()
}

class Eagle: BirdProtocol {
    func walk() {
        print("Eagle is walking.")
    }
    
    func fly() {
        print("Eagle is flying.")
    }
}

class Penguin: BirdProtocol {
    func walk() {
        print("Penguin is walking.")
    }
    
    func fly() {
        fatalError("Penguins can't fly!")
    }
}

class Zoo {
    // Boyle bir class icinde kullanmak istedeydik ve ses cikart fonksiyonunu cagirdimizda penguene yuru demek zorunda kaliyoruz.
    let birds: [BirdProtocol]
    
    init(birds: [BirdProtocol]) {
        self.birds = birds
    }
    
    func makeNoise() {
        for bird in birds {
            if let penguin = bird as? Penguin {
                penguin.walk()
            } else {
                bird.fly()
            }
        }
    }
}

// Gordugumuz gibi tum kuslar ucamiyor, o halde fly fonksiyonu icin baska bir protocol yapmaliyiz. Ve bu protocollerden ihticaimiza gore yeni bir protocol daha olusuturabiliriz. Penguin icin artik gereksiz yere fly fonksiyonu yazmak zorunda degiliz.

// DOGRU
protocol BirdProtocol2 {
    func walk()
}

protocol FlyingProtocol {
    func fly()
}

protocol FlyingBirdProtocol: BirdProtocol2, FlyingProtocol { }

class Eagle2: FlyingBirdProtocol {
    func walk() {
        print("Eagle is walking.")
    }
    
    func fly() {
        print("Eagle is flying.")
    }
}

class Penguin2: BirdProtocol2 {
    func walk() {
        print("Penguin is walking.")
    }
}

class Zoo2 {
    // Artik penguen kontrolu de yapip ona yuru demek zorunda degiliz.
    let birds: [FlyingBirdProtocol]
    
    init(birds: [FlyingBirdProtocol]) {
        self.birds = birds
    }
    
    func makeNoise() {
        for bird in birds {
            bird.fly()
        }
    }
}
