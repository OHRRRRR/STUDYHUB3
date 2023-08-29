//
//  ViewController.swift
//  STUDYHUB2
//
//  Created by HYERYEONG on 2023/08/05.
//

import UIKit

class ViewController: UIViewController {

    private let emailTextField = UITextField()
    private let emailTextFielddividerLine = UIView()
    private let passwordTextField = UITextField()
    private let passwordTextFielddividerLine = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        emailTextField.addTarget(self, action: #selector(emailTextFieldDidChange), for: .editingChanged)

        // '지금 스터디 허브에서' 텍스트
        let titleLabel = UILabel()
        titleLabel.text = "지금 스터디 허브에서"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24) // Set the font size and boldness here
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)

        // '나의 팀원을 만나보세요' 텍스트
        let subtitleLabel = UILabel()
        subtitleLabel.text = "나의 팀원을 만나보세요"
        subtitleLabel.textColor = .white
        subtitleLabel.font = UIFont.boldSystemFont(ofSize: 24) // Set the font size and boldness here
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subtitleLabel)

        // '이메일' 텍스트
        let emailLabel = UILabel()
        emailLabel.text = "이메일"
        emailLabel.textColor = .white
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailLabel)


        // 이메일 입력창
        emailTextField.placeholder = "이메일을 입력하세요"
        emailTextField.attributedPlaceholder = NSAttributedString(string: "이메일 주소를 입력해주세요 (@inu.ac.kr)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        emailTextField.textColor = .white
        emailTextField.backgroundColor = .black
        emailTextField.borderStyle = .roundedRect
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailTextField)

        emailTextFielddividerLine.backgroundColor = .gray
        emailTextFielddividerLine.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailTextFielddividerLine)


        // '비밀번호' 텍스트
        let passwordLabel = UILabel()
        passwordLabel.text = "비밀번호"
        passwordLabel.textColor = .white
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordLabel)

        // 비밀번호 입력창
        passwordTextField.placeholder = "비밀번호를 입력하세요"
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        passwordTextField.textColor = .white
        passwordTextField.backgroundColor = .black
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange), for: .editingChanged)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)

        //graydivide
        passwordTextFielddividerLine.backgroundColor = .gray
        passwordTextFielddividerLine.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextFielddividerLine)


        // '로그인하기' 버튼
        let loginButton = UIButton(type: .system)
        loginButton.setTitle("로그인하기", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = UIColor(hexCode: "FF5935")
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        loginButton.layer.cornerRadius = 10
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        view.addSubview(loginButton)

        // '비밀번호가 기억나지 않으시나요?' 버튼
        let forgotPasswordButton = UIButton(type: .system)
        forgotPasswordButton.setTitle("비밀번호가 기억나지 않으시나요?", for: .normal)
        forgotPasswordButton.setTitleColor(.gray, for: .normal)
        forgotPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(forgotPasswordButton)

        // '둘러보기' 버튼
        let exploreButton = UIButton(type: .system)
        exploreButton.setTitle("둘러보기", for: .normal)
        exploreButton.setTitleColor(.white, for: .normal)
        exploreButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        exploreButton.translatesAutoresizingMaskIntoConstraints = false
        exploreButton.addTarget(self, action: #selector(exploreButtonTapped), for: .touchUpInside) // Add the action for the button
        view.addSubview(exploreButton)


        // '회원가입' 버튼
        let signUpButton = UIButton(type: .system)
        signUpButton.setTitle("회원가입", for: .normal)
        signUpButton.setTitleColor(UIColor(hexCode: "FF5935"), for: .normal)
        signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside) // Add the action for the button
        view.addSubview(signUpButton)

        // 오토레이아웃 설정
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), // Align to the left
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),

            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), // Align to the left
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),

            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            emailLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 90),

            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5),
            emailTextField.heightAnchor.constraint(equalToConstant: 30),

            // Divider line constraints
            emailTextFielddividerLine.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emailTextFielddividerLine.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emailTextFielddividerLine.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 5),
            emailTextFielddividerLine.heightAnchor.constraint(equalToConstant: 1),

            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordLabel.topAnchor.constraint(equalTo: emailTextFielddividerLine.bottomAnchor, constant: 20),

            passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            passwordTextField.heightAnchor.constraint(equalToConstant: 30),

            // Divider line constraints
            passwordTextFielddividerLine.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            passwordTextFielddividerLine.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            passwordTextFielddividerLine.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 5),
            passwordTextFielddividerLine.heightAnchor.constraint(equalToConstant: 1),

            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextFielddividerLine.bottomAnchor, constant: 30),
            loginButton.heightAnchor.constraint(equalToConstant: 55),
            loginButton.widthAnchor.constraint(equalToConstant: 400),

            forgotPasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            forgotPasswordButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),

            exploreButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            exploreButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            signUpButton.leadingAnchor.constraint(equalTo: exploreButton.trailingAnchor, constant: 50),
            signUpButton.centerYAnchor.constraint(equalTo: exploreButton.centerYAnchor)
        ])

        // '팀원' 글자 색상 변경
        let attributedText = NSMutableAttributedString(string: "나의 팀원을 만나보세요")
        attributedText.addAttribute(.foregroundColor, value: UIColor(hexCode: "FF5935"), range: NSRange(location: 3, length: 2))
        subtitleLabel.attributedText = attributedText
    }

    func validatePassword(password: String) -> Bool {
        let passwordRegex = "(?=.*[a-zA-Z0-9])(?=.*[^a-zA-Z0-9]).{10,}"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }

    @objc func loginButtonTapped() {
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
        guard let password = passwordTextField.text, !password.isEmpty else {
            // Change the color of passwordTextFielddividerLine to red
             passwordTextFielddividerLine.backgroundColor = .red

            let alert = UIAlertController(title: "경고",
                                          message: "비밀번호를 입력해주세요.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }

        if let email = emailTextField.text {
            let isValidEmail = email.hasSuffix("@inu.ac.kr")

            // Check if the entered email follows the '@inu.ac.kr' format
            emailTextFielddividerLine.backgroundColor = isValidEmail ? .green : .red

            if !isValidEmail {
                // Show an alert if email format is invalid
                let alertController = UIAlertController(title: "경고", message: "잘못된 이메일 주소입니다. 다시 입력해주세요", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
                alertController.addAction(okAction)
                present(alertController, animated: true, completion: nil)
            }
            else{
                emailTextFielddividerLine.backgroundColor = .green
            }



        }

        if !validatePassword(password: password) {

            let alert = UIAlertController(title: "경고",
                                          message: "비밀번호는 10자리 이상이거나 특수문자를 포함해야 합니다.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)

            // Change the color of passwordTextFielddividerLine to red
            passwordTextFielddividerLine.backgroundColor = .red

            return
        }

        else {
                passwordTextFielddividerLine.backgroundColor = .green

            }

        let homeViewController = HomeViewController()


        // Construct the URL for the login API
        guard let loginURL = URL(string: "http://studyhub-beanstalk-env.eba-gmc8emac.ap-northeast-2.elasticbeanstalk.com:80/api/users/login") else {
            // Handle invalid URL case
            return
        }

        // Create a dictionary to represent the login data
        let loginData: [String: Any] = [
            "email": emailTextField.text ?? "",
            "password": passwordTextField.text ?? ""
        ]

        // Convert the loginData dictionary to JSON data
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: loginData, options: [])

            // Create a URLRequest with the login URL
            var request = URLRequest(url: loginURL)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData

            // Create a URLSessionDataTask to perform the request
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                // Handle the response
                if let data = data {
                    do {
                        // Parse the JSON response
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                            // Process the JSON data here
                            print(json)
                        }
                    } catch {
                        // Handle JSON parsing error
                        print("JSON Parsing Error: \(error)")
                    }
                } else if let error = error {
                    // Handle URLSession error
                    print("URLSession Error: \(error)")
                }
            }

            // Start the URLSessionDataTask
            task.resume()
        } catch {
            // Handle JSON serialization error
            print("JSON Serialization Error: \(error)")
        }

        // Create a UINavigationController with HomeViewController as the root view controller
        let navigationController = UINavigationController(rootViewController: homeViewController)
        navigationController.modalPresentationStyle = .fullScreen

        // Present the UINavigationController modally
        present(navigationController, animated: true, completion: nil)
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

    // Action for passwordTextField editingChanged event
    @objc func passwordTextFieldDidChange() {
        if let password = passwordTextField.text {
            // Check if the entered password meets the required criteria
            let isValidPassword = validatePassword(password: password)

            // Change the color of the passwordTextFielddividerLine based on the validation result
            passwordTextFielddividerLine.backgroundColor = isValidPassword ? .green : .red
        }
    }
    
    @objc func exploreButtonTapped() {
        let homeViewController = HomeViewController()
        let navigationController = UINavigationController(rootViewController: homeViewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
     }
    
    // Action for the "회원가입" (Signup) button
    @objc func signUpButtonTapped() {
        let signUpViewController = SignUpViewController() // Create an instance of the SignUpViewController
        let navController = UINavigationController(rootViewController: signUpViewController) // Wrap the SignUpViewController in a navigation controller
        navController.modalPresentationStyle = .fullScreen

        let backButton = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(backButtonTapped))
        signUpViewController.navigationItem.leftBarButtonItem = backButton

        self.present(navController, animated: true, completion: nil) // Present the navigation controller modally


    }
    @objc func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }

}


