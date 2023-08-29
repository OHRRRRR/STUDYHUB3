
import UIKit

class NicknameViewController: UIViewController {
    
    private let femaleButton = UIButton(type: .system)
    private let maleButton = UIButton(type: .system)
    
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
        
        // '3/4' 텍스트
        let progressLabel = UILabel()
        progressLabel.text = "3/4"
        progressLabel.textColor = .gray
        progressLabel.font = UIFont.boldSystemFont(ofSize: 20)
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progressLabel)
        
        // '닉네임을 설정해주세요' 텍스트
        let nicknamePromptLabel = UILabel()
        nicknamePromptLabel.text = "스터디 참여에 필요한 정보를 알려주세요"
        nicknamePromptLabel.textColor = .white
        nicknamePromptLabel.font = UIFont.boldSystemFont(ofSize: 22)
        nicknamePromptLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nicknamePromptLabel)
        
        // '성별은 추후에 수정이 불가해요' 텍스트
        let genderfixLabel = UILabel()
        genderfixLabel.text = "성별은 추후에 수정이 불가해요"
        genderfixLabel.textColor = .gray
        genderfixLabel.font = UIFont.systemFont(ofSize: 13)
        genderfixLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(genderfixLabel)
       
        // '닉네임' 텍스트
        let nicknameLabel = UILabel()
        nicknameLabel.text = "닉네임"
        nicknameLabel.textColor = .white
        nicknameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nicknameLabel)
        
        //graydivide
        let nicknameTextFielddividerLine = UIView()
        nicknameTextFielddividerLine.backgroundColor = .gray
        nicknameTextFielddividerLine.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nicknameTextFielddividerLine)
        
        // 닉네임 입력창
        let nicknameTextField = UITextField()
        nicknameTextField.placeholder = "닉네임을 입력하세요"
        nicknameTextField.attributedPlaceholder = NSAttributedString(string: "닉네임을 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        nicknameTextField.textColor = .white
        nicknameTextField.backgroundColor = .black
        nicknameTextField.borderStyle = .roundedRect
        nicknameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nicknameTextField)
        
        let genderLabel = UILabel()
        genderLabel.text = "성별"
        genderLabel.textColor = .white
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(genderLabel)

        femaleButton.setTitle("여자", for: .normal)
        femaleButton.setTitleColor(UIColor(hexCode: "#8F8F8F"), for: .normal)
        femaleButton.backgroundColor = UIColor(hexCode: "#363636")
        femaleButton.translatesAutoresizingMaskIntoConstraints = false
        femaleButton.layer.cornerRadius = 5
        femaleButton.layer.borderWidth = 1
        femaleButton.layer.borderColor = UIColor(hexCode: "#636363").cgColor
        femaleButton.addTarget(self, action: #selector(genderButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(femaleButton)

        maleButton.setTitle("남자", for: .normal)
        maleButton.setTitleColor(UIColor(hexCode: "#8F8F8F"), for: .normal)
        maleButton.backgroundColor = UIColor(hexCode: "#363636")
        maleButton.translatesAutoresizingMaskIntoConstraints = false
        maleButton.layer.cornerRadius = 5
        maleButton.layer.borderWidth = 1
        maleButton.layer.borderColor = UIColor(hexCode: "#636363").cgColor
        maleButton.addTarget(self, action: #selector(genderButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(maleButton)
        
        
        // '다음' 버튼
        let nextButton = UIButton(type: .system)
        nextButton.setTitle("다음", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.backgroundColor = UIColor(hexCode: "FF5935")
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.layer.cornerRadius = 10
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        view.addSubview(nextButton)
        
        // 오토레이아웃 설정
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -40),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            progressLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            progressLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -350),
            
            nicknamePromptLabel.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 10),
            nicknamePromptLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            genderfixLabel.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 40),
            genderfixLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            nicknameLabel.topAnchor.constraint(equalTo: nicknamePromptLabel.bottomAnchor, constant: 80),
            nicknameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            nicknameTextField.topAnchor.constraint(equalTo: nicknameLabel.bottomAnchor, constant: 20),
            nicknameTextField.leadingAnchor.constraint(equalTo: nicknameLabel.leadingAnchor),
            nicknameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70), // Adjusted to make space for the '인증' button
            nicknameTextField.heightAnchor.constraint(equalToConstant: 30),
            
            
            // Divider line constraints
            nicknameTextFielddividerLine.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            nicknameTextFielddividerLine.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nicknameTextFielddividerLine.topAnchor.constraint(equalTo: nicknameTextField.bottomAnchor, constant: 5),
            nicknameTextFielddividerLine.heightAnchor.constraint(equalToConstant: 1),
            
            genderLabel.topAnchor.constraint(equalTo: nicknameTextFielddividerLine.bottomAnchor, constant: 40),
            genderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            femaleButton.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 20),
            femaleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            femaleButton.widthAnchor.constraint(equalToConstant: 180),
            femaleButton.heightAnchor.constraint(equalToConstant: 45),
            
            maleButton.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 20),
            maleButton.leadingAnchor.constraint(equalTo: femaleButton.trailingAnchor, constant: 5),
            maleButton.widthAnchor.constraint(equalToConstant: 180),
            maleButton.heightAnchor.constraint(equalToConstant: 45),
            
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.topAnchor.constraint(equalTo: nicknameTextFielddividerLine.bottomAnchor, constant: 350),
            nextButton.heightAnchor.constraint(equalToConstant: 55),
            nextButton.widthAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    @objc func genderButtonTapped(_ sender: UIButton) {
        // Reset button colors
        femaleButton.backgroundColor = UIColor(hexCode: "#363636")
        femaleButton.setTitleColor(UIColor(hexCode: "#8F8F8F"), for: .normal)
        femaleButton.layer.borderColor = UIColor(hexCode: "#636363").cgColor
        maleButton.backgroundColor = UIColor(hexCode: "#363636")
        maleButton.setTitleColor(UIColor(hexCode: "#8F8F8F"), for: .normal)
        maleButton.layer.borderColor = UIColor(hexCode: "#636363").cgColor
        
        
        // Change the color of the tapped button
        sender.backgroundColor = UIColor(hexCode: "#6F2B1C")
        sender.setTitleColor(UIColor(hexCode: "#FFD7CC"), for: .normal)
        sender.layer.borderColor = UIColor(hexCode: "#FF5530").cgColor
    }
   
 
    @objc func nextButtonTapped() {
        let departmentViewController = DepartmentViewController()

              // Use the navigation controller to push the PasswordViewController onto the navigation stack
              navigationController?.pushViewController(departmentViewController, animated: true)
          
          }
}






