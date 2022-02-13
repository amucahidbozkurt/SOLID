import Foundation

// Iki obje arasindaki iletisimde isi olmayan fonksiyonu bulundurmamak uzerine kurulu prensiptir.
// Asagidaki ornege bakarsak; TemperatureController class'inda sadece temperature ile alakali is yapiyoruz, speedUnit ile alakali hic bir isi yok.
// Interface Segregation’a göre gereksiz hiçbir yetenek sınıflara eklenmemelidir. Çünkü bu durum kod karmaşıklığını arttırıp kodun okunurluğunu düşünür. Bu durumun önüne geçmek amacıyla bu kural, interface’leri parçalamamız gerektiğini söyler.

// YANLIS
enum TemperatureUnit {
    case celcius
    case fahrenheit
}

enum SpeedUnit {
    case kilometers
    case miles
}

protocol UserSettingsProtocol: AnyObject {
    var temperatureUnit: TemperatureUnit { get set }
    var speedUnit: SpeedUnit { get set }
}

class TemperatureController {
    private let settings: UserSettingsProtocol
    
    init(settings: UserSettingsProtocol) {
        self.settings = settings
    }
    
    func toggle() {
        switch settings.temperatureUnit {
        case .celcius:
            settings.temperatureUnit = .fahrenheit
        case .fahrenheit:
            settings.temperatureUnit = .celcius
        }
    }
}

// UserSettingsProtocol'u ikiye bolerek ileride cikabilecek olan karmasikligi gidermis oluruz. Cunku, buyuk projede bizden sonra baska bir developer gelse yanlislikla alakasiz bir yerde kullanilmayan fonksiyonu cagirabilir.

// DOGRU
enum TemperatureUnit2 {
    case celcius
    case fahrenheit
}

enum SpeedUnit2 {
    case kilometers
    case miles
}

protocol TemperatureSettingsProtocol: AnyObject {
    var temperatureUnit: TemperatureUnit { get set }
}

protocol SpeedSettingsProtocol2: AnyObject {
    var speedUnit: SpeedUnit { get set }
}

class TemperatureController2 {
    private let settings: TemperatureSettingsProtocol
    
    init(settings: TemperatureSettingsProtocol) {
        self.settings = settings
    }
    
    func toggle() {
        switch settings.temperatureUnit {
        case .celcius:
            settings.temperatureUnit = .fahrenheit
        case .fahrenheit:
            settings.temperatureUnit = .celcius
        }
    }
}
