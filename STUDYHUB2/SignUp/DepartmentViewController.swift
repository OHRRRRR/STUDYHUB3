
import UIKit

class DepartmentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    var selectedDepartment: String?
    
    let departments = ["국어국문학과", "영어영문학과", "독어독문학과", "불어불문학과", "중어중국학과", "수학과", "물리학과", "화학과", "패션산업학과", "해양학과", "사회복지학과"]
    
    let departmentButton = UIButton()
    let departmentTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 800) // Adjust the content height as needed
        scrollView.backgroundColor = .black
        view.addSubview(scrollView)
        
        
        // '회원가입' 텍스트
        let titleLabel = UILabel()
        titleLabel.text = "회원가입"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22) // Set the font size and boldness here
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        // '4/4' 텍스트
        let progressLabel = UILabel()
        progressLabel.text = "4/4"
        progressLabel.textColor = .gray
        progressLabel.font = UIFont.boldSystemFont(ofSize: 20)
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progressLabel)
        
        // '학과를 알려주세요' 텍스트
        let departmentPromptLabel = UILabel()
        departmentPromptLabel.text = "학과를 알려주세요"
        departmentPromptLabel.textColor = .white
        departmentPromptLabel.font = UIFont.boldSystemFont(ofSize: 22)
        departmentPromptLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(departmentPromptLabel)
        
        // '학과' 텍스트
        let departmentLabel = UILabel()
        departmentLabel.text = "학과"
        departmentLabel.textColor = .white
        departmentLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(departmentLabel)
        
        // Department button
        departmentButton.frame = CGRect(x: -40, y: 315, width: view.bounds.width - 40, height: 30)
        departmentButton.setTitle("현재 재학 중인 학과를 적어주세요", for: .normal)
        departmentButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        departmentButton.setTitleColor(.gray, for: .normal)
        departmentButton.backgroundColor = UIColor.black
        departmentButton.addTarget(self, action: #selector(showDepartments), for: .touchUpInside)
        view.addSubview(departmentButton)
        
        // Hide the departmentTableView initially
        departmentTableView.isHidden = true
        
        // Department table view
        departmentTableView.frame = CGRect(x: 20, y: departmentButton.frame.maxY, width: view.bounds.width - 40, height: 200)
        departmentTableView.dataSource = self
        departmentTableView.delegate = self
        departmentTableView.backgroundColor = .black // Set the background color of the departmentTableView to black
        view.addSubview(departmentTableView)
        
        //graydivide
        let departmentTextFielddividerLine = UIView()
        departmentTextFielddividerLine.backgroundColor = .gray
        departmentTextFielddividerLine.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(departmentTextFielddividerLine)
        
        
        
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
            
            departmentPromptLabel.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 10),
            departmentPromptLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            departmentLabel.topAnchor.constraint(equalTo: departmentPromptLabel.bottomAnchor, constant: 80),
            departmentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            
            // Divider line constraints
            departmentTextFielddividerLine.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            departmentTextFielddividerLine.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            departmentTextFielddividerLine.topAnchor.constraint(equalTo: departmentButton.bottomAnchor, constant: 0),
            departmentTextFielddividerLine.heightAnchor.constraint(equalToConstant: 1),
            
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.topAnchor.constraint(equalTo: departmentTextFielddividerLine.bottomAnchor, constant: 350),
            nextButton.heightAnchor.constraint(equalToConstant: 55),
            nextButton.widthAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    // Function to toggle visibility of departmentTableView
    @objc func showDepartments() {
        departmentTableView.isHidden = !departmentTableView.isHidden
    }
    

    
    @objc func nextButtonTapped() {
        let completeViewController = CompleteViewController()

              // Use the navigation controller to push the PasswordViewController onto the navigation stack
              navigationController?.pushViewController(completeViewController, animated: true)
    }
    
    // UITableViewDataSource methods
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return departments.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "departmentCell")
            cell.textLabel?.text = departments[indexPath.row]
            cell.textLabel?.textColor = .gray // Set the text color of the items in the departmentTableView to gray
            cell.backgroundColor = .black // Set the background color of the cells to black
            return cell
        }
    // UITableViewDelegate method
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let selectedDepartment = departments[indexPath.row]

        // Update the department button text with the selected department name
        departmentButton.setTitle(selectedDepartment, for: .normal)

        // Store the selected department name for later use if needed
        self.selectedDepartment = selectedDepartment

        // Hide the departmentTableView after selection
        departmentTableView.isHidden = true
        

    }
}
