import UIKit
import SnapKit

class SummaryViewController: UIViewController {
    
    var currentWallet: Wallet!
    
    lazy var mainCard: MainCard = {
        let mainCard = MainCard(wallet: currentWallet)
        mainCard.translatesAutoresizingMaskIntoConstraints = false
        return mainCard
    }()
    
    override func viewDidLoad() {
        setup()
    }

    func setup() {
        currentWallet = Wallet(limit: 840,
                               label: "Abril",
                               startDate: Date(),
                               endDate: Date(timeIntervalSinceNow: 60*60*24*30))
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
