import UIKit

class SearchViewController:UIViewController{

  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        // Create the top stack view for the header
        let headerStackView = UIStackView()
        headerStackView.axis = .horizontal
        headerStackView.alignment = .center
        headerStackView.spacing = 8
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Back button
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .white
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        

        
        // Add the backButton and studyLabel to the header stack view
        headerStackView.addArrangedSubview(backButton)
        
        //  bookmarkButton
        let bookmarkButton = UIButton(type: .system)
        bookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        bookmarkButton.tintColor = .white
        bookmarkButton.translatesAutoresizingMaskIntoConstraints = false
        
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
        headerStackView.addArrangedSubview(bookmarkButton)
        headerStackView.addArrangedSubview(bellButton)
        
        // Add the header stack view to the view
        view.addSubview(headerStackView)

        
        let headerContentStackView = UIStackView()
        headerContentStackView.axis = .vertical
        headerContentStackView.spacing = 16
        headerContentStackView.translatesAutoresizingMaskIntoConstraints = false
      
        
        // Add a search bar
        let searchBar = UISearchBar()
        searchBar.placeholder = "관심있는 스터디를 검색해보세요"
        headerContentStackView.addArrangedSubview(searchBar)
        
        
        // Create a scroll view to make the content scrollable
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(headerContentStackView)
        view.addSubview(scrollView)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            // Header stack view constraints
            headerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            headerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            headerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            // Search bar constraints
            searchBar.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 16),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
   
            
            // Header content stack view constraints
            headerContentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            headerContentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            headerContentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            headerContentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            headerContentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // Scroll view constraints
            scrollView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 16),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        // Set the background color of the scrollView to black
                scrollView.backgroundColor = .white
        
        
        // Set the scroll view's content size to fit the content
        headerContentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    // Function to handle back button tap and navigate back to HomeViewController
     @objc func goBack() {
         // If the SearchViewController is embedded within a UINavigationController
//                 navigationController?.popViewController(animated: true)
         let homeViewController = HomeViewController()
         let navController = UINavigationController(rootViewController: homeViewController) // Wrap the SignUpViewController in a navigation controller
         navController.modalPresentationStyle = .fullScreen
         
         _ = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(backButtonTapped))
       
         
         self.present(navController, animated: true, completion: nil) // Present the navigation controller modally
         
         
     }
     @objc func backButtonTapped() {
         self.dismiss(animated: true, completion: nil)
     }
         
 
    
}
