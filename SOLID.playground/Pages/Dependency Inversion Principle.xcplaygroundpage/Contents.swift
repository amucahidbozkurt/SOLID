import UIKit

// Sınıflar arası bağımlılıkların en aza indirgenmesi gerektiğini söyleyen prensiptir. Özellikle alt sınıflarda olan bir değişikliğin üst sınıfları etkilememesi gerektiğini dile getirir.
// Objeleri direkt birbiriyle referans etmektense, bir interface arkasina saklamak gerekir. Yani viewController icerisindeki viewModel degiskenine CartViewModel'i depend etmek yanlis.

// YANLIS
class CarViewModel {
    let make: String = "Porsche"
    let model: String = "911"
}

class CarViewController: UIViewController {
    var viewModel: CarViewModel!
    
    @IBOutlet private var makeLabel: UILabel!
    @IBOutlet private var modelLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeLabel.text = viewModel.make
        makeLabel.text = viewModel.model
    }
}

// Proje buyudu ve ileride ayni degiskenlere sahip class eklemek zorunda kalabiliriz. O yuzden bir protocol olusuturup, ihtiyac halinde bu protocolden uretebiliriz.

// DOGRU
protocol CarViewModelProtocol {
    var make: String { get }
    var model: String { get }
}

class PorscheViewModel: CarViewModelProtocol {
    let make: String = "Porsche"
    let model: String = "911"
}

class OpelViewModel: CarViewModelProtocol {
    var make: String = "Opel"
    var model: String = "Astra"
}

class CarViewController2: UIViewController {
    var viewModel: CarViewModelProtocol!
    
    @IBOutlet private var makeLabel: UILabel!
    @IBOutlet private var modelLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeLabel.text = viewModel.make
        makeLabel.text = viewModel.model
    }
}
