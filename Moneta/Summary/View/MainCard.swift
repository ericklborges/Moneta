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
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = TextStyle.highlightBig.uiFont()
        label.textColor = Color.offWihte.uiColor()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dailyValueLabelContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.highlightBackground.uiColor()
        return view
    }()
    
    lazy var dailyValueLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = TextStyle.detail.uiFont()
        label.textColor = Color.highlight.uiColor()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: Properties
    var title: String
    var wallet: Wallet
    
    //MARK: Life Cycle
    required init?(coder aDecoder: NSCoder) {
        fatalError("MainCard.init(coder:) has not been implemented")
    }
    
    init(with title: String = "Saldo", wallet: Wallet) {
        self.title = title
        self.wallet = wallet
        super.init(frame: .zero)
        setup()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    //MARK: Setup
    func setup() {
        setupTitleLabel()
        setupBalanceLabel()
        setupDailyValueLabel()
    }
    
    private func setupDesing() {
        backgroundColor = Color.darkBackground.uiColor()
        layer.cornerRadius = 5
    }
    
    private func setupTitleLabel() {
        titleLabel.text = title
    }
    
    private func setupBalanceLabel() {
        balanceLabel.text = "R$ 840,00"
    }
    
    private func setupDailyValueLabel() {
        dailyValueLabel.text = "R$ 840,00 / dia"
    }

}

extension MainCard: ViewCode {
    internal func buildViewHierarchy() {
        addSubview(titleLabel)
        addSubview(balanceLabel)
        addSubview(dailyValueLabelContainerView)
        dailyValueLabelContainerView.addSubview(dailyValueLabel)
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
        
        dailyValueLabelContainerView.snp.makeConstraints { (make) in
            make.top.equalTo(balanceLabel.snp.bottom).offset(margin)
            make.bottom.equalToSuperview().inset(margin)
            make.centerX.equalToSuperview()
            make.width.greaterThanOrEqualToSuperview().multipliedBy(0.2)
        }
        
        dailyValueLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(margin)
            make.right.equalToSuperview().inset(margin)
            make.centerX.centerY.equalToSuperview()
        }
        
    }
    
    internal func setupAdditionalConfigurations() {
        setupDesing()
    }
}
