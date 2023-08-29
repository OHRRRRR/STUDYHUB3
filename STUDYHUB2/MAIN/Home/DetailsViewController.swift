import UIKit

class DetailsViewController:UIViewController{
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

//        // Create the top stack view for the header
//        let headerStackView = UIStackView()
//        headerStackView.axis = .horizontal
//        headerStackView.alignment = .center
//        headerStackView.spacing = 8
//        headerStackView.translatesAutoresizingMaskIntoConstraints = false
//
//        // Back button
//        let backButton = UIButton(type: .system)
//        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
//        backButton.tintColor = .white
//        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
//        backButton.translatesAutoresizingMaskIntoConstraints = false
//        headerStackView.addArrangedSubview(backButton)
//
//        // Create the "이용방법" label
//        let titleLabel = UILabel()
//        titleLabel.text = "이용방법"
//        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
//        titleLabel.textColor = .white
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        headerStackView.addArrangedSubview(titleLabel)
//
//
//        // Add the backButton and studyLabel to the header stack view
//        headerStackView.addArrangedSubview(backButton)
//
//
//
//        // Add the header stack view to the view
//        view.addSubview(headerStackView)
//
//
//        let headerContentStackView = UIStackView()
//        headerContentStackView.axis = .vertical
//        headerContentStackView.spacing = 16
//        headerContentStackView.translatesAutoresizingMaskIntoConstraints = false
//
//
//
//        // Create a scroll view to make the content scrollable
//        let scrollView = UIScrollView()
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.addSubview(headerContentStackView)
//        view.addSubview(scrollView)
//
//        // Constraints for the "이용방법" label
//        titleLabel.centerXAnchor.constraint(equalTo: headerStackView.centerXAnchor).isActive = true
//        titleLabel.centerYAnchor.constraint(equalTo: headerStackView.centerYAnchor).isActive = true
//
//        // Set up constraints
//        NSLayoutConstraint.activate([
//            // Header stack view constraints
//            headerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
//            headerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            headerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//
//
//            // Header content stack view constraints
//            headerContentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
//            headerContentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
//            headerContentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
//            headerContentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
//            headerContentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
//
//            // Scroll view constraints
//            scrollView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 16),
//            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//        ])
//
//        // Set the background color of the scrollView to black
//        scrollView.backgroundColor = .white
//
//
//        // Set the scroll view's content size to fit the content
//        headerContentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
//    }
//
//    // Function to handle back button tap and navigate back to HomeViewController
//    @objc func goBack() {
//        // If the SearchViewController is embedded within a UINavigationController
//        //                 navigationController?.popViewController(animated: true)
//        let homeViewController = HomeViewController()
//        let navController = UINavigationController(rootViewController: homeViewController) // Wrap the SignUpViewController in a navigation controller
//        navController.modalPresentationStyle = .fullScreen
//
//        _ = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(backButtonTapped))
//
//
//        self.present(navController, animated: true, completion: nil) // Present the navigation controller modally
//
//
//    }
//    @objc func backButtonTapped() {
//        self.dismiss(animated: true, completion: nil)
    }



}
