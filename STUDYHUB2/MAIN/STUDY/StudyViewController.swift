import UIKit

class StudyViewController: UIViewController {
    
    private let recentButton = UIButton(type: .system)
    private let popularButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        // Create the top stack view for the header
        let headerStackView = UIStackView()
        headerStackView.axis = .horizontal
        headerStackView.alignment = .center
        headerStackView.spacing = 8
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Label for the "STUDY HUB" text
        let studyHubLabel = UILabel()
        studyHubLabel.text = "스터디"
        studyHubLabel.font = UIFont.boldSystemFont(ofSize: 18)
        studyHubLabel.textColor = .white
        studyHubLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the studyHubLabel to the header stack view
        headerStackView.addArrangedSubview(studyHubLabel)
        
        //  magnifyingglassbutton
        let magnifyingglassButton = UIButton(type: .system)
        magnifyingglassButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        magnifyingglassButton.tintColor = .white
        magnifyingglassButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Bell button
        let bellButton = UIButton(type: .system)
        bellButton.setImage(UIImage(systemName: "bell"), for: .normal)
        bellButton.tintColor = .white
        bellButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Spacer view to push the bookmarkButton and bellButton to the right
        let spacerView = UIView()
        spacerView.translatesAutoresizingMaskIntoConstraints = false
        spacerView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        headerStackView.addArrangedSubview(spacerView)
        
        // Add the bookmarkButton and bellButton to the header stack view
        headerStackView.addArrangedSubview(magnifyingglassButton)
        headerStackView.addArrangedSubview(bellButton)
        
        // Add the header stack view to the view
        view.addSubview(headerStackView)
        
        let headerContentStackView = UIStackView()
        headerContentStackView.axis = .vertical
        headerContentStackView.spacing = 16
        headerContentStackView.translatesAutoresizingMaskIntoConstraints = false

        // Create a scroll view to make the content scrollable
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(headerContentStackView)
        view.addSubview(scrollView)
        
        // Create a stack view for the buttons
        let buttonsStackView = UIStackView()
        buttonsStackView.axis = .horizontal
        buttonsStackView.spacing = 16
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        // Create buttons
        let buttonTitles = ["제어", "전체", "컴퓨터 활용 능력", "토익", "전산세무", "추가"]
        var buttons: [UIButton] = []
        
        for title in buttonTitles {
            let button = UIButton(type: .system)
            if title == "제어" {
                button.setImage(UIImage(systemName: "slider.horizontal.3"), for: .normal)
                button.tintColor = .gray
                button.imageView?.contentMode = .scaleAspectFill
                button.layer.cornerRadius = 1
                button.layer.borderWidth = 0.5
                button.layer.borderColor = UIColor.gray.cgColor
            } else {
                button.setTitle(title, for: .normal)
                button.setTitleColor(.gray, for: .normal)
                button.backgroundColor = .white
                button.layer.cornerRadius = 10
                button.imageView?.contentMode = .scaleAspectFill
                button.layer.borderWidth = 0.5
                button.layer.borderColor = UIColor.gray.cgColor
                  

            }
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            buttons.append(button)
        }
        
        // Add the buttons to the buttons stack view
        buttons.forEach { buttonsStackView.addArrangedSubview($0) }
        
        // Add the buttons stack view to the header content stack view
        headerContentStackView.addArrangedSubview(buttonsStackView)
        
        // 관심사까지 라인
        let grayDividerLine = UIView()
        grayDividerLine.backgroundColor = UIColor(hexCode: "#F3F5F6")
        grayDividerLine.translatesAutoresizingMaskIntoConstraints = false
        headerContentStackView.insertArrangedSubview(grayDividerLine, at: 1)
        grayDividerLine.heightAnchor.constraint(equalToConstant: 10).isActive = true // Adjust the thickness here

        // Create a stack view for the "최신순" and "인기순" buttons
        let sortingButtonsStackView = UIStackView()
        sortingButtonsStackView.axis = .horizontal
        sortingButtonsStackView.spacing = 8
        sortingButtonsStackView.translatesAutoresizingMaskIntoConstraints = false

