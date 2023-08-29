import UIKit

class CreateStudyViewController: UIViewController {
    
    private let allGenderButton = UIButton(type: .system)
    private let maleOnlyButton = UIButton(type: .system)
    private let femaleOnlyButton = UIButton(type: .system)
    
    private let contactButton = UIButton(type: .system)
    private let untactButton = UIButton(type: .system)
    private let mixmeetButton = UIButton(type: .system)
    
    private let haveFineButton = UIButton(type: .system)
    private let noFineButton = UIButton(type: .system)

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
        
        // "스터디 만들기" label
        let createStudyLabel = UILabel()
        createStudyLabel.text = "스터디 만들기"
        createStudyLabel.textColor = .white
        createStudyLabel.font = UIFont.boldSystemFont(ofSize: 18)
        createStudyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // "임시저장" label
        let saveLabel = UILabel()
        saveLabel.text = "임시저장"
        saveLabel.textColor = UIColor(hexCode: "#FF5530")
        saveLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Spacer view to push saveLabel to the right
        let spacerView = UIView()
        spacerView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the views to the header stack view
        headerStackView.addArrangedSubview(backButton)
        headerStackView.addArrangedSubview(createStudyLabel)
        headerStackView.addArrangedSubview(spacerView)
        headerStackView.addArrangedSubview(saveLabel)
        
        // Add the header stack view to the view
        view.addSubview(headerStackView)

        
        let headerContentStackView = UIStackView()
        headerContentStackView.axis = .vertical
        headerContentStackView.spacing = 40
        headerContentStackView.translatesAutoresizingMaskIntoConstraints = false
      
        ///////////////////  chatLink
        let chatLinkStackView = UIStackView()
        chatLinkStackView.axis = .vertical
        chatLinkStackView.spacing = 16
        chatLinkStackView.translatesAutoresizingMaskIntoConstraints = false
        // Add the buttons stack view to the header content stack view
        headerContentStackView.addArrangedSubview(chatLinkStackView)
        
        // Create a label for "채팅방 링크"
        let chatLinkLabel = UILabel()
        chatLinkLabel.text = "채팅방 링크"
        chatLinkLabel.textColor = .black
        chatLinkLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        chatLinkLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Create a label for description
        let descriptionLabel = UILabel()
        descriptionLabel.text = "참여코드가 없는 카카오톡 오픈 채팅방 링크로 첨부"
        descriptionLabel.textColor = .gray
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Create a text field for chat link input
        let chatLinkTextField = UITextField()
        chatLinkTextField.placeholder = "채팅방 링크를 첨부해 주세요"
        chatLinkTextField.textColor = .gray
        chatLinkTextField.font = UIFont.systemFont(ofSize: 14)
        chatLinkTextField.borderStyle = .roundedRect  // Add rounded border
        chatLinkTextField.translatesAutoresizingMaskIntoConstraints = false
    
        let chatLinkDividerLine = UIView()
        chatLinkDividerLine.backgroundColor = UIColor(hexCode: "#F3F5F6")
        chatLinkDividerLine.translatesAutoresizingMaskIntoConstraints = false
        chatLinkDividerLine.heightAnchor.constraint(equalToConstant: 10).isActive = true // Adjust the thickness here

        
        // Add UI elements to the headerContentStackView
        chatLinkStackView.addArrangedSubview(chatLinkLabel)
        chatLinkStackView.addArrangedSubview(descriptionLabel)
        chatLinkStackView.addArrangedSubview(chatLinkTextField)
        headerContentStackView.addArrangedSubview(chatLinkDividerLine)
        
        //////////////////////// studyinfo
        let studyinfoStackView = UIStackView()
        studyinfoStackView.axis = .vertical
        studyinfoStackView.spacing = 16
        studyinfoStackView.translatesAutoresizingMaskIntoConstraints = false
        // Add the buttons stack view to the header content stack view
        headerContentStackView.addArrangedSubview(studyinfoStackView)
        
        // Create a label for "스터디 제목"
        let studytitleLabel = UILabel()
        studytitleLabel.text = "스터디 제목"
        studytitleLabel.textColor = .black
        studytitleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        studytitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Create a text field for chat link input
        let studytitleTextField = UITextField()
        studytitleTextField.placeholder = "제목입니다"
        studytitleTextField.textColor = .gray
        studytitleTextField.font = UIFont.systemFont(ofSize: 14)
        studytitleTextField.borderStyle = .roundedRect  // Add rounded border
        studytitleTextField.translatesAutoresizingMaskIntoConstraints = false
        
