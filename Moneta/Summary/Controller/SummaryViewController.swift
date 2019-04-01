import UIKit
import SnapKit

class SummaryViewController: UIViewController {
    
    //MARK: UI Elements
    lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Background"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var mainCard: MainCard = {
        let mainCard = MainCard(wallet: currentWallet)
        mainCard.translatesAutoresizingMaskIntoConstraints = false
        return mainCard
    }()
    
    lazy var tableViewTitleContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.highlightBackground.uiColor()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var tableViewTitleLabel: UILabel = {
        let label = UILabel()
        label.font = TextStyle.titleSmall.uiFont()
        label.textColor = Color.titleText.uiColor()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: Properties
    var currentWallet: Wallet

    //MARK: Life Cycle
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(nibName nibNameOrNil: String? = nil , bundle nibBundleOrNil: Bundle? = nil) {
        currentWallet = Wallet(limit: 840, label: "Abril", startDate: Date(), endDate: Date(timeIntervalSinceNow: 60*60*24*30))
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    //MARK: Setup
    func setup() {
        setupView()
        setupDesign()
        setupTableViewTitle()
    }

    func setupDesign() {
        view.backgroundColor = .white
    }
    
    func setupTableViewTitle() {
        tableViewTitleLabel.text = "Transações"
    }
}

extension SummaryViewController: ViewCode {
    func buildViewHierarchy() {
        view.addSubview(backgroundImage)
        view.addSubview(mainCard)
        view.addSubview(tableViewTitleContainerView)
        tableViewTitleContainerView.addSubview(tableViewTitleLabel)
    }
    
    func setupConstraints() {
        let screenHeight = UIScreen.main.bounds.height
        let margin = screenHeight * (20.0/812.0)

        backgroundImage.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }
        
        mainCard.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.topMargin).offset(screenHeight * (12.0/812.0))
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(2.0/3.0)
            make.height.equalTo(mainCard.snp.width).multipliedBy(13.0/25.0)
        }
        
        tableViewTitleContainerView.snp.makeConstraints { (make) in
            make.top.equalTo(mainCard.snp.bottom).offset(margin)
            make.left.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(40.0/812.0)
        }
        
        tableViewTitleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(margin)
            make.right.equalToSuperview().inset(margin)
            make.centerY.equalToSuperview()
        }
        
    }
}
