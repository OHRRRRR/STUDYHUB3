import UIKit

class CompleteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        // '회원가입' 텍스트
        let titleLabel = UILabel()
        titleLabel.text = "회원가입"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22) // Set the font size and boldness here
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        // Centered Image
        let imageView = UIImageView(image: UIImage(named: "Image 1"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)

        // '가입을 축하드립니다!' Label
        let congratsLabel = UILabel()
        congratsLabel.text = "가입을 축하드립니다!"
        congratsLabel.textColor = .white
        congratsLabel.font = UIFont.boldSystemFont(ofSize: 25)
        congratsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(congratsLabel)

        // '지금 바로 스터디 팀원을 모집하여' Label
        let recruitLabel = UILabel()
        recruitLabel.text = "지금 바로 스터디 팀원을 모집하여"
        recruitLabel.textColor = .gray
        recruitLabel.font = UIFont.systemFont(ofSize: 18)
        recruitLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(recruitLabel)

        // '함께 목표를 달성해 보세요!' Label
        let goalLabel = UILabel()
        goalLabel.text = "함께 목표를 달성해 보세요!"
        goalLabel.textColor = .gray
        goalLabel.font = UIFont.systemFont(ofSize: 18)
        goalLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(goalLabel)

        // '시작하기' Button
        let startButton = UIButton(type: .system)
        startButton.setTitle("시작하기", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.backgroundColor = UIColor(hexCode: "FF5935")
        startButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        startButton.layer.cornerRadius = 10
        view.addSubview(startButton)

        // Setup Constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -40),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -110), // Adjusted centerYAnchor constant

            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant: 300),

            congratsLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            congratsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            recruitLabel.topAnchor.constraint(equalTo: congratsLabel.bottomAnchor, constant: 20),
            recruitLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            goalLabel.topAnchor.constraint(equalTo: recruitLabel.bottomAnchor, constant: 5),
            goalLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            startButton.heightAnchor.constraint(equalToConstant: 60),
            startButton.widthAnchor.constraint(equalToConstant: 400)
        ])
        
        
        // '축하' 글자 색상 변경
        let attributedText = NSMutableAttributedString(string: "가입을 축하드립니다!")
        attributedText.addAttribute(.foregroundColor, value: UIColor(hexCode: "FF5935"), range: NSRange(location: 4, length: 2))
        congratsLabel.attributedText = attributedText

    }
    @objc func startButtonTapped() {
        let ViewController = ViewController()
        
        // Create a UINavigationController with HomeViewController as the root view controller
        let navigationController = UINavigationController(rootViewController: ViewController)
        navigationController.modalPresentationStyle = .fullScreen
        
        // Present the UINavigationController modally
        present(navigationController, animated: true, completion: nil)
    }
}
