import UIKit
import AVFoundation

class ViewControllerNext: UIViewController {
    
    let backgroundImageView = UIImageView()
    let welcomeLabel        = UILabel()
    let backButton          = UIButton(type: .system)
    var audioPlayer         : AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        prepareSound()
    }
    
    func setupUI() {
        //фон
        if let image = UIImage(named: "forest") {
            backgroundImageView.image = image
        } else {
            backgroundImageView.backgroundColor = .systemGreen
            print("Изображение 'forest' не найдено в Assets")
        }
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(backgroundImageView, at: 0)
        
        //текст
        welcomeLabel.text = "Приятного использования!"
        welcomeLabel.textColor = .white.withAlphaComponent(0.85)
        welcomeLabel.font = .systemFont(ofSize: 34, weight: .bold)
        welcomeLabel.textAlignment = .center
        welcomeLabel.numberOfLines = 0
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeLabel)
        
        //кнопка назад
        backButton.setTitle("ВЕРНУТЬСЯ", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.backgroundColor = .white.withAlphaComponent(0.75)
        backButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        backButton.layer.cornerRadius = 16
        backButton.layer.shadowColor = UIColor.black.cgColor
        backButton.layer.shadowOpacity = 0.35
        backButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        backButton.layer.shadowRadius = 10
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        view.addSubview(backButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            backButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 48),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 260),
            backButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    //настройка звука
    func prepareSound() {
        guard let url = Bundle.main.url(forResource: "click", withExtension: "wav") else {
            print("Файл click.wav не найден")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.volume = 0.7
            audioPlayer?.numberOfLoops = 0
        } catch {
            print("Ошибка загрузки звука \(error)")
        }
    }
    //настройка звука и перехода
    @objc func backButtonTapped() {
        audioPlayer?.currentTime = 0
        audioPlayer?.play()
        self.navigationController?.popViewController(animated: true)
    }
}
