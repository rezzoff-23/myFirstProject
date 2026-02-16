import UIKit
import AudioToolbox

class ViewController: UIViewController {
    let myImageView = UIImageView()
    let myButton = UIButton(type: .system)
    let a = 1000
    let b = 1001

    override func viewDidLoad() {
        super.viewDidLoad()

        //настройка иконки
        
        myImageView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        myImageView.contentMode = .scaleAspectFit // чтобы иконка не растягивалась
        myImageView.image = UIImage(systemName: "heart.fill") // начальное состояние
        myImageView.tintColor = .red // сердц
        myImageView.center = view.center
        
        view.addSubview(myImageView)
        
        
        myButton.frame = CGRect(x: 110, y: 110, width: 200, height: 50)
        myButton.setTitle("", for: .normal)
        myButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        myButton.setTitleColor(.black, for: .normal)
        myButton.center = view.center
        view.addSubview(myButton)
        
        
    }

    @objc func buttonTapped() {
        if myImageView.tintColor == .black   {
            // переключаем на ночь
            AudioServicesPlaySystemSound(SystemSoundID(a))
            myButton.setTitle("", for: .normal)
            //view.backgroundColor = .white
            myButton.setTitleColor(.black, for: .normal)
            myImageView.image = UIImage(systemName: "heart.fill")
            myImageView.tintColor = .red
            
        } else {
        
            //view.backgroundColor = .black
            AudioServicesPlaySystemSound(SystemSoundID(b))
            myButton.setTitle("", for: .normal)
            myButton.setTitleColor(.red, for: .normal)
            myImageView.image = UIImage(systemName: "heart.slash.fill")
            myImageView.tintColor = .black
        }
    }
}
