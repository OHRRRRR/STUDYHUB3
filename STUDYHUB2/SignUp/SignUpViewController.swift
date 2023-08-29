//import UIKit
//
//class SignUpViewController: UIViewController {
//    private let emailTextField = UITextField()
//    private let emailTextFielddividerLine = UIView()
//
//    private let codesendLabel = UILabel()
//    private let verificationLabel = UILabel()
//    private let verificationCodeTextField = UITextField()
//    private let verificationCodedividerLine = UIView()
//
//    private let validButton = UIButton(type: .system)
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .black
//
//        emailTextField.addTarget(self, action: #selector(emailTextFieldDidChange), for: .editingChanged)
//
//        // '회원가입' 텍스트
//        let titleLabel = UILabel()
//        titleLabel.text = "회원가입"
//        titleLabel.textColor = .white
//        titleLabel.font = UIFont.boldSystemFont(ofSize: 22) // Set the font size and boldness here
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(titleLabel)
//
//        // '1/4' 텍스트
//        let progressLabel = UILabel()
//        progressLabel.text = "1/4"
//        progressLabel.textColor = .gray
//        progressLabel.font = UIFont.boldSystemFont(ofSize: 20)
//        progressLabel.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(progressLabel)
//
//        // '이메일을 입력해주세요' 텍스트
//        let emailPromptLabel = UILabel()
//        emailPromptLabel.text = "이메일을 입력해주세요"
//        emailPromptLabel.textColor = .white
//        emailPromptLabel.font = UIFont.boldSystemFont(ofSize: 22)
//        emailPromptLabel.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(emailPromptLabel)
//
//        // '이메일' 텍스트
//        let emailLabel = UILabel()
//        emailLabel.text = "이메일"
//        emailLabel.textColor = .white
//        emailLabel.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(emailLabel)
//
//        //graydivide
//        emailTextFielddividerLine.backgroundColor = .gray
//        emailTextFielddividerLine.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(emailTextFielddividerLine)
//
//        // 이메일 입력창
//        emailTextField.placeholder = "이메일을 입력하세요"
//        emailTextField.attributedPlaceholder = NSAttributedString(string: "@inu.ac.kr", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
//        emailTextField.textColor = .white
//        emailTextField.backgroundColor = .black
//        emailTextField.borderStyle = .roundedRect
//        emailTextField.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(emailTextField)
//
//        // '인증' 버튼
//        validButton.setTitle("인증", for: .normal)
//        validButton.setTitleColor(.white, for: .normal)
//        validButton.backgroundColor = UIColor(hexCode: "FF5935")
//        validButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
//        validButton.layer.cornerRadius = 5
//        validButton.translatesAutoresizingMaskIntoConstraints = false
//        validButton.addTarget(self, action: #selector(validButtonTapped), for: .touchUpInside)
//        view.addSubview(validButton)
//
//        // '다음' 버튼
//        let nextButton = UIButton(type: .system)
//        nextButton.setTitle("다음", for: .normal)
//        nextButton.setTitleColor(.white, for: .normal)
//        nextButton.backgroundColor = UIColor(hexCode: "FF5935")
//        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//        nextButton.translatesAutoresizingMaskIntoConstraints = false
//        nextButton.layer.cornerRadius = 10
//        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
//        view.addSubview(nextButton)
//
//        // 오토레이아웃 설정
//        NSLayoutConstraint.activate([
//            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -40),
//            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//            progressLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
//            progressLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -350),
//
//            emailPromptLabel.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 10),
//            emailPromptLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//
//            emailLabel.topAnchor.constraint(equalTo: emailPromptLabel.bottomAnchor, constant: 80),
//            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//
//            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20),
//            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
//            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70), // Adjusted to make space for the '인증' button
//            emailTextField.heightAnchor.constraint(equalToConstant: 30),
//
//            validButton.leadingAnchor.constraint(equalTo: emailTextField.trailingAnchor, constant: 10),
//            validButton.centerYAnchor.constraint(equalTo: emailTextField.centerYAnchor),
//            validButton.widthAnchor.constraint(equalToConstant: 50),
//            validButton.heightAnchor.constraint(equalToConstant: 25),
//
//            // Divider line constraints
//            emailTextFielddividerLine.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            emailTextFielddividerLine.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            emailTextFielddividerLine.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 5),
//            emailTextFielddividerLine.heightAnchor.constraint(equalToConstant: 1),
//
//            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            nextButton.topAnchor.constraint(equalTo: emailTextFielddividerLine.bottomAnchor, constant: 350),
//            nextButton.heightAnchor.constraint(equalToConstant: 55),
//            nextButton.widthAnchor.constraint(equalToConstant: 400)
//        ])
//        setupVerificationUI()
//    }
//    private func setupVerificationUI() {
//        // '인증코드 전송' 텍스트
//        codesendLabel.text = "인증 코드를 메일로 보내드렸어요"
//        codesendLabel.font = UIFont.systemFont(ofSize: 14)
//        codesendLabel.textColor = .gray
//        codesendLabel.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(codesendLabel)
//
//        // '인증코드' 텍스트
//        verificationLabel.text = "인증코드"
//        verificationLabel.textColor = .white
//        verificationLabel.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(verificationLabel)
//
//        // 인증코드 입력창
//        verificationCodeTextField.placeholder = "인증코드를 입력하세요"
//        verificationCodeTextField.attributedPlaceholder = NSAttributedString(string: "인증코드를 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
//        verificationCodeTextField.textColor = .white
//        verificationCodeTextField.backgroundColor = .black
//        verificationCodeTextField.borderStyle = .roundedRect
//        verificationCodeTextField.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(verificationCodeTextField)
//
//        //graydivide
//        verificationCodedividerLine.backgroundColor = .gray
//        verificationCodedividerLine.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(verificationCodedividerLine)
//
//        // Set up the constraints for the verification UI
//        NSLayoutConstraint.activate([
//            // ... (Other constraints)
//            codesendLabel.topAnchor.constraint(equalTo: emailTextFielddividerLine.bottomAnchor, constant: 5),  // Adjusted constant value
//            codesendLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//
//            verificationLabel.topAnchor.constraint(equalTo: emailTextFielddividerLine.bottomAnchor, constant: 50),
//            verificationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//
//            verificationCodeTextField.topAnchor.constraint(equalTo: verificationLabel.bottomAnchor, constant: 20),
//            verificationCodeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//            verificationCodeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
//            verificationCodeTextField.heightAnchor.constraint(equalToConstant: 30),
//
//            // Divider line constraints
//            verificationCodedividerLine.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            verificationCodedividerLine.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            verificationCodedividerLine.topAnchor.constraint(equalTo: verificationCodeTextField.bottomAnchor, constant: 5),
//            verificationCodedividerLine.heightAnchor.constraint(equalToConstant: 1),
//
//            // ... (Other constraints)
//        ])
//
//        // Hide verification UI initially
//        codesendLabel.isHidden = true
//        verificationLabel.isHidden = true
//        verificationCodeTextField.isHidden = true
//        verificationCodedividerLine.isHidden = true
//    }
//
//    @objc func validButtonTapped() {
//        if let email = emailTextField.text {
//            let isValidEmail = email.hasSuffix("@inu.ac.kr")
//
//            // Check if the entered email follows the '@inu.ac.kr' format
//            emailTextFielddividerLine.backgroundColor = isValidEmail ? .green : .red
//
//            if !isValidEmail {
//                // Show an alert if email format is invalid
//                let alertController = UIAlertController(title: "경고", message: "잘못된 주소입니다. 다시 입력해주세요", preferredStyle: .alert)
//                let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
//                alertController.addAction(okAction)
//                present(alertController, animated: true, completion: nil)
//            }
//            else {
//                // Create a URL
//                guard let url = URL(string: "https://study-hub.site:443/api/email") else {
//                    return
//                }
//
//                // Prepare JSON data
//                let jsonData: [String: Any] = ["email": email]
//                guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonData) else {
//                    return
//                }
//
//                // Configure the request
//                var request = URLRequest(url: url)
//                request.httpMethod = "POST"
//                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//                request.httpBody = jsonData
//
//                // Create a URLSessionDataTask
//                let task = URLSession.shared.dataTask(with: request) { data, response, error in
//                    if let error = error {
//                        print("Error: \(error)")
//                        return
//                    }
//
//                    // Handle the response if needed
//                    if let data = data {
//                        if let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                            print("Response JSON: \(responseJSON)")
//                        }
//                    }
//                }
//
//                // Start the data task
//                task.resume()
//
//                // Show verification UI when validButton is tapped
//                codesendLabel.isHidden = false
//                verificationLabel.isHidden = false
//                verificationCodeTextField.isHidden = false
//                verificationCodedividerLine.isHidden = false
//            }
//        }
//    }
//
//    // Action for emailTextField editingChanged event
//    @objc func emailTextFieldDidChange() {
//        if let email = emailTextField.text {
//            // Check if the entered email follows the '@inu.ac.kr' format
//            let isValidEmail = email.hasSuffix("@inu.ac.kr")
//
//            // Change the color of the emailTextFielddividerLine based on the validation result
//            emailTextFielddividerLine.backgroundColor = isValidEmail ? .green : .red
//
//        }
//    }
//
//
//    @objc func nextButtonTapped() {
//        guard let email = emailTextField.text, !email.isEmpty else {
//            // Change the color of emailTextFielddividerLine to red
//            emailTextFielddividerLine.backgroundColor = .red
//
//            let alert = UIAlertController(title: "경고",
//                                          message: "이메일을 입력해주세요.",
//                                          preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
//            present(alert, animated: true, completion: nil)
//
//            return
//        }
//
//        guard let authCode = verificationCodeTextField.text, !authCode.isEmpty else {
//            // Change the color of verificationCodedividerLine to red
//            verificationCodedividerLine.backgroundColor = .red
//
//            let alert = UIAlertController(title: "경고",
//                                          message: "인증번호를 입력해주세요.",
//                                          preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
//            present(alert, animated: true, completion: nil)
//
//            return
//        }
//
//        // Create a URL for verification
//        guard let verificationURL = URL(string: "https://study-hub.site:443/api/email/valid") else {
//            return
//        }
//
//        // Prepare JSON data for verification
//        let verificationJSONData: [String: Any] = ["authCode": authCode, "email": email]
//        guard let verificationData = try? JSONSerialization.data(withJSONObject: verificationJSONData) else {
//            return
//        }
//
//        // Configure the verification request
//        var verificationRequest = URLRequest(url: verificationURL)
//        verificationRequest.httpMethod = "POST"
//        verificationRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        verificationRequest.httpBody = verificationData
//
//        // Create a URLSessionDataTask for verification
//        let verificationTask = URLSession.shared.dataTask(with: verificationRequest) { data, response, error in
//            if let error = error {
//                print("Error: \(error)")
//                return
//            }
//
//            // Handle the verification response
//            if let data = data {
//                if let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
//                   let validResult = responseJSON["validResult"] as? Bool {
//                    DispatchQueue.main.async {
//                        if validResult {
//                            // Change the color of verificationCodedividerLine to green
//                            self.verificationCodedividerLine.backgroundColor = .green
//
//                            let passwordViewController = PasswordViewController()
//                            self.navigationController?.pushViewController(passwordViewController, animated: true)
//                        } else {
//                            // Change the color of verificationCodedividerLine to red
//                            self.verificationCodedividerLine.backgroundColor = .red
//
//                            let alert = UIAlertController(title: "경고",
//                                                          message: "인증번호가 맞지 않습니다.",
//                                                          preferredStyle: .alert)
//                            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
//                            self.present(alert, animated: true, completion: nil)
//                        }
//                    }
//                }
//            }
//        }
//
//        // Start the verification data task
//        verificationTask.resume()
//    }
//}