extension UIColor {

    convenience init(hexCode: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hexCode.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")

        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}


//<로그인 함수 안걸려있는 코드>
//
//  ViewController.swift
//  STUDYHUB2
//
//  Created by HYERYEONG on 2023/08/05.


//import UIKit
//
//class ViewController: UIViewController {
//
//    private let passwordTextField = UITextField()
//    private let passwordTextFielddividerLine = UIView()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .black
//
//        // '지금 스터디 허브에서' 텍스트
//        let titleLabel = UILabel()
//        titleLabel.text = "지금 스터디 허브에서"
//        titleLabel.textColor = .white
//        titleLabel.font = UIFont.boldSystemFont(ofSize: 24) // Set the font size and boldness here
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(titleLabel)
//
//        // '나의 팀원을 만나보세요' 텍스트
//        let subtitleLabel = UILabel()
//        subtitleLabel.text = "나의 팀원을 만나보세요"
//        subtitleLabel.textColor = .white
//        subtitleLabel.font = UIFont.boldSystemFont(ofSize: 24) // Set the font size and boldness here
//        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(subtitleLabel)
//
//        // '이메일' 텍스트
//        let emailLabel = UILabel()
//        emailLabel.text = "이메일"
//        emailLabel.textColor = .white
//        emailLabel.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(emailLabel)
//
//
//        // 이메일 입력창
//        let emailTextField = UITextField()
//        emailTextField.placeholder = "이메일을 입력하세요"
//        emailTextField.attributedPlaceholder = NSAttributedString(string: "이메일 주소를 입력해주세요 (@inu.ac.kr)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
//        emailTextField.textColor = .white
//        emailTextField.backgroundColor = .black
//        emailTextField.borderStyle = .roundedRect
//        emailTextField.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(emailTextField)
//
//        let emailTextFielddividerLine = UIView()
//        emailTextFielddividerLine.backgroundColor = .gray
//        emailTextFielddividerLine.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(emailTextFielddividerLine)
//
//
//        // '비밀번호' 텍스트
//        let passwordLabel = UILabel()
//        passwordLabel.text = "비밀번호"
//        passwordLabel.textColor = .white
//        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(passwordLabel)
//
//        // 비밀번호 입력창
//        passwordTextField.placeholder = "비밀번호를 입력하세요"
//        passwordTextField.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
//        passwordTextField.textColor = .white
//        passwordTextField.backgroundColor = .black
//        passwordTextField.borderStyle = .roundedRect
//        passwordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange), for: .editingChanged)
//        passwordTextField.isSecureTextEntry = true
//        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(passwordTextField)
//
//        //graydivide
//        passwordTextFielddividerLine.backgroundColor = .gray
//        passwordTextFielddividerLine.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(passwordTextFielddividerLine)
//
//
//        // '로그인하기' 버튼
//        let loginButton = UIButton(type: .system)
//        loginButton.setTitle("로그인하기", for: .normal)
//        loginButton.setTitleColor(.white, for: .normal)
//        loginButton.backgroundColor = UIColor(hexCode: "FF5935")
//        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//        loginButton.layer.cornerRadius = 10
//        loginButton.translatesAutoresizingMaskIntoConstraints = false
//        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
//        view.addSubview(loginButton)
//
//        // '비밀번호가 기억나지 않으시나요?' 버튼
//        let forgotPasswordButton = UIButton(type: .system)
//        forgotPasswordButton.setTitle("비밀번호가 기억나지 않으시나요?", for: .normal)
//        forgotPasswordButton.setTitleColor(.gray, for: .normal)
//        forgotPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
//        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(forgotPasswordButton)
//
//        // '회원이 아니신가요?' 텍스트
//        let notMemberLabel = UILabel()
//        notMemberLabel.text = "회원이 아니신가요?"
//        notMemberLabel.textColor = .gray
//        notMemberLabel.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(notMemberLabel)
//
//
//        // '회원가입' 버튼
//        let signUpButton = UIButton(type: .system)
//        signUpButton.setTitle("회원가입", for: .normal)
//        signUpButton.setTitleColor(UIColor(hexCode: "FF5935"), for: .normal)
//        signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
//        signUpButton.translatesAutoresizingMaskIntoConstraints = false
//        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside) // Add the action for the button
//        view.addSubview(signUpButton)
//
//        // 오토레이아웃 설정
//        NSLayoutConstraint.activate([
//            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), // Align to the left
//            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
//
//            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), // Align to the left
//            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
//
//            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//            emailLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 90),
//
//            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
//            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5),
//            emailTextField.heightAnchor.constraint(equalToConstant: 30),
//
//            // Divider line constraints
//            emailTextFielddividerLine.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            emailTextFielddividerLine.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            emailTextFielddividerLine.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 5),
//            emailTextFielddividerLine.heightAnchor.constraint(equalToConstant: 1),
//
//            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            passwordLabel.topAnchor.constraint(equalTo: emailTextFielddividerLine.bottomAnchor, constant: 20),
//
//            passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
//            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
//            passwordTextField.heightAnchor.constraint(equalToConstant: 30),
//
//            // Divider line constraints
//            passwordTextFielddividerLine.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            passwordTextFielddividerLine.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            passwordTextFielddividerLine.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 5),
//            passwordTextFielddividerLine.heightAnchor.constraint(equalToConstant: 1),
//
//            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            loginButton.topAnchor.constraint(equalTo: passwordTextFielddividerLine.bottomAnchor, constant: 30),
//            loginButton.heightAnchor.constraint(equalToConstant: 55),
//            loginButton.widthAnchor.constraint(equalToConstant: 400),
//
//            forgotPasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            forgotPasswordButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
//
//            notMemberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
//            notMemberLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
//
//            signUpButton.leadingAnchor.constraint(equalTo: notMemberLabel.trailingAnchor, constant: 10),
//            signUpButton.centerYAnchor.constraint(equalTo: notMemberLabel.centerYAnchor)
//        ])
//
//        // '팀원' 글자 색상 변경
//        let attributedText = NSMutableAttributedString(string: "나의 팀원을 만나보세요")
//        attributedText.addAttribute(.foregroundColor, value: UIColor(hexCode: "FF5935"), range: NSRange(location: 3, length: 2))
//        subtitleLabel.attributedText = attributedText
//    }
//
//    func validatePassword(password: String) -> Bool {
//        let passwordRegex = "(?=.*[a-zA-Z0-9])(?=.*[^a-zA-Z0-9]).{10,}"
//        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
//    }
//
//    @objc func loginButtonTapped() {
//        let homeViewController = HomeViewController()
//
//        // Create a UINavigationController with HomeViewController as the root view controller
//        let navigationController = UINavigationController(rootViewController: homeViewController)
//        navigationController.modalPresentationStyle = .fullScreen
//
//        // Present the UINavigationController modally
//        present(navigationController, animated: true, completion: nil)
//    }
//
//    // Action for passwordTextField editingChanged event
//    @objc func passwordTextFieldDidChange() {
//        if let password = passwordTextField.text {
//            // Check if the entered password meets the required criteria
//            let isValidPassword = validatePassword(password: password)
//
//            // Change the color of the passwordTextFielddividerLine based on the validation result
//            passwordTextFielddividerLine.backgroundColor = isValidPassword ? .green : .red
//        }
//    }
//    // Action for the "회원가입" (Signup) button
//    @objc func signUpButtonTapped() {
//        let signUpViewController = SignUpViewController() // Create an instance of the SignUpViewController
//        let navController = UINavigationController(rootViewController: signUpViewController) // Wrap the SignUpViewController in a navigation controller
//        navController.modalPresentationStyle = .fullScreen
//
//        let backButton = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(backButtonTapped))
//        signUpViewController.navigationItem.leftBarButtonItem = backButton
//
//        self.present(navController, animated: true, completion: nil) // Present the navigation controller modally
//
//
//    }
//    @objc func backButtonTapped() {
//        self.dismiss(animated: true, completion: nil)
//    }
//
//}
//
//
//
//extension UIColor {
//
//    convenience init(hexCode: String, alpha: CGFloat = 1.0) {
//        var hexFormatted: String = hexCode.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
//
//        if hexFormatted.hasPrefix("#") {
//            hexFormatted = String(hexFormatted.dropFirst())
//        }
//
//        assert(hexFormatted.count == 6, "Invalid hex code used.")
//
//        var rgbValue: UInt64 = 0
//        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
//
//        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
//                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
//                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
//                  alpha: alpha)
//    }
//}
