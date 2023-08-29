import UIKit

class HomeViewController: UIViewController, UIScrollViewDelegate, UISearchBarDelegate {
    
    private let bookmarkIconButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        
        // Create a tab bar controller
        let tabBarController = UITabBarController()
        
        // Create view controllers for each tab
        let homeViewController = self // Your HomeViewController instance
        let studyViewController = StudyViewController() // Your StudyViewController instance
        let myPageViewController = myPageViewController() // Your MyPageViewController instance
        
        // Set the view controllers for the tab bar controller
        tabBarController.viewControllers = [homeViewController, studyViewController, myPageViewController]
        
        // Set tab bar item titles and images
        homeViewController.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), tag: 0)
        studyViewController.tabBarItem = UITabBarItem(title: "스터디", image: UIImage(systemName: "book"), tag: 1)
        myPageViewController.tabBarItem = UITabBarItem(title: "마이페이지", image: UIImage(systemName: "person"), tag: 2)
        
        // Update tab bar appearance
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.tintColor = UIColor(hexCode: "FF5935") // Selected item color
        tabBarAppearance.barTintColor = .white // Tab bar background color
        
        
        // Make the tab bar controller the root view controller
        UIApplication.shared.windows.first?.rootViewController = tabBarController
        
        // Create the top stack view for the header
        let headerStackView = UIStackView()
        headerStackView.axis = .horizontal
        headerStackView.alignment = .center
        headerStackView.spacing = 8
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Image view for the small logo
        let smallLogoImageView = UIImageView(image: UIImage(named: "Image 3"))
        smallLogoImageView.contentMode = .scaleAspectFit
        smallLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Label for the "STUDY HUB" text
        let studyHubLabel = UILabel()
        studyHubLabel.text = "STUDY HUB"
        studyHubLabel.font = UIFont.boldSystemFont(ofSize: 18)
        studyHubLabel.textColor = .white
        studyHubLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Apply attributed text to change color of "HUB"
        let hubAttributedText = NSMutableAttributedString(string: "STUDY HUB")
        hubAttributedText.addAttribute(.foregroundColor, value: UIColor(hexCode: "FF5935"), range: NSRange(location: 6, length: 3))
        studyHubLabel.attributedText = hubAttributedText
        
        // Add the smallLogoImageView and studyHubLabel to the header stack view
        headerStackView.addArrangedSubview(smallLogoImageView)
        headerStackView.addArrangedSubview(studyHubLabel)
        
        // Bookmark button
        let bookmarkButton = UIButton(type: .system)
        bookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        bookmarkButton.tintColor = .white
        bookmarkButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Bell button
        let bellButton = UIButton(type: .system)
        bellButton.setImage(UIImage(systemName: "bell.badge"), for: .normal)
        bellButton.tintColor = .white
        bellButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Spacer view to push the bookmarkButton and bellButton to the right
        let spacerView = UIView()
        spacerView.translatesAutoresizingMaskIntoConstraints = false
        spacerView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        headerStackView.addArrangedSubview(spacerView)
        
        // Add the bookmarkButton and bellButton to the header stack view
        headerStackView.addArrangedSubview(bookmarkButton)
        headerStackView.addArrangedSubview(bellButton)
        
        // Add the header stack view to the view
        view.addSubview(headerStackView)
        
        
        // Create the "자세히 보기" button
        let detailsButton = UIButton(type: .system)
        detailsButton.setTitle("자세히 보기", for: .normal)
        detailsButton.setTitleColor(.white, for: .normal)
        detailsButton.backgroundColor = UIColor(hexCode: "FF5935")
        detailsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        detailsButton.layer.cornerRadius = 8
        detailsButton.translatesAutoresizingMaskIntoConstraints = false
        detailsButton.addTarget(self, action: #selector(detailsButtonTapped), for: .touchUpInside)
        
        
        // Image view for the large imageㅁ
        let largeImageView = UIImageView(image: UIImage(named: "Image 2"))
        largeImageView.contentMode = .scaleAspectFill
        largeImageView.clipsToBounds = true
        largeImageView.translatesAutoresizingMaskIntoConstraints = false
        largeImageView.addSubview(detailsButton)
        
        
        // Label for the "NEW! 모집 중인 스터디예요" text
        let newStudyLabel = UILabel()
        newStudyLabel.text = "NEW! 모집 중인 스터디예요"
        newStudyLabel.font = UIFont.boldSystemFont(ofSize: 18)
        newStudyLabel.textColor = .black
        newStudyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // "전체>" button
        let viewAllButton = UIButton(type: .system)
        viewAllButton.setTitle("전체>", for: .normal)
        viewAllButton.setTitleColor(.gray, for: .normal)
        viewAllButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        viewAllButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Stack view for the newStudyLabel and viewAllButton
        let labelButtonStackView = UIStackView()
        labelButtonStackView.axis = .horizontal
        labelButtonStackView.alignment = .center
        labelButtonStackView.spacing = 8
        labelButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        labelButtonStackView.addArrangedSubview(newStudyLabel)
        labelButtonStackView.addArrangedSubview(viewAllButton)
        
        // Stack view for the header content (large image, search bar, and labels/buttons)
        let headerContentStackView = UIStackView()
        headerContentStackView.axis = .vertical
        headerContentStackView.spacing = 16
        headerContentStackView.translatesAutoresizingMaskIntoConstraints = false
        headerContentStackView.addArrangedSubview(largeImageView)
        
        // Create the search icon button
        let searchIconButton = UIButton(type: .system)
        searchIconButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchIconButton.tintColor = .black
        searchIconButton.addTarget(self, action: #selector(searchIconButtonTapped), for: .touchUpInside)
        searchIconButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Search Bar
        let searchBar = UISearchBar()
        searchBar.placeholder = "관심있는 스터디를 검색해 보세요"
        searchBar.backgroundImage = UIImage() // Remove background image
        searchBar.delegate = self // Set delegate
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        // Add the search icon button to the search bar
        searchBar.addSubview(searchIconButton)
        
        
        // Add the searchBar and labelButtonStackView to headerContentStackView
        headerContentStackView.addArrangedSubview(searchBar)
        headerContentStackView.addArrangedSubview(labelButtonStackView)
        
        // Create a button for "관심사"
        let interestButton = UIButton(type: .system)
        interestButton.setTitle("관심사", for: .normal)
        interestButton.setTitleColor(UIColor(hexCode: "FF5935"), for: .normal)
        interestButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        interestButton.backgroundColor = UIColor(hexCode: "#FFF1EE")
        interestButton.layer.cornerRadius = 8
        interestButton.translatesAutoresizingMaskIntoConstraints = false
        interestButton.addTarget(self, action: #selector(OpenNewPage), for: .touchUpInside)
        
        // Create a "제목" label
        let titleLabel = UILabel()
        titleLabel.text = "제목 (최대 2줄)"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Stack view for the interestButton and titleLabel
        let buttonLabelStackView = UIStackView()
        buttonLabelStackView.axis = .vertical
        buttonLabelStackView.alignment = .center
        buttonLabelStackView.spacing = 8
        buttonLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonLabelStackView.addArrangedSubview(interestButton)
        buttonLabelStackView.addArrangedSubview(titleLabel)
        
        // Create a "북마크" button
        let bookmarkIcon = UIImage(systemName: "bookmark.fill")
        bookmarkIconButton.setImage(bookmarkIcon, for: .normal)
        bookmarkIconButton.tintColor = UIColor(hexCode: "#C2C8CC")
        bookmarkIconButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Add an action method for the bookmark button
        bookmarkIconButton.addTarget(self, action: #selector(bookmarkButtonTapped), for: .touchUpInside)
        
        // Stack view for the buttons and label at the bottom of the gray rectangle
        let bottomButtonsLabelStackView = UIStackView()
        bottomButtonsLabelStackView.axis = .horizontal
        bottomButtonsLabelStackView.alignment = .center
        bottomButtonsLabelStackView.spacing = 8
        bottomButtonsLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomButtonsLabelStackView.addArrangedSubview(buttonLabelStackView)
        bottomButtonsLabelStackView.addArrangedSubview(UIView()) // Spacer
        bottomButtonsLabelStackView.addArrangedSubview(bookmarkIconButton)
        
        
        // Create a gray-bordered view to contain the buttons and label
        let grayBorderedView = UIView()
        grayBorderedView.backgroundColor = .clear
        grayBorderedView.layer.borderWidth = 1
        grayBorderedView.layer.borderColor = UIColor(hexCode: "#C2C8CC").cgColor
        grayBorderedView.layer.cornerRadius = 8
        grayBorderedView.translatesAutoresizingMaskIntoConstraints = false
        grayBorderedView.addSubview(bottomButtonsLabelStackView)
        
        // Adjust height constraint of grayBorderedView to make it taller
        let grayBorderedViewHeightConstraint = grayBorderedView.heightAnchor.constraint(equalToConstant: 179)
        grayBorderedViewHeightConstraint.priority = .defaultHigh
        grayBorderedViewHeightConstraint.isActive = true
        
        //        // Adjust height constraint of grayBorderedView to make it taller
        //        let grayBorderedWidthConstraint = grayBorderedView.heightAnchor.constraint(equalToConstant: 244)
        //        grayBorderedWidthConstraint.priority = .defaultHigh
        //        grayBorderedWidthConstraint.isActive = true
        
        // Add the grayBorderedView to the headerContentStackView
        headerContentStackView.addArrangedSubview(grayBorderedView)
        
        // Small image view
        let smallImageView = UIImageView(image: UIImage(systemName: "flame.fill"))
        smallImageView.contentMode = .scaleAspectFit
        smallImageView.tintColor = UIColor(hexCode: "FF5935") // Set color
        smallImageView.translatesAutoresizingMaskIntoConstraints = false
        smallImageView.heightAnchor.constraint(equalToConstant: 110).isActive = true
        smallImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        // Text label
        let textLabel = UILabel()
        textLabel.text = "마감이 임박한 스터디예요"
        textLabel.font = UIFont.boldSystemFont(ofSize: 18)
        textLabel.textColor = .black
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Apply attributed text to change color of "HUB"
        let textAttributedText = NSMutableAttributedString(string: "마감이 임박한 스터디예요")
        textAttributedText.addAttribute(.foregroundColor, value: UIColor(hexCode: "FF5935"), range: NSRange(location: 0, length: 2))
        textLabel.attributedText = textAttributedText
        
        
        // Yellow boxes stack view
        let yellowBoxesStackView = UIStackView()
        yellowBoxesStackView.axis = .vertical
        yellowBoxesStackView.spacing = 6
        yellowBoxesStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Create 3 small yellow boxes
        // Create 3 small yellow boxes
        for _ in 1...3 {
            let yellowBoxView = UIView()
            yellowBoxView.backgroundColor = .white
            yellowBoxView.layer.cornerRadius = 5
            yellowBoxView.layer.borderColor = UIColor(hexCode: "#C2C8CC").cgColor
            yellowBoxView.layer.borderWidth = 1.1
            yellowBoxView.widthAnchor.constraint(equalToConstant: 250).isActive = true
            yellowBoxView.heightAnchor.constraint(equalToConstant: 88).isActive = true
            
            // Create a larger image view
            let largeImageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
            largeImageView.contentMode = .scaleAspectFit
            largeImageView.tintColor = UIColor(hexCode: "C2C8CC") // Set color
            largeImageView.translatesAutoresizingMaskIntoConstraints = false
            largeImageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
            largeImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
            
            // Add the larger image view to the yellowBoxView and center it
            yellowBoxView.addSubview(largeImageView)
            
            
            yellowBoxesStackView.addArrangedSubview(yellowBoxView)
        }
        
        // Stack view to contain smallImageView and textLabel
        let imageTextLabelStackView = UIStackView()
        imageTextLabelStackView.axis = .horizontal
        imageTextLabelStackView.alignment = .center
        imageTextLabelStackView.spacing = 8
        imageTextLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        imageTextLabelStackView.addArrangedSubview(smallImageView)
        imageTextLabelStackView.addArrangedSubview(textLabel)
        
        // Stack view for the additional content below grayBorderedView
        let additionalContentBelowStackView = UIStackView()
        additionalContentBelowStackView.axis = .vertical
        additionalContentBelowStackView.spacing = -30
        additionalContentBelowStackView.translatesAutoresizingMaskIntoConstraints = false
        additionalContentBelowStackView.addArrangedSubview(imageTextLabelStackView)
        additionalContentBelowStackView.addArrangedSubview(yellowBoxesStackView)
        
        // Add the additional content below stack view to the header content stack view
        headerContentStackView.addArrangedSubview(additionalContentBelowStackView)
        
        // Text label for "이 스터디는 어떠세요?"
        let feedbackLabel = UILabel()
        feedbackLabel.text = "이 스터디는 어떠세요?"
        feedbackLabel.font = UIFont.boldSystemFont(ofSize: 18)
        feedbackLabel.textColor = .black
        feedbackLabel.translatesAutoresizingMaskIntoConstraints = false
        feedbackLabel.heightAnchor.constraint(equalToConstant: 90).isActive = true
        feedbackLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        
        // Add the feedbackLabel to the header content stack view
        headerContentStackView.addArrangedSubview(feedbackLabel)
        
        
        // Create a scroll view to make the content scrollable
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(headerContentStackView)
        view.addSubview(scrollView)
        
        headerContentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        // Add gray line view above the tab bar controller
        let grayLineView = UIView()
        grayLineView.backgroundColor = UIColor(hexCode: "#C2C8CC")
        grayLineView.translatesAutoresizingMaskIntoConstraints = false
        tabBarController.view.addSubview(grayLineView)
        
        
        // Set up constraints
        NSLayoutConstraint.activate([
            
            grayLineView.topAnchor.constraint(equalTo: tabBarController.view.topAnchor, constant: 760),
            grayLineView.leadingAnchor.constraint(equalTo: tabBarController.view.leadingAnchor),
            grayLineView.trailingAnchor.constraint(equalTo: tabBarController.view.trailingAnchor),
            grayLineView.heightAnchor.constraint(equalToConstant: 1), // Adjust the height as needed
              
            // Header stack view constraints
            headerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            headerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            headerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            // Header content stack view constraints
            headerContentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            headerContentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            headerContentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            headerContentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            headerContentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // Large image view constraints (assuming fixed height)
            largeImageView.heightAnchor.constraint(equalToConstant: 225),
            largeImageView.leadingAnchor.constraint(equalTo: headerContentStackView.leadingAnchor), // No left margin
            largeImageView.trailingAnchor.constraint(equalTo: headerContentStackView.trailingAnchor), // No right margin
            
            detailsButton.bottomAnchor.constraint(equalTo: largeImageView.bottomAnchor, constant: -30),
            detailsButton.leadingAnchor.constraint(equalTo: largeImageView.leadingAnchor, constant: 16),
            detailsButton.widthAnchor.constraint(equalToConstant: 130),
            detailsButton.heightAnchor.constraint(equalToConstant: 35),
            
            
            // Search Bar constraints
            searchBar.heightAnchor.constraint(equalToConstant: 40),
            
            // Gray bordered view constraints
            grayBorderedView.leadingAnchor.constraint(equalTo: headerContentStackView.leadingAnchor, constant: 10),
            grayBorderedView.trailingAnchor.constraint(equalTo: headerContentStackView.trailingAnchor, constant: -150),
            
            // Stack view constraints
            bottomButtonsLabelStackView.topAnchor.constraint(equalTo: grayBorderedView.topAnchor, constant: -10),
            bottomButtonsLabelStackView.leadingAnchor.constraint(equalTo: grayBorderedView.leadingAnchor, constant: 10),
            bottomButtonsLabelStackView.trailingAnchor.constraint(equalTo: grayBorderedView.trailingAnchor, constant: -8),
            bottomButtonsLabelStackView.bottomAnchor.constraint(equalTo: grayBorderedView.bottomAnchor, constant: -80),
            
            searchIconButton.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
            searchIconButton.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant: -8),
            searchIconButton.widthAnchor.constraint(equalToConstant: 20),
            searchIconButton.heightAnchor.constraint(equalToConstant: 20),
            
            
            // Scroll view constraints
            scrollView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 16),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
        
        // Set the background color of the scrollView to black
        scrollView.backgroundColor = .white
        
        //  글자 색상 변경
        let attributedText = NSMutableAttributedString(string: "NEW! 모집 중인 스터디예요")
        attributedText.addAttribute(.foregroundColor, value: UIColor(hexCode: "FF5935"), range: NSRange(location: 0, length: 4))
        newStudyLabel.attributedText = attributedText
        
        // Set the scroll view's content size to fit the content
        headerContentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    @objc func detailsButtonTapped() {
        let detailsViewController = DetailsViewController()
        // Create a UINavigationController with DetailsViewController as the root view controller
        let navigationController = UINavigationController(rootViewController: detailsViewController)
        navigationController.modalPresentationStyle = .fullScreen
        
        // Present the UINavigationController modally
        present(navigationController, animated: true, completion: nil)
    }
    
    @objc func searchIconButtonTapped() {
        let searchViewController = SearchViewController()
        // Create a UINavigationController with HomeViewController as the root view controller
        let navigationController = UINavigationController(rootViewController: searchViewController)
        navigationController.modalPresentationStyle = .fullScreen
        
        
        
        // Present the UINavigationController modally
        present(navigationController, animated: true, completion: nil)
    }
    
    
    
    
    // Function to handle bookmark button tap
    @objc func bookmarkButtonTapped() {
        if bookmarkIconButton.tintColor == UIColor(hexCode: "#C2C8CC") {
            bookmarkIconButton.tintColor = UIColor(hexCode: "FF5935")
            
        } else {
            bookmarkIconButton.tintColor = UIColor(hexCode: "#C2C8CC")
        }
    }
    
    // Function to handle button tap and open new page
    @objc func OpenNewPage() {
        let newPageViewController = OpenNewPageViewController() // Your new view controller
        navigationController?.pushViewController(newPageViewController, animated: true)
    }
}
