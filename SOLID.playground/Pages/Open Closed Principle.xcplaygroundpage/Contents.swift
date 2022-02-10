import UIKit

// Tasarladigimiz modul, class, fonksiyon vs. genisletilebilir olmali ama modifikasyona kapali olmalidir.

// YANLIS
protocol PaymentManagerProtocol {
    func makeVisaPayment(_ amount: Decimal)
    func makeMastercardPayment(_ amount: Decimal)
    func makeAppleWalletPayment(_ amount: Decimal)
}

// Ileride yeni bir odeme yontemi eklemek istersek, PaymentManagerProtocol'de degisiklik yapmak zorunda kalacagiz. Ve tum fonksiyonlara baktigimiz zaman ayni turde deger aliyor, tek degisen sey fonksiyon isimleri.

// DOGRU
protocol PaymentManagerProtocol2 {
    func payAmount(_ amount: Decimal, method: PaymentMethodProtocol)
}

// Artik protocol'a mudahale etmeden yeni odeme yontemleri ekleyebiliriz.

protocol PaymentMethodProtocol {
    func payAmount(_ amount: Decimal)
}

class VisaPaymentMethod: PaymentMethodProtocol {
    func payAmount(_ amount: Decimal) {
        print("visa payment method")
    }
}

class MastercardPaymentMethod: PaymentMethodProtocol {
    func payAmount(_ amount: Decimal) {
        print("mastercard payment method")
    }
}

class AppleWalletPaymentMethod: PaymentMethodProtocol {
    func payAmount(_ amount: Decimal) {
        print("apple wallet payment method")
    }
    
}
