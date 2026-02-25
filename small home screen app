import UIKit
import AVFoundation

class ViewControllerPrime: UIViewController {
    
    let backgroundImageView = UIImageView()
    let welcomeLabel        = UILabel()
    let loginButton         = UIButton(type: .system)
    var audioPlayer         : AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        setupConstraints()
        prepareSound()
    }
    
    func setupUI() {
        // фон
        if let image = UIImage(named: "nature") {
            backgroundImageView.image = image
        } else {
            backgroundImageView.backgroundColor = .systemRed
            print("Изображение 'nature' не найдено в Assets")
        }
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(backgroundImageView, at: 0)
        
        welcomeLabel.text = "Добро пожаловать!"
        welcomeLabel.textColor = .white.withAlphaComponent(0.85)
        welcomeLabel.font = .systemFont(ofSize: 34, weight: .bold)
        welcomeLabel.textAlignment = .center
        welcomeLabel.numberOfLines = 0
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeLabel)
        
        //rнопка
        loginButton.setTitle("ВОЙТИ", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.backgroundColor = .white.withAlphaComponent(0.75)
        loginButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        loginButton.layer.cornerRadius = 16
        loginButton.layer.shadowColor = UIColor.black.cgColor
        loginButton.layer.shadowOpacity = 0.35
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        loginButton.layer.shadowRadius = 10
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(loginButton)
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
            
            loginButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 48),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 260),
            loginButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
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
    
    @objc func buttonTapped() {
        audioPlayer?.currentTime = 0
        audioPlayer?.play()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.18) { [weak self] in
            let nextVC = ViewControllerNext()
            self?.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}
