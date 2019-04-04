import UIKit
import Reusable

class AddTransactionTableViewCell: UITableViewCell, Reusable {
    
    lazy var addLabel: UILabel = {
        let label = UILabel()
        label.text = "+"
        label.textAlignment = .center
        label.font = TextStyle.titleSmall.uiFont()
        label.textColor = Color.highlight.uiColor()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setup() {
        setupView()
        setupDesign()
    }
    
    func setupDesign() {
        selectionStyle = .none
        backgroundColor = .clear
    }
}

extension AddTransactionTableViewCell: ViewCode {
    func buildViewHierarchy() {
        contentView.addSubview(addLabel)
    }
    
    func setupConstraints() {
        addLabel.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
}