        // Create a label for "채팅방 링크"
        let studyproduceLabel = UILabel()
        studyproduceLabel.text = "스터디 소개"
        studyproduceLabel.textColor = .black
        studyproduceLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        studyproduceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Create a text field for chat link input
        let studyproduceTextField = UITextField()
        studyproduceTextField.placeholder = "스터디에 대해 알려주세요"
        studyproduceTextField.textColor = .gray
        studyproduceTextField.font = UIFont.systemFont(ofSize: 14)
        studyproduceTextField.borderStyle = .roundedRect  // Add rounded border
        studyproduceTextField.translatesAutoresizingMaskIntoConstraints = false
        
        // Adjust the height constraint of the studyproduceTextField
        studyproduceTextField.heightAnchor.constraint(equalToConstant: 150).isActive = true
        // Set the contentVerticalAlignment to .top
        studyproduceTextField.contentVerticalAlignment = .top
    
        let studyinfoStackViewDividerLine = UIView()
        studyinfoStackViewDividerLine.backgroundColor = UIColor(hexCode: "#F3F5F6")
        studyinfoStackViewDividerLine.translatesAutoresizingMaskIntoConstraints = false
        studyinfoStackViewDividerLine.heightAnchor.constraint(equalToConstant: 10).isActive = true // Adjust the thickness here

        
        // Add UI elements to the headerContentStackView
        studyinfoStackView.addArrangedSubview(studytitleLabel)
        studyinfoStackView.addArrangedSubview(studytitleTextField)
        studyinfoStackView.addArrangedSubview(studyproduceLabel)
        studyinfoStackView.addArrangedSubview(studyproduceTextField)
        headerContentStackView.addArrangedSubview(studyinfoStackViewDividerLine)
        
        //////////////////////// category
        let categoryStackView = UIStackView()
        categoryStackView.axis = .vertical
        categoryStackView.spacing = 16
        categoryStackView.translatesAutoresizingMaskIntoConstraints = false
        // Add the buttons stack view to the header content stack view
        headerContentStackView.addArrangedSubview(categoryStackView)
        
        let categoryTitleStackView = UIStackView()
        categoryTitleStackView.axis = .horizontal
        categoryTitleStackView.spacing = 16
        categoryTitleStackView.translatesAutoresizingMaskIntoConstraints = false
        // Add the buttons stack view to the header content stack view
        categoryStackView.addArrangedSubview(categoryTitleStackView)
        
        // Create a label for "스터디 제목"
        let categoryLabel = UILabel()
        categoryLabel.text = "카테고리 선택"
        categoryLabel.textColor = .black
        categoryLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Create a button with ">" image
        let categoryButton = UIButton(type: .system)
        categoryButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        categoryButton.tintColor = .black
        categoryButton.translatesAutoresizingMaskIntoConstraints = false
        
        categoryTitleStackView.addArrangedSubview(categoryLabel)
        categoryTitleStackView.addArrangedSubview(categoryButton)
    
        
        // Create a label for description
        let description2Label = UILabel()
        description2Label.text = "혹시 찾는 카테고리가 없으시다면, 새롭게 추가해주세요!"
        description2Label.textColor = UIColor(hexCode: "#49545C")
        description2Label.font = UIFont.systemFont(ofSize: 14)
        description2Label.translatesAutoresizingMaskIntoConstraints = false
        
        // Create a text field for chat link input
        let categoryTextField = UITextField()
        categoryTextField.placeholder = "새 카테고리 이름을 알려주세요"
        categoryTextField.textColor = .gray
        categoryTextField.font = UIFont.systemFont(ofSize: 14)
        categoryTextField.borderStyle = .roundedRect  // Add rounded border
        categoryTextField.translatesAutoresizingMaskIntoConstraints = false
        
        // Create the "추가" button
        let addButton = UIButton(type: .system)
        addButton.setTitle("추가", for: .normal)
        addButton.setTitleColor(UIColor(hexCode: "#A1AAB0"), for: .normal)
        addButton.backgroundColor = UIColor(hexCode: "#E9EBED")
        addButton.layer.cornerRadius = 2
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        categoryTextField.addSubview(addButton)
        
        // Create a label for description
        let description3Label = UILabel()
        description3Label.text = "18자리 이하, 특수문자 포함 불가"
        description3Label.textColor = UIColor(hexCode: "#A1AAB0")
        description3Label.font = UIFont.systemFont(ofSize: 12)
        description3Label.translatesAutoresizingMaskIntoConstraints = false
        
        let associatedepartStackView = UIStackView()
        associatedepartStackView.axis = .horizontal
        associatedepartStackView.spacing = 16
        associatedepartStackView.translatesAutoresizingMaskIntoConstraints = false
        // Add the buttons stack view to the header content stack view
        categoryStackView.addArrangedSubview(associatedepartStackView)
        
        // Create a label for "채팅방 링크"
        let associatedepartLabel = UILabel()
        associatedepartLabel.text = "관련 학과 선택"
        associatedepartLabel.textColor = .black
        associatedepartLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        associatedepartLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Create a button with ">" image
        let associatedepartButton = UIButton(type: .system)
        associatedepartButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        associatedepartButton.tintColor = .black
        associatedepartButton.translatesAutoresizingMaskIntoConstraints = false