import UIKit

class SignUpViewController: UIViewController {
    private let emailTextField = UITextField()
    private let emailTextFielddividerLine = UIView()
    
    private let codesendLabel = UILabel()
    private let verificationLabel = UILabel()
    private let verificationCodeTextField = UITextField()
    private let verificationCodedividerLine = UIView()
    
    private let validButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        emailTextField.addTarget(self, action: #selector(emailTextFieldDidChange), for: .editingChanged)
        
        // '회원가입' 텍스트
        let titleLabel = UILabel()
        titleLabel.text = "회원가입"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22) // Set the font size and boldness here
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        // '1/4' 텍스트
        let progressLabel = UILabel()
        progressLabel.text = "1/4"
        progressLabel.textColor = .gray
        progressLabel.font = UIFont.boldSystemFont(ofSize: 20)
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progressLabel)
        
        // '이메일을 입력해주세요' 텍스트
        let emailPromptLabel = UILabel()
        emailPromptLabel.text = "이메일을 입력해주세요"
        emailPromptLabel.textColor = .white
        emailPromptLabel.font = UIFont.boldSystemFont(ofSize: 22)
        emailPromptLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailPromptLabel)
       
        // '이메일' 텍스트
        let emailLabel = UILabel()
        emailLabel.text = "이메일"
        emailLabel.textColor = .white
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailLabel)
        
        //graydivide
        emailTextFielddividerLine.backgroundColor = .gray
        emailTextFielddividerLine.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailTextFielddividerLine)
        
        // 이메일 입력창
        emailTextField.placeholder = "이메일을 입력하세요"
        emailTextField.attributedPlaceholder = NSAttributedString(string: "@inu.ac.kr", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        emailTextField.textColor = .white
        emailTextField.backgroundColor = .black
        emailTextField.borderStyle = .roundedRect
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailTextField)
        
        // '인증' 버튼
        validButton.setTitle("인증", for: .normal)
        validButton.setTitleColor(.white, for: .normal)
        validButton.backgroundColor = UIColor(hexCode: "FF5935")
        validButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        validButton.layer.cornerRadius = 5
        validButton.translatesAutoresizingMaskIntoConstraints = false
        validButton.addTarget(self, action: #selector(validButtonTapped), for: .touchUpInside)
        view.addSubview(validButton)
        
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
            
            emailPromptLabel.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 10),
            emailPromptLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            emailLabel.topAnchor.constraint(equalTo: emailPromptLabel.bottomAnchor, constant: 80),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70), // Adjusted to make space for the '인증' button
            emailTextField.heightAnchor.constraint(equalToConstant: 30),
            
            validButton.leadingAnchor.constraint(equalTo: emailTextField.trailingAnchor, constant: 10),
            validButton.centerYAnchor.constraint(equalTo: emailTextField.centerYAnchor),
            validButton.widthAnchor.constraint(equalToConstant: 50),
            validButton.heightAnchor.constraint(equalToConstant: 25),
            
            // Divider line constraints
            emailTextFielddividerLine.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emailTextFielddividerLine.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emailTextFielddividerLine.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 5),
            emailTextFielddividerLine.heightAnchor.constraint(equalToConstant: 1),
            
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.topAnchor.constraint(equalTo: emailTextFielddividerLine.bottomAnchor, constant: 350),
            nextButton.heightAnchor.constraint(equalToConstant: 55),
            nextButton.widthAnchor.constraint(equalToConstant: 400)
        ])
        setupVerificationUI()
    }
    private func setupVerificationUI() {
        // '인증코드 전송' 텍스트
        codesendLabel.text = "인증 코드를 메일로 보내드렸어요"
        codesendLabel.font = UIFont.systemFont(ofSize: 14)
        codesendLabel.textColor = .gray
        codesendLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(codesendLabel)
        
        // '인증코드' 텍스트
        verificationLabel.text = "인증코드"
        verificationLabel.textColor = .white
        verificationLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(verificationLabel)
        
        // 인증코드 입력창
        verificationCodeTextField.placeholder = "인증코드를 입력하세요"
        verificationCodeTextField.attributedPlaceholder = NSAttributedString(string: "인증코드를 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        verificationCodeTextField.textColor = .white
        verificationCodeTextField.backgroundColor = .black
        verificationCodeTextField.borderStyle = .roundedRect
        verificationCodeTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(verificationCodeTextField)
        
        //graydivide
        verificationCodedividerLine.backgroundColor = .gray
        verificationCodedividerLine.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(verificationCodedividerLine)
        
        // Set up the constraints for the verification UI
        NSLayoutConstraint.activate([
            // ... (Other constraints)
            codesendLabel.topAnchor.constraint(equalTo: emailTextFielddividerLine.bottomAnchor, constant: 5),  // Adjusted constant value
            codesendLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            verificationLabel.topAnchor.constraint(equalTo: emailTextFielddividerLine.bottomAnchor, constant: 50),
            verificationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            verificationCodeTextField.topAnchor.constraint(equalTo: verificationLabel.bottomAnchor, constant: 20),
            verificationCodeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            verificationCodeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            verificationCodeTextField.heightAnchor.constraint(equalToConstant: 30),
            
            // Divider line constraints
            verificationCodedividerLine.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            verificationCodedividerLine.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            verificationCodedividerLine.topAnchor.constraint(equalTo: verificationCodeTextField.bottomAnchor, constant: 5),
            verificationCodedividerLine.heightAnchor.constraint(equalToConstant: 1),
            
            // ... (Other constraints)
        ])
        
        // Hide verification UI initially
        codesendLabel.isHidden = true
        verificationLabel.isHidden = true
        verificationCodeTextField.isHidden = true
        verificationCodedividerLine.isHidden = true
    }
    
    @objc func validButtonTapped() {
        if let email = emailTextField.text {
            let isValidEmail = email.hasSuffix("@inu.ac.kr")
            
            // Check if the entered email follows the '@inu.ac.kr' format
            emailTextFielddividerLine.backgroundColor = isValidEmail ? .green : .red
            
            if !isValidEmail {
                // Show an alert if email format is invalid
                let alertController = UIAlertController(title: "경고", message: "잘못된 주소입니다. 다시 입력해주세요", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
                alertController.addAction(okAction)
                present(alertController, animated: true, completion: nil)
            }
            else{
                // Show verification UI when validButton is tapped
                codesendLabel.isHidden = false
                verificationLabel.isHidden = false
                verificationCodeTextField.isHidden = false
                verificationCodedividerLine.isHidden = false
            }
    
        }
        
    }
    
    // Action for emailTextField editingChanged event
    @objc func emailTextFieldDidChange() {
        if let email = emailTextField.text {
            // Check if the entered email follows the '@inu.ac.kr' format
            let isValidEmail = email.hasSuffix("@inu.ac.kr")
            
            // Change the color of the emailTextFielddividerLine based on the validation result
            emailTextFielddividerLine.backgroundColor = isValidEmail ? .green : .red
        
        }
    }
   
    
    @objc func nextButtonTapped() {
        guard let email = emailTextField.text, !email.isEmpty else {
            // Change the color of passwordTextFielddividerLine to red
            emailTextFielddividerLine.backgroundColor = .red
            
            let alert = UIAlertController(title: "경고",
                                          message: "이메일을 입력해주세요.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            
            
            return
        }
        let passwordViewController = PasswordViewController()

              // Use the navigation controller to push the PasswordViewController onto the navigation stack
              navigationController?.pushViewController(passwordViewController, animated: true)
          }
}