        // Create the "최신순" button
        recentButton.setTitle("최신순", for: .normal)
        recentButton.setTitleColor(.gray, for: .normal)
        recentButton.translatesAutoresizingMaskIntoConstraints = false
        recentButton.addTarget(self, action: #selector(sortingButtonTapped(_:)), for: .touchUpInside)
        
        // Create a gray vertical line
        let verticalGrayLine = UIView()
        verticalGrayLine.backgroundColor = UIColor(hexCode: "#D8DCDE")
        verticalGrayLine.translatesAutoresizingMaskIntoConstraints = false
        verticalGrayLine.widthAnchor.constraint(equalToConstant: 1).isActive = true

        // Create the "인기순" button
        popularButton.setTitle("인기순", for: .normal)
        popularButton.setTitleColor(.gray, for: .normal)
        popularButton.translatesAutoresizingMaskIntoConstraints = false
        popularButton.addTarget(self, action: #selector(sortingButtonTapped(_:)), for: .touchUpInside)
        
        // Add the recentButton, verticalGrayLine, and popularButton to the sortingButtonsStackView
        sortingButtonsStackView.addArrangedSubview(recentButton)
        sortingButtonsStackView.addArrangedSubview(verticalGrayLine)
        sortingButtonsStackView.addArrangedSubview(popularButton)

        // Add the sortingButtonsStackView to the headerContentStackView
        headerContentStackView.insertArrangedSubview(sortingButtonsStackView, at: 2) // Insert at index 0 to place it at the leftmost side

        //sortingButtons까지 나누는 선
        let sortingButtonsGrayLine = UIView()
        sortingButtonsGrayLine.backgroundColor = UIColor(hexCode: "#F3F5F6")
        sortingButtonsGrayLine.translatesAutoresizingMaskIntoConstraints = false
        headerContentStackView.addArrangedSubview(sortingButtonsGrayLine)
        sortingButtonsGrayLine.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        // Create a UIImageView for the center image
        let centerImageView = UIImageView()
        centerImageView.image = UIImage(named: "Image 5") // Replace with the actual image name
        centerImageView.contentMode = .scaleAspectFit
        centerImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(centerImageView)

        
        // Create the "+" button
        let addButton = UIButton(type: .system)
        addButton.setTitle("+", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.backgroundColor = UIColor(hexCode: "FF5935")
        addButton.layer.cornerRadius = 30 // Increase the corner radius to make the button rounder
        addButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        view.addSubview(addButton)

        
        // Set up constraints
        NSLayoutConstraint.activate([
            // Header stack view constraints
            headerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            headerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            headerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            // Header content stack view constraints
            headerContentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            headerContentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            headerContentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            headerContentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            headerContentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // Constraints for chatLinkLabel
            recentButton.leadingAnchor.constraint(equalTo: sortingButtonsStackView.leadingAnchor, constant: -100),
            recentButton.trailingAnchor.constraint(equalTo: sortingButtonsStackView.trailingAnchor, constant: -230),
            

            // Constraints for descriptionLabel
            popularButton.leadingAnchor.constraint(equalTo: sortingButtonsStackView.leadingAnchor, constant: -230),
            popularButton.trailingAnchor.constraint(equalTo: sortingButtonsStackView.trailingAnchor, constant: 100),
            
            centerImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            centerImageView.widthAnchor.constraint(equalToConstant: 150), // Adjust the width as needed
            centerImageView.heightAnchor.constraint(equalToConstant: 150), // Adjust the height as needed
    
             
            
            // Scroll view constraints
            scrollView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 16),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Place the sortingButtonsGrayLine just above the sortingButtonsStackView
            sortingButtonsGrayLine.bottomAnchor.constraint(equalTo: sortingButtonsStackView.topAnchor, constant: 35),
            
            addButton.widthAnchor.constraint(equalToConstant: 60), // Increase the width
            addButton.heightAnchor.constraint(equalToConstant: 60), // Increase the height
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                      
            
    
        ])
        
        
        // Set the background color of the scrollView to white
        scrollView.backgroundColor = .white
        
        // Set the scroll view's content size to fit the content
        headerContentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    @objc func addButtonTapped() {
        let createStudyViewController = CreateStudyViewController()
        let navigationController = UINavigationController(rootViewController: createStudyViewController)
        navigationController.modalPresentationStyle = .fullScreen
        
        // Present the navigation controller modally
        present(navigationController, animated: true, completion: nil)
        
        //        let createStudyViewController = CreateStudyViewController() // Create an instance of the SignUpViewController
        //        let navigationController = UINavigationController(rootViewController: createStudyViewController) // Wrap the SignUpViewController in a navigation controller
        //        navigationController.modalPresentationStyle = .fullScreen
        //
        //        let backButton = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(backButtonTapped))
        //        createStudyViewController.navigationItem.leftBarButtonItem = backButton
        //
        //        self.present(navigationController, animated: true, completion: nil) // Present the navigation controller modally
        //
        //
        //    }
        //    @objc func backButtonTapped() {
        //        self.dismiss(animated: true, completion: nil)
        //    }
    }

    
    

    @objc func sortingButtonTapped(_ sender: UIButton) {
        // Reset colors of all buttons
        recentButton.setTitleColor(.gray, for: .normal)
        popularButton.setTitleColor(.gray, for: .normal)
    
        
        // Set the tapped button to orange background
        sender.setTitleColor(.black, for: .normal)
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
          if sender.tag == 0 { // Check if the tapped button is the "제어" button
              let categoryViewController = CategoryViewController()
              addChild(categoryViewController)
              view.addSubview(categoryViewController.view)
              
              // Initial position: Offscreen bottom
              categoryViewController.view.frame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: view.frame.height / 2)
              
              UIView.animate(withDuration: 0.3) {
                  // Animate the view to slide up from the bottom
                  categoryViewController.view.frame = CGRect(x: 0, y: self.view.frame.height / 2, width: self.view.frame.width, height: self.view.frame.height / 2)
              }
          } else {
              if sender.backgroundColor == .white {
                  sender.backgroundColor = UIColor(hexCode: "FF5935")
              } else {
                  sender.backgroundColor = .white
              }
            
          }
        
      }
  }
  