        associatedepartStackView.addArrangedSubview(associatedepartLabel)
        associatedepartStackView.addArrangedSubview(associatedepartButton)
        
    
        let categoryStackViewDividerLine = UIView()
        categoryStackViewDividerLine.backgroundColor = UIColor(hexCode: "#F3F5F6")
        categoryStackViewDividerLine.translatesAutoresizingMaskIntoConstraints = false
        categoryStackViewDividerLine.heightAnchor.constraint(equalToConstant: 10).isActive = true // Adjust the thickness here

        
        // Add UI elements to the headerContentStackView
        categoryStackView.addArrangedSubview(categoryTitleStackView)
        categoryStackView.addArrangedSubview(description2Label)
        categoryStackView.addArrangedSubview(categoryTextField)
        categoryStackView.addArrangedSubview(description3Label)
        categoryStackView.addArrangedSubview(associatedepartStackView)
        headerContentStackView.addArrangedSubview(categoryStackViewDividerLine)
        
        //////////////////////// studymember
        let studymemberStackView = UIStackView()
        studymemberStackView.axis = .vertical
        studymemberStackView.spacing = 16
        studymemberStackView.translatesAutoresizingMaskIntoConstraints = false
        // Add the buttons stack view to the header content stack view
        headerContentStackView.addArrangedSubview(studymemberStackView)
        
        // Create a label for "스터디 팀원"
        let studymemberLabel = UILabel()
        studymemberLabel.text = "스터디 팀원"
        studymemberLabel.textColor = .black
        studymemberLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        studymemberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let grayDividerLine = UIView()
        grayDividerLine.backgroundColor = UIColor(hexCode: "#F3F5F6")
        grayDividerLine.translatesAutoresizingMaskIntoConstraints = false
        grayDividerLine.heightAnchor.constraint(equalToConstant: 2).isActive = true // Adjust the thickness here

        // Create a label for "인원"
        let studymembercountLabel = UILabel()
        studymembercountLabel.text = "인원"
        studymembercountLabel.textColor = .black
        studymembercountLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        studymembercountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Create a label for description
        let description4Label = UILabel()
        description4Label.text = "최대 50명 참여 가능"
        description4Label.textColor = UIColor(hexCode: "#A1AAB0")
        description4Label.font = UIFont.systemFont(ofSize: 12)
        description4Label.translatesAutoresizingMaskIntoConstraints = false
        
        // Create a text field for chat link input
        let studymemberTextField = UITextField()
        studymemberTextField.placeholder = "인원을 알려주세요"
        studymemberTextField.textColor = .gray
        studymemberTextField.font = UIFont.systemFont(ofSize: 14)
        studymemberTextField.borderStyle = .roundedRect  // Add rounded border
        studymemberTextField.translatesAutoresizingMaskIntoConstraints = false
        
        // Create a label for
        let countLabel = UILabel()
        countLabel.text = "명"
        countLabel.textColor = UIColor(hexCode: "#68737D")
        countLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        studymemberTextField.addSubview(countLabel)
        
