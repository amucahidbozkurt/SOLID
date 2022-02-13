//: [Previous](@previous)

import Foundation

// Tasarladigimiz modul, class, fonksiyon vs. tek bir ise odaklanmalidir.
// Degisim tek bir sebepten kaynaklanmalidir.

// YANLIS
struct Developer {
    let name: String
    let salary: Decimal
    private let taxPercentage: Decimal
    
    func calculateTax() -> Decimal {
        return salary * taxPercentage
    }
}

// Genisletilebilir degil yani burada yeni meslek eklemek istesek, bir sekilde duplicate edecegiz ya da vergi orani degisirse. tacPercentage, Developer struct altinda olmasi mantikli degil, cunku ortak noktalari yok.

// DOGRU
struct Developer2 {
    let name: String
    let salary: Decimal
}

// Calculate fonksiyonunu ayri bir class'a alarak isleme baslayalim. Artik tek bir islem yapiyor. Yeni bir meslek grubu ekledigimiz zaman ayni fonksiyonu kullanabilecegiz.

class TaxCalculator {
    private let taxPercentage: Decimal
    
    init(taxPercentage: Decimal) {
        self.taxPercentage = taxPercentage
    }
    
    func calculateTax(forSalary salary: Decimal) -> Decimal {
        return salary * taxPercentage
    }
}

let counter = TaxCalculator(taxPercentage: 10)
let result = counter.calculateTax(forSalary: 2)
print(result)
