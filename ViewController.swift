import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // кнопка
    private var playButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("воспроизвести звук", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 12
        btn.addTarget(self, action: #selector(playSound), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //переменная для хранения плера
    private var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        view.addSubview(playButton)
        
        NSLayoutConstraint.activate([
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            playButton.widthAnchor.constraint(equalToConstant: 220),
            playButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc private func playSound() {
        //пытаемся получить путь к файлу "a.wav" из основного
        guard let soundURL = Bundle.main.url(forResource: "a", withExtension: "wav") else {
            print("файл a.wav не найден в проекте")
            return
        }
        
        do {
            //создаём плеер
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            
            //настройка громкость
            audioPlayer?.volume = 1.0
            audioPlayer?.numberOfLoops = 0   // 0 = один раз
                                             //  -1 = бесконечно
            //
            audioPlayer?.play()
            
            print("воспроизведение запущено")
            
        } catch {
            print("ошибка воспроизведения:", error.localizedDescription)
        }
    }
}
