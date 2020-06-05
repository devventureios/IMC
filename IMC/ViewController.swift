import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var viResult: UIView!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var ivResult: UIImageView!
    
    //var imc: Double = 0
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func calculate(_ sender: Any?) {
        let numberFormatter = NumberFormatter()
        if let weight = numberFormatter.number(from: tfWeight.text!)?.doubleValue,
           let height = numberFormatter.number(from: tfHeight.text!)?.doubleValue {
           let imc = IMCCalculator(weight: weight, height: height)
            showResults(for: imc)
        } else {
            showError()
        }
    }
    
    func showError() {
        let alert = UIAlertController(title: "Erro", message: "Você precisa preencher os valores com números corretos", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func showResults(for imc: IMCCalculator) {
        lbResult.text = imc.result
        ivResult.image = UIImage(named: imc.imageName)
        viResult.isHidden = false
        view.endEditing(true)
    }

}

