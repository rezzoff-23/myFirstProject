import UIKit

class ViewController: UIViewController {
    
    //создание кнопки:
    let myLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //создание кнопки:
        let myButton = UIButton(type: .system)
        
        //настройка метки
        myLabel.text = "День"
        myLabel.frame = CGRect(x: 50, y: 100, width: 200, height: 50)
        view.addSubview(myLabel)
        
        //настройка кнопки:
        myButton.setTitleColor(.red, for: .normal)
        myButton.frame = CGRect(x: 50, y: 200, width: 200, height: 50)
        myButton.setTitle("TAP", for: .normal)
        
        view.addSubview(myButton)
        myButton.addTarget(self, action: #selector(buttonTappe), for: .touchUpInside)
    }
    
    @objc func buttonTappe() {
        if myLabel.text == "День" {
            myLabel.text = "Ночь"
            myLabel.textColor = .white
            view.backgroundColor = .black
        } else {
            myLabel.text = "День"
            myLabel.textColor = .black
            view.backgroundColor = .white
        }
        print("tap tap tap")
    }

}
