import UIKit

class PasswordViewController: UIViewController {
  private let passwordTextField = UITextField()
  private let passwordTextFielddividerLine = UIView()
  private let confirmPasswordTextField = UITextField() // New confirmation password field
  private let confirmPasswordTextFielddividerLine = UIView() // New divider line for confirmation password
  

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
    
    // '2/4' 텍스트
    let progressLabel = UILabel()
    progressLabel.text = "2/4"
    progressLabel.textColor = .gray
    progressLabel.font = UIFont.boldSystemFont(ofSize: 20)
    progressLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(progressLabel)
    
    // '비밀번호를 설정해주세요' 텍스트
    let passwordPromptLabel = UILabel()
    passwordPromptLabel.text = "비밀번호를 설정해주세요"
    passwordPromptLabel.textColor = .white
    passwordPromptLabel.font = UIFont.boldSystemFont(ofSize: 22)
    passwordPromptLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(passwordPromptLabel)
    
    // '필수에요' 텍스트
    let passwordRequirementLabel = UILabel()
    passwordRequirementLabel.text = "10자리 이상, 특수문자 포함(!,@,#,$,%,^,&,*,?,~,_)이 필수에요"
    passwordRequirementLabel.textColor = .gray
    passwordRequirementLabel.font = UIFont.systemFont(ofSize: 13)
    passwordRequirementLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(passwordRequirementLabel)
    
    // '비밀번호' 텍스트
    let passwordLabel = UILabel()
    passwordLabel.text = "비밀번호"
    passwordLabel.textColor = .white
    passwordLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(passwordLabel)
      
    // graydivide
    passwordTextFielddividerLine.backgroundColor = .gray
    passwordTextFielddividerLine.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(passwordTextFielddividerLine)
    
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

      
    // 비밀번호 확인 입력창
    confirmPasswordTextField.placeholder = "비밀번호를 한 번 더 입력해주세요"
    confirmPasswordTextField.attributedPlaceholder = NSAttributedString(string: "비밀번호를 한 번 더 입력해주세요", attributes:[NSAttributedString.Key.foregroundColor: UIColor.gray])
    confirmPasswordTextField.textColor = .white
    confirmPasswordTextField.backgroundColor = .black
    confirmPasswordTextField.borderStyle = .roundedRect
    confirmPasswordTextField.addTarget(self, action:#selector(confirmPasswordTextFieldDidChange), for: .editingChanged)
            
    confirmPasswordTextField.isSecureTextEntry = true
    confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(confirmPasswordTextField)
    
      
    // graydivide for confirmation password
    confirmPasswordTextFielddividerLine.backgroundColor = .gray
    confirmPasswordTextFielddividerLine.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(confirmPasswordTextFielddividerLine)

      // '확인' 버튼
    let confirmButton = UIButton(type: .system)
    confirmButton.setTitle("확인", for: .normal)
    confirmButton.setTitleColor(UIColor(hexCode: "FF5935"), for: .normal)
    confirmButton.backgroundColor = .black
    confirmButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    confirmButton.translatesAutoresizingMaskIntoConstraints = false
    confirmButton.layer.cornerRadius = 10
    confirmButton.layer.borderColor = UIColor(hexCode: "FF5935").cgColor // Set the border color
    confirmButton.layer.borderWidth = 1.0 // Set the border width
    confirmButton.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
    view.addSubview(confirmButton)
    
    
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
      
      passwordPromptLabel.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 10),
      passwordPromptLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      
      passwordRequirementLabel.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 40),
      passwordRequirementLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      
      passwordLabel.topAnchor.constraint(equalTo: passwordPromptLabel.bottomAnchor, constant: 80),
      passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
      
      passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 20),
      passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
      passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70), // Adjusted to make space for the '인증' button
      passwordTextField.heightAnchor.constraint(equalToConstant: 30),
      
      
      // Divider line constraints
      passwordTextFielddividerLine.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      passwordTextFielddividerLine.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      passwordTextFielddividerLine.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 5),
      passwordTextFielddividerLine.heightAnchor.constraint(equalToConstant: 1),
      
  

      confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextFielddividerLine.bottomAnchor, constant: 50),
      confirmPasswordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
      confirmPasswordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70), // Adjusted to make space for the '인증' button
      confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 30),

      // Divider line constraints for confirmation password
      confirmPasswordTextFielddividerLine.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      confirmPasswordTextFielddividerLine.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      confirmPasswordTextFielddividerLine.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 5),
      confirmPasswordTextFielddividerLine.heightAnchor.constraint(equalToConstant: 1),

      confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      confirmButton.topAnchor.constraint(equalTo: confirmPasswordTextFielddividerLine.bottomAnchor, constant: 50),
      confirmButton.heightAnchor.constraint(equalToConstant: 55),
      confirmButton.widthAnchor.constraint(equalToConstant: 380),
 
      
      nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      nextButton.topAnchor.constraint(equalTo: passwordTextFielddividerLine.bottomAnchor, constant: 350),
      nextButton.heightAnchor.constraint(equalToConstant: 55),
      nextButton.widthAnchor.constraint(equalToConstant: 400)
    ])
  }
  
  func validatePassword(password: String) -> Bool {
      let passwordRegex = "(?=.*[a-zA-Z0-9])(?=.*[^a-zA-Z0-9]).{10,}"
      return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
      // Change the color of the emailTextFielddividerLine based on the validation result
  }

  @objc func nextButtonTapped() {
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
      
      guard let confirmPassword = confirmPasswordTextField.text, !confirmPassword.isEmpty else {
          // Change the color of confirmPasswordTextFielddividerLine to red
          confirmPasswordTextFielddividerLine.backgroundColor = .red

          let alert = UIAlertController(title: "경고",
                                        message: "비밀번호를 한번 더 입력해주세요.",
                                        preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
          present(alert, animated: true, completion: nil)
          return
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
      
      // Check if passwords match
      if password != confirmPassword {
          let alert = UIAlertController(title: "경고",
                                        message: "비밀번호가 일치하지 않습니다.",
                                        preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
          present(alert, animated: true, completion: nil)

          // Change the color of confirmPasswordTextFielddividerLine to red
          confirmPasswordTextFielddividerLine.backgroundColor = .red
          return
      }

      let nicknameViewController = NicknameViewController()
      navigationController?.pushViewController(nicknameViewController, animated: true)
  }
    @objc func confirmButtonTapped() {
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

        passwordTextFielddividerLine.backgroundColor = .green

        guard let confirmPassword = confirmPasswordTextField.text, !confirmPassword.isEmpty else {
            // Change the color of confirmPasswordTextFielddividerLine to red
            confirmPasswordTextFielddividerLine.backgroundColor = .red

            let alert = UIAlertController(title: "경고",
                                          message: "비밀번호를 한번 더 입력해주세요.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }


        confirmPasswordTextFielddividerLine.backgroundColor = .green

        // Check if passwords match
        if password != confirmPassword {
            let alert = UIAlertController(title: "경고",
                                          message: "비밀번호가 일치하지 않습니다.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)

            // Change the color of confirmPasswordTextFielddividerLine to red
            confirmPasswordTextFielddividerLine.backgroundColor = .red
            return
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
    @objc func confirmPasswordTextFieldDidChange() {
        if let password = confirmPasswordTextField.text {
            // Check if the entered password meets the required criteria
            let isValidPassword = validatePassword(password: password)

            // Change the color of the passwordTextFielddividerLine based on the validation result
            confirmPasswordTextFielddividerLine.backgroundColor = isValidPassword ? .green : .red
        }
    }
    

}
