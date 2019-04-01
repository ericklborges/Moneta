import UIKit
import SnapKit

class MainCard: UIView {
    
    //MARK: UI Elements
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = TextStyle.detail.uiFont()
        label.textColor = Color.titleText.uiColor()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.font = TextStyle.highlightBig.uiFont()
        label.textColor = Color.offWihte.uiColor()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dailyValueLabel: UILabel = {
        let label = UILabel()
        label.font = TextStyle.detail.uiFont()
        label.textColor = Color.highlight.uiColor()
        label.backgroundColor = Color.highlightBackground.uiColor()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: Properties
    var title: String
    var wallet: Wallet
    
    //MARK: Life Cycle
    init(with title: String = "Saldo", wallet: Wallet) {
        self.title = title
        self.wallet = wallet
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("MainCard.init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    //MARK: Setup
    func setup() {
        setupTitleLabel()
        setupBalanceLabel()
        setupdailyValueLabel()
    }
    
    private func setupTitleLabel() {
        titleLabel.text = title
    }
    
    private func setupBalanceLabel() {
        balanceLabel.text = "R$ 840,00"
    }
    
    private func setupdailyValueLabel() {
        dailyValueLabel.text = "R$ 840,00 / dia"
    }
    
    private func setupDesing() {
        backgroundColor = Color.darkBackground.uiColor()
        layer.cornerRadius = 5
    }

}

extension MainCard: ViewCode {
    internal func buildViewHierarchy() {
        addSubview(titleLabel)
        addSubview(balanceLabel)
        addSubview(dailyValueLabel)
    }
    
    internal func setupConstraints() {
        let margin = frame.height * (12/130)

        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(margin)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(margin*2)
        }
        
        balanceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(margin)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(margin*2)
        }
        
        dailyValueLabel.snp.makeConstraints { (make) in
            make.top.equalTo(balanceLabel.snp.bottom).offset(margin)
            make.bottom.equalToSuperview().inset(margin)
            make.centerX.equalToSuperview()
            make.width.greaterThanOrEqualToSuperview().multipliedBy(0.2)
        }
        
    }
    
    internal func setupAdditionalConfigurations() {
        setupDesing()
    }
}
