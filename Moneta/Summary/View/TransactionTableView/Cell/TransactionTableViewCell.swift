import UIKit
import SnapKit
import Reusable

class TransactionTableViewCell: UITableViewCell, Reusable {
    
    //MARK: UI Elements
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = TextStyle.titleSmall.uiFont()
        label.textColor = Color.titleText.uiColor()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.font = TextStyle.amountOfMoney.uiFont()
        label.textColor = Color.moneyText.uiColor()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = TextStyle.detail.uiFont()
        label.textColor = Color.detailText.uiColor()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var originLabel: UILabel = {
        let label = UILabel()
        label.font = TextStyle.detail.uiFont()
        label.textColor = Color.detailText.uiColor()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: Properties
    var transaction: Transaction?
    
    //MARK: Life Cycle
    override func prepareForReuse() {
        titleLabel.text = nil
        valueLabel.text = nil
        dateLabel.text = nil
        originLabel.text = nil
    }
    
    //MARK: Setup
    func setup(with transaction: Transaction) {
        self.transaction = transaction
        setupView()
        setupDesign()
        setupLabelsContents()
    }
    
    func setupDesign() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    func setupLabelsContents() {
        if let transaction = transaction {
            titleLabel.text = transaction.title
            valueLabel.text = "R$\(transaction.value)"
            dateLabel.text = transaction.date.asString()
            originLabel.text = transaction.origin
        }
    }
    
}

extension TransactionTableViewCell: ViewCode {
    func buildViewHierarchy() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(valueLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(originLabel)
    }
    
    func setupConstraints() {
        let screenWidth = UIScreen.main.bounds.width
        let margin = screenWidth * (20/375)
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(21)
            make.left.equalToSuperview().offset(margin)
        }
        
        valueLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(21)
            make.right.equalToSuperview().inset(margin)
        }
        
        dateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.equalTo(titleLabel.snp.left)
        }
        
        originLabel.snp.makeConstraints { (make) in
            make.top.equalTo(valueLabel.snp.bottom)
            make.right.equalTo(valueLabel.snp.right)
        }
    }
}