        // Create a label for "성별"
        let genderLabel = UILabel()
        genderLabel.text = "성별"
        genderLabel.textColor = .black
        genderLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Create a label for description
        let description5Label = UILabel()
        description5Label.text = "참여자의 성별 선택"
        description5Label.textColor = UIColor(hexCode: "#A1AAB0")
        description5Label.font = UIFont.systemFont(ofSize: 12)
        description5Label.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the buttons to a horizontal stack view
        let genderButtonsStackView = UIStackView()
        genderButtonsStackView.axis = .horizontal
        genderButtonsStackView.spacing = 16
        genderButtonsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Create the three buttons
        allGenderButton.setTitle("남녀무관", for: .normal)
        allGenderButton.setTitleColor(UIColor(hexCode: "#A1AAB0"), for: .normal)
        allGenderButton.layer.borderWidth = 1
        allGenderButton.layer.borderColor = UIColor(hexCode: "#D8DCDE").cgColor
        allGenderButton.layer.cornerRadius = 5
        allGenderButton.backgroundColor = .white
        allGenderButton.translatesAutoresizingMaskIntoConstraints = false
        allGenderButton.addTarget(self, action: #selector(genderButtonTapped(_:)), for: .touchUpInside)


        maleOnlyButton.setTitle("남자만", for: .normal)
        maleOnlyButton.setTitleColor(UIColor(hexCode: "#A1AAB0"), for: .normal)
        maleOnlyButton.layer.borderWidth = 1
        maleOnlyButton.layer.borderColor = UIColor(hexCode: "#D8DCDE").cgColor
        maleOnlyButton.layer.cornerRadius = 5
        maleOnlyButton.backgroundColor = .white
        maleOnlyButton.translatesAutoresizingMaskIntoConstraints = false
        maleOnlyButton.addTarget(self, action: #selector(genderButtonTapped(_:)), for: .touchUpInside)

        femaleOnlyButton.setTitle("여자만", for: .normal)
        femaleOnlyButton.setTitleColor(UIColor(hexCode: "#A1AAB0"), for: .normal)
        femaleOnlyButton.layer.borderWidth = 1
        femaleOnlyButton.layer.borderColor = UIColor(hexCode: "#D8DCDE").cgColor
        femaleOnlyButton.layer.cornerRadius = 5
        femaleOnlyButton.backgroundColor = .white
        femaleOnlyButton.translatesAutoresizingMaskIntoConstraints = false
        femaleOnlyButton.addTarget(self, action: #selector(genderButtonTapped(_:)), for: .touchUpInside)
       
        genderButtonsStackView.addArrangedSubview(allGenderButton)
        genderButtonsStackView.addArrangedSubview(maleOnlyButton)
        genderButtonsStackView.addArrangedSubview(femaleOnlyButton)
        

        let studymemberStackViewDividerLine = UIView()
        studymemberStackViewDividerLine.backgroundColor = UIColor(hexCode: "#F3F5F6")
        studymemberStackViewDividerLine.translatesAutoresizingMaskIntoConstraints = false
        studymemberStackViewDividerLine.heightAnchor.constraint(equalToConstant: 10).isActive = true // Adjust the thickness here

        
        // Add UI elements to the headerContentStackView
        studymemberStackView.addArrangedSubview(studymemberLabel)
        studymemberStackView.addArrangedSubview(grayDividerLine)
        studymemberStackView.addArrangedSubview(studymembercountLabel)
        studymemberStackView.addArrangedSubview(description4Label)
        studymemberStackView.addArrangedSubview(studymemberTextField)
        studymemberStackView.addArrangedSubview(genderLabel)
        studymemberStackView.addArrangedSubview(description5Label)
        studymemberStackView.addArrangedSubview(genderButtonsStackView)
        headerContentStackView.addArrangedSubview(studymemberStackViewDividerLine)
        
        //////////////////////// studymethod
        let studymethodStackView = UIStackView()
        studymethodStackView.axis = .vertical
        studymethodStackView.spacing = 16
        studymethodStackView.translatesAutoresizingMaskIntoConstraints = false
        // Add the buttons stack view to the header content stack view
        headerContentStackView.addArrangedSubview(studymethodStackView)

        // Create a label for "스터디 방식"
        let studymethodLabel = UILabel()
        studymethodLabel.text = "스터디 방식"
        studymethodLabel.textColor = .black
        studymethodLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        studymethodLabel.translatesAutoresizingMaskIntoConstraints = false

        let grayDividerLine2 = UIView()
        grayDividerLine2.backgroundColor = UIColor(hexCode: "#F3F5F6")
        grayDividerLine2.translatesAutoresizingMaskIntoConstraints = false
        grayDividerLine2.heightAnchor.constraint(equalToConstant: 2).isActive = true // Adjust the thickness here

        // Create a label for "인원"
        let meetLabel = UILabel()
        meetLabel.text = "대면여부"
        meetLabel.textColor = .black
        meetLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        meetLabel.translatesAutoresizingMaskIntoConstraints = false

        // Create a label for description
        let description6Label = UILabel()
        description6Label.text = "혼합일 경우, 관련 내용에 대한 계획을 소개에 적어주세요"
        description6Label.textColor = UIColor(hexCode: "#A1AAB0")
        description6Label.font = UIFont.systemFont(ofSize: 12)
        description6Label.translatesAutoresizingMaskIntoConstraints = false

        // Add the buttons to a horizontal stack view
        let meetButtonsStackView = UIStackView()
        meetButtonsStackView.axis = .horizontal
        meetButtonsStackView.spacing = 16
        meetButtonsStackView.translatesAutoresizingMaskIntoConstraints = false

        // Create the three buttons
        contactButton.setTitle("대면", for: .normal)
        contactButton.setTitleColor(UIColor(hexCode: "#A1AAB0"), for: .normal)
        contactButton.layer.borderWidth = 1
        contactButton.layer.borderColor = UIColor(hexCode: "#D8DCDE").cgColor
        contactButton.layer.cornerRadius = 5
        contactButton.backgroundColor = .white
        contactButton.translatesAutoresizingMaskIntoConstraints = false
        contactButton.addTarget(self, action: #selector(meetButtonTapped(_:)), for: .touchUpInside)

        untactButton.setTitle("비대면", for: .normal)
        untactButton.setTitleColor(UIColor(hexCode: "#A1AAB0"), for: .normal)
        untactButton.layer.borderWidth = 1
        untactButton.layer.borderColor = UIColor(hexCode: "#D8DCDE").cgColor
        untactButton.layer.cornerRadius = 5
        untactButton.backgroundColor = .white
        untactButton.translatesAutoresizingMaskIntoConstraints = false
        untactButton.addTarget(self, action: #selector(meetButtonTapped(_:)), for: .touchUpInside)


        mixmeetButton.setTitle("혼합", for: .normal)
        mixmeetButton.setTitleColor(UIColor(hexCode: "#A1AAB0"), for: .normal)
        mixmeetButton.layer.borderWidth = 1
        mixmeetButton.layer.borderColor = UIColor(hexCode: "#D8DCDE").cgColor
        mixmeetButton.layer.cornerRadius = 5
        mixmeetButton.backgroundColor = .white
        mixmeetButton.translatesAutoresizingMaskIntoConstraints = false
        mixmeetButton.addTarget(self, action: #selector(meetButtonTapped(_:)), for: .touchUpInside)


        meetButtonsStackView.addArrangedSubview(contactButton)
        meetButtonsStackView.addArrangedSubview(untactButton)
        meetButtonsStackView.addArrangedSubview(mixmeetButton)

        // Create a label for "벌금"
        let fineLabel = UILabel()
        fineLabel.text = "벌금"
        fineLabel.textColor = .black
        fineLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        fineLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add check buttons and labels to a horizontal stack view
        let fineButtonsStackView = UIStackView()
        fineButtonsStackView.axis = .horizontal
        fineButtonsStackView.spacing = 10
        fineButtonsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Create check buttons
        
        haveFineButton.setImage(UIImage(named: "circle"), for: .normal) // Replace with your unchecked image
        haveFineButton.setImage(UIImage(named: "checkmark.circle.fill"), for: .selected) // Replace with your checked image
        haveFineButton.translatesAutoresizingMaskIntoConstraints = false
        haveFineButton.addTarget(self, action: #selector(haveFineButtonTapped(_:)), for: .touchUpInside)

      
        noFineButton.setImage(UIImage(named: "circle"), for: .normal) // Replace with your unchecked image
        noFineButton.setImage(UIImage(named: "checkmark.circle.fill"), for: .selected) // Replace with your checked image
        noFineButton.translatesAutoresizingMaskIntoConstraints = false
        noFineButton.addTarget(self, action: #selector(noFineButtonTapped(_:)), for: .touchUpInside)

        // Create labels for check buttons
        let haveFineLabel = UILabel()
        haveFineLabel.text = "있어요"
        haveFineLabel.textColor = .black
        haveFineLabel.translatesAutoresizingMaskIntoConstraints = false

        let noFineLabel = UILabel()
        noFineLabel.text = "없어요"
        noFineLabel.textColor = .black
        noFineLabel.translatesAutoresizingMaskIntoConstraints = false
        
        fineButtonsStackView.addArrangedSubview(haveFineButton)
        fineButtonsStackView.addArrangedSubview(haveFineLabel)
        fineButtonsStackView.addArrangedSubview(noFineButton)
        fineButtonsStackView.addArrangedSubview(noFineLabel)
        
      
        
        let studymethodStackViewDividerLine = UIView()
        studymethodStackViewDividerLine.backgroundColor = UIColor(hexCode: "#F3F5F6")
        studymethodStackViewDividerLine.translatesAutoresizingMaskIntoConstraints = false
        studymethodStackViewDividerLine.heightAnchor.constraint(equalToConstant: 10).isActive = true // Adjust the thickness here


        // Add UI elements to the headerContentStackView
        studymethodStackView.addArrangedSubview(studymethodLabel)
        studymethodStackView.addArrangedSubview(grayDividerLine2)
        studymethodStackView.addArrangedSubview(meetLabel)
        studymethodStackView.addArrangedSubview(description6Label)
        studymethodStackView.addArrangedSubview(meetButtonsStackView)
        studymethodStackView.addArrangedSubview(fineLabel)
        studymethodStackView.addArrangedSubview(fineButtonsStackView)
        headerContentStackView.addArrangedSubview(studymethodStackViewDividerLine)
        
        //////////////////////// period
        let periodStackView = UIStackView()
        periodStackView.axis = .vertical
        periodStackView.spacing = 16
        periodStackView.translatesAutoresizingMaskIntoConstraints = false
        // Add the buttons stack view to the header content stack view
        headerContentStackView.addArrangedSubview(periodStackView)
        
        // Create a label for "기간"
        let periodLabel = UILabel()
        periodLabel.text = "기간"
        periodLabel.textColor = .black
        periodLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        periodLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let grayDividerLine3 = UIView()
        grayDividerLine3.backgroundColor = UIColor(hexCode: "#F3F5F6")
        grayDividerLine3.translatesAutoresizingMaskIntoConstraints = false
        grayDividerLine3.heightAnchor.constraint(equalToConstant: 2).isActive = true // Adjust the thickness here

        // Create a label for "시작하는 날"
        let startLabel = UILabel()
        startLabel.text = "시작하는 날"
        startLabel.textColor = .black
        startLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        startLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Create a label for "성별"
        let endLabel = UILabel()
        endLabel.text = "종료하는 날"
        endLabel.textColor = .black
        endLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        endLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
    
        
        // Add UI elements to the headerContentStackView
        periodStackView.addArrangedSubview(periodLabel)
        periodStackView.addArrangedSubview(grayDividerLine3)
        periodStackView.addArrangedSubview(startLabel)
        periodStackView.addArrangedSubview(endLabel)
      
        
        
        
        // Create a scroll view to make the content scrollable
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(headerContentStackView)
        view.addSubview(scrollView)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            // Header stack view constraints
            headerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -40),
            headerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            // "스터디 만들기" label constraints
            createStudyLabel.centerXAnchor.constraint(equalTo: headerStackView.centerXAnchor, constant: 16),
            
            // Spacer view constraints
            spacerView.widthAnchor.constraint(equalTo: headerStackView.widthAnchor, multiplier: 0.15),
           

            // "임시저장" label constraints
            saveLabel.trailingAnchor.constraint(equalTo: headerStackView.trailingAnchor),
             
   
            // Header content stack view constraints
            headerContentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30),
            headerContentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            headerContentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            headerContentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            headerContentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            //(1)채팅방링크 뷰
            // Constraints for chatLinkLabel
            chatLinkLabel.leadingAnchor.constraint(equalTo: chatLinkStackView.leadingAnchor, constant: 16),
            chatLinkLabel.trailingAnchor.constraint(equalTo: chatLinkStackView.trailingAnchor, constant: 10),
            
            // Constraints for descriptionLabel
            descriptionLabel.leadingAnchor.constraint(equalTo: chatLinkStackView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: chatLinkStackView.trailingAnchor, constant: 100),
            
            // Constraints for chatLinkTextField
            chatLinkTextField.leadingAnchor.constraint(equalTo: chatLinkStackView.leadingAnchor, constant: 16),
            chatLinkTextField.trailingAnchor.constraint(equalTo: chatLinkStackView.trailingAnchor),
            chatLinkTextField.widthAnchor.constraint(equalTo: chatLinkStackView.widthAnchor, constant: -50),
            
            //(2)스터디소개 뷰
            // Constraints for chatLinkLabel
            studytitleLabel.leadingAnchor.constraint(equalTo: studyinfoStackView.leadingAnchor, constant: 16),
            studytitleLabel.trailingAnchor.constraint(equalTo: studyinfoStackView.trailingAnchor, constant: 5),
            
            // Constraints for descriptionLabel
            studytitleTextField.leadingAnchor.constraint(equalTo: studyinfoStackView.leadingAnchor, constant: 16),
            studytitleTextField.trailingAnchor.constraint(equalTo: studyinfoStackView.trailingAnchor, constant: 100),
            
            // Constraints for chatLinkLabel
            studyproduceLabel.leadingAnchor.constraint(equalTo: studyinfoStackView.leadingAnchor, constant: 16),
            studyproduceLabel.trailingAnchor.constraint(equalTo: studyinfoStackView.trailingAnchor, constant: 10),
    
            
            // Constraints for chatLinkTextField
            studyproduceTextField.leadingAnchor.constraint(equalTo: studyinfoStackView.leadingAnchor, constant: 16),
            studyproduceTextField.trailingAnchor.constraint(equalTo: studyinfoStackView.trailingAnchor),
            studyproduceTextField.widthAnchor.constraint(equalTo: studyinfoStackView.widthAnchor, constant: -50),
            
            //(3)카테고리 뷰
            // Constraints for chatLinkLabel
            categoryTitleStackView.leadingAnchor.constraint(equalTo: categoryStackView.leadingAnchor, constant: 16),
            categoryTitleStackView.trailingAnchor.constraint(equalTo: categoryStackView.trailingAnchor),
            
            categoryButton.leadingAnchor.constraint(equalTo: categoryTitleStackView.leadingAnchor, constant: 300),
            categoryButton.trailingAnchor.constraint(equalTo: categoryTitleStackView.trailingAnchor),

            // Constraints for descriptionLabel
            description2Label.leadingAnchor.constraint(equalTo: categoryStackView.leadingAnchor, constant: 16),
            description2Label.trailingAnchor.constraint(equalTo: categoryStackView.trailingAnchor, constant: 100),
            
        
            // Constraints for chatLinkTextField
            categoryTextField.leadingAnchor.constraint(equalTo: categoryStackView.leadingAnchor, constant: 16),
            categoryTextField.trailingAnchor.constraint(equalTo: categoryStackView.trailingAnchor),
            categoryTextField.widthAnchor.constraint(equalTo: categoryStackView.widthAnchor, constant: -50),
            
            addButton.centerYAnchor.constraint(equalTo: categoryTextField.centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: categoryTextField.trailingAnchor, constant: -8),
            addButton.widthAnchor.constraint(equalToConstant: 40),
            addButton.heightAnchor.constraint(equalToConstant: 20),
            
            // Constraints for descriptionLabel
            description3Label.leadingAnchor.constraint(equalTo: categoryStackView.leadingAnchor, constant: 200),
            description3Label.trailingAnchor.constraint(equalTo: categoryStackView.trailingAnchor, constant: 100),
        
            associatedepartStackView.leadingAnchor.constraint(equalTo: categoryStackView.leadingAnchor, constant: 16),
            associatedepartStackView.trailingAnchor.constraint(equalTo: categoryStackView.trailingAnchor),
            
            associatedepartButton.leadingAnchor.constraint(equalTo: associatedepartStackView.leadingAnchor, constant: 300),
            associatedepartButton.trailingAnchor.constraint(equalTo: associatedepartStackView.trailingAnchor),
            
            //(4)스터디멤버 뷰
            // Constraints for chatLinkLabel
            studymemberLabel.leadingAnchor.constraint(equalTo: studymemberStackView.leadingAnchor, constant: 16),
            studymemberLabel.trailingAnchor.constraint(equalTo: studymemberStackView.trailingAnchor, constant: 5),
            
            // Constraints for chatLinkLabel
            grayDividerLine.leadingAnchor.constraint(equalTo: studymemberStackView.leadingAnchor, constant: 0),
            grayDividerLine.trailingAnchor.constraint(equalTo: studymemberStackView.trailingAnchor, constant: 10),
            
            studymembercountLabel.leadingAnchor.constraint(equalTo: studymemberStackView.leadingAnchor, constant: 16),
            studymembercountLabel.trailingAnchor.constraint(equalTo: studymemberStackView.trailingAnchor, constant: 5),
        
            
            // Constraints for descriptionLabel
            description4Label.leadingAnchor.constraint(equalTo: studymemberStackView.leadingAnchor, constant: 16),
            description4Label.trailingAnchor.constraint(equalTo: studymemberStackView.trailingAnchor, constant: 100),
            
            // Constraints for chatLinkTextField
            studymemberTextField.leadingAnchor.constraint(equalTo: studymemberStackView.leadingAnchor, constant: 16),
            studymemberTextField.trailingAnchor.constraint(equalTo: studymemberStackView.trailingAnchor),
            studymemberTextField.widthAnchor.constraint(equalTo: studymemberStackView.widthAnchor, constant: -50),
            
            countLabel.centerYAnchor.constraint(equalTo: studymemberTextField.centerYAnchor),
            countLabel.trailingAnchor.constraint(equalTo: studymemberTextField.trailingAnchor, constant: -8),
            countLabel.widthAnchor.constraint(equalToConstant: 20),
            countLabel.heightAnchor.constraint(equalToConstant: 20),
            
            // Constraints for chatLinkLabel
            genderLabel.leadingAnchor.constraint(equalTo: studymemberStackView.leadingAnchor, constant: 16),
            genderLabel.trailingAnchor.constraint(equalTo: studymemberStackView.trailingAnchor, constant: 10),
            
            
            description5Label.leadingAnchor.constraint(equalTo: studymemberStackView.leadingAnchor, constant: 16),
            description5Label.trailingAnchor.constraint(equalTo: studymemberStackView.trailingAnchor, constant: 10),
    
            genderButtonsStackView.trailingAnchor.constraint(equalTo: studymemberStackView.trailingAnchor, constant: -16),
            genderButtonsStackView.topAnchor.constraint(equalTo: description5Label.bottomAnchor, constant: 8),
            genderButtonsStackView.heightAnchor.constraint(equalToConstant: 30),

            allGenderButton.widthAnchor.constraint(equalToConstant: 100),
            maleOnlyButton.widthAnchor.constraint(equalToConstant: 80),
            femaleOnlyButton.widthAnchor.constraint(equalToConstant: 80),
            
            //(5)스터디방식 뷰
            // Constraints for chatLinkLabel
            studymethodLabel.leadingAnchor.constraint(equalTo: studymethodStackView.leadingAnchor, constant: 16),
            studymethodLabel.trailingAnchor.constraint(equalTo: studymethodStackView.trailingAnchor, constant: 5),


            meetLabel.leadingAnchor.constraint(equalTo: studymethodStackView.leadingAnchor, constant: 16),
            meetLabel.trailingAnchor.constraint(equalTo: studymethodStackView.trailingAnchor, constant: 5),


            // Constraints for descriptionLabel
            description6Label.leadingAnchor.constraint(equalTo: studymethodStackView.leadingAnchor, constant: 16),
            description6Label.trailingAnchor.constraint(equalTo: studymethodStackView.trailingAnchor, constant: 100),

//            meetButtonsStackView.trailingAnchor.constraint(equalTo: studymethodStackView.trailingAnchor, constant: -16),
//            meetButtonsStackView.topAnchor.constraint(equalTo: studymethodStackView.bottomAnchor, constant: 8),
//            meetButtonsStackView.heightAnchor.constraint(equalToConstant: 30),
//
            contactButton.widthAnchor.constraint(equalToConstant: 80),
            untactButton.widthAnchor.constraint(equalToConstant: 100),
            mixmeetButton.widthAnchor.constraint(equalToConstant: 80),
            
            fineLabel.leadingAnchor.constraint(equalTo: studymethodStackView.leadingAnchor, constant: 16),
            fineLabel.trailingAnchor.constraint(equalTo: studymethodStackView.trailingAnchor, constant: 100),


            // Constraints for chatLinkLabel
            grayDividerLine2.leadingAnchor.constraint(equalTo: studymethodStackView.leadingAnchor, constant: 0),
            grayDividerLine2.trailingAnchor.constraint(equalTo: studymethodStackView.trailingAnchor, constant: 10),
            
            //(6)스터디기간 뷰
            // Constraints for chatLinkLabel
            periodLabel.leadingAnchor.constraint(equalTo: periodStackView.leadingAnchor, constant: 16),
            periodLabel.trailingAnchor.constraint(equalTo: periodStackView.trailingAnchor, constant: 5),
            
            // Constraints for chatLinkLabel
            grayDividerLine3.leadingAnchor.constraint(equalTo: periodStackView.leadingAnchor, constant: 0),
            grayDividerLine3.trailingAnchor.constraint(equalTo: periodStackView.trailingAnchor, constant: 10),
            
            // Constraints for chatLinkLabel
            startLabel.leadingAnchor.constraint(equalTo: periodStackView.leadingAnchor, constant: 16),
            startLabel.trailingAnchor.constraint(equalTo: periodStackView.trailingAnchor, constant: 10),
            // Constraints for chatLinkLabel
            endLabel.leadingAnchor.constraint(equalTo: periodStackView.leadingAnchor, constant: 16),
            endLabel.trailingAnchor.constraint(equalTo: periodStackView.trailingAnchor, constant: 10),


        
            
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

    @objc func haveFineButtonTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        noFineButton.isSelected = !sender.isSelected
    }

    @objc func noFineButtonTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        haveFineButton.isSelected = !sender.isSelected
    }
    
    
    @objc func categoryArrowButtonTapped() {
        // Handle ">" button tap for 카테고리 선택
        // Add your code to navigate or perform desired action here
    }

    @objc func addButtonTapped() {
        // Handle "추가" button tap
        // Add your code to perform desired action here
    }

    @objc func departmentArrowButtonTapped() {
        // Handle ">" button tap for 관련 학과 선택
        // Add your code to navigate or perform desired action here
    }
    
    @objc func genderButtonTapped(_ sender: UIButton) {
        // Reset colors of all buttons
        allGenderButton.backgroundColor = .white
        allGenderButton.setTitleColor(.gray, for: .normal)
        maleOnlyButton.backgroundColor = .white
        maleOnlyButton.setTitleColor(.gray, for: .normal)
        femaleOnlyButton.backgroundColor = .white
        femaleOnlyButton.setTitleColor(.gray, for: .normal)
        
        // Set the tapped button to orange background
        sender.backgroundColor = UIColor(hexCode: "#FF5530")
        sender.setTitleColor(.white, for: .normal)
    }
    
    @objc func meetButtonTapped(_ sender: UIButton) {
        // Reset colors of all buttons
        contactButton.backgroundColor = .white
        contactButton.setTitleColor(.gray, for: .normal)
        untactButton.backgroundColor = .white
        untactButton.setTitleColor(.gray, for: .normal)
        mixmeetButton.backgroundColor = .white
        mixmeetButton.setTitleColor(.gray, for: .normal)
        
        // Set the tapped button to orange background
        sender.backgroundColor = UIColor(hexCode: "#FF5530")
        sender.setTitleColor(.white, for: .normal)
    }
    
    
    
    // Function to handle back button tap and navigate back to HomeViewController
     @objc func goBack() {
         // If the SearchViewController is embedded within a UINavigationController
//                 navigationController?.popViewController(animated: true)
         let studyViewController = StudyViewController()
         let navController = UINavigationController(rootViewController: studyViewController) // Wrap the SignUpViewController in a navigation controller
         navController.modalPresentationStyle = .fullScreen
         
         _ = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(backButtonTapped))
       
         
         self.present(navController, animated: true, completion: nil) // Present the navigation controller modally

         
     }
     @objc func backButtonTapped() {
         self.dismiss(animated: true, completion: nil)
     }
         
 
    
}
