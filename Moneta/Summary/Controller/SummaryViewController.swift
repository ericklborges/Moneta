import UIKit
import SnapKit

class SummaryViewController: UIViewController {
    
    var currentWallet: Wallet
    
    lazy var mainCard: MainCard = {
        let mainCard = MainCard(wallet: currentWallet)
        mainCard.translatesAutoresizingMaskIntoConstraints = false
        return mainCard
    }()
    
    //MARK: Life Cycle
    override init(nibName nibNameOrNil: String? = nil , bundle nibBundleOrNil: Bundle? = nil) {
        currentWallet = Wallet(limit: 840, label: "Abril", startDate: Date(), endDate: Date(timeIntervalSinceNow: 60*60*24*30))
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setup()
    }

    
    //MARK: Setup
    func setup() {
        setupView()
    }
    
}

extension SummaryViewController: ViewCode {
    func buildViewHierarchy() {
        view.addSubview(mainCard)
    }
    
    func setupConstraints() {
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width

        mainCard.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.topMargin).offset(screenHeight * (12.0/812.0))
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(2.0/3.0)
            make.height.equalTo(mainCard.snp.width).multipliedBy(13.0/25.0)
        }
    }
    
    func setupAdditionalConfigurations() {
        view.backgroundColor = .white
    }
}
