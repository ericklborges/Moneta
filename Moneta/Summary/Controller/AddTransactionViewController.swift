import UIKit
import SnapKit

class AddTransactionViewController: UIViewController {
    
    //MARK: UI Elements
    lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Background"))
        return imageView
    }()
    lazy var titleTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "Título"
        textField.keyboardType = .default
        textField.textColor = Color.titleText.uiColor()
        return textField
    }()
    lazy var valueTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "Value"
        textField.keyboardType = .decimalPad
        textField.textColor = Color.titleText.uiColor()
        return textField
    }()
    lazy var originTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "Origem"
        textField.keyboardType = .default
        textField.textColor = Color.titleText.uiColor()
        return textField
    }()
    lazy var dateTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "Date"
        textField.textColor = Color.titleText.uiColor()
        return textField
    }()
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker(frame: .zero)
        datePicker.datePickerMode = .date
        return datePicker
    }()
    
    //MARK: Properties
    var wallet: Wallet?
    var walletRepository = WalletRepository()
    var transaction: Transaction?
    var transactionRepository = TransactionRepository()
    
    //MARK: Life Cycle
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(wallet: Wallet) {
        super.init(nibName: nil, bundle: nil)
        self.wallet = wallet
        setup()
    }
    
    init(transaction: Transaction) {
        super.init(nibName: nil, bundle: nil)
        self.transaction = transaction
        setup()
    }
    
    //MARK: Setup
    private func setup() {
        setupView()
        setupDesign()
        setupTextFields()
        setupNavbarDoneButton()
        setupDatePicker()
    }
    
    private func setupDesign() {
        view.backgroundColor = .white
    }
    
    private func setupTextFields() {
        titleTextField.delegate = self
        titleTextField.text = transaction?.title
        
        valueTextField.delegate = self
        valueTextField.text = transaction?.value.asString()
        
        originTextField.delegate = self
        originTextField.text = transaction?.origin
        
        dateTextField.delegate = self
        dateTextField.inputView = datePicker
        dateTextField.text = transaction?.date.asString()
    }
    
    private func setupNavbarDoneButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(tapDone))
    }
    
    private func setupDatePicker() {
        datePicker.addTarget(self, action: #selector(captureDatePickerValue(sender:)), for: .valueChanged)
    }
    
    //MARK: Actions
    @objc
    func captureDatePickerValue(sender: UIDatePicker) {
        dateTextField.text = sender.date.asString()
    }
    
    @objc
    func tapDone() {
        let title = titleTextField.text ?? "-"
        let value = Double(valueTextField.text ?? "") ?? 0.0
        let origin = originTextField.text ?? "-"
        let date = dateTextField.text?.asDate() ?? Date(timeIntervalSince1970: 1)
        
        if var wallet = self.wallet {
            let newTransaction = Transaction(date: date,
                                             title: title,
                                             value: value,
                                             origin: origin)
            wallet.transactions.append(newTransaction)
            _ = walletRepository.update(wallet)
        } else if var transaction = self.transaction {
            transaction.date = date
            transaction.title = title
            transaction.value = value
            transaction.origin = origin
            _ = transactionRepository.update(transaction)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    
}

//MARK: - UITextFieldDelegate
extension AddTransactionViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

//MARK: - ViewCode
extension AddTransactionViewController: ViewCode {
    func buildViewHierarchy() {
        view.addSubview(backgroundImage)
        view.addSubview(titleTextField)
        view.addSubview(valueTextField)
        view.addSubview(originTextField)
        view.addSubview(dateTextField)
    }
    
    func setupConstraints() {
        backgroundImage.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }
        
        titleTextField.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.topMargin).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        
        valueTextField.snp.makeConstraints { (make) in
            make.top.equalTo(titleTextField.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        
        originTextField.snp.makeConstraints { (make) in
            make.top.equalTo(valueTextField.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        
        dateTextField.snp.makeConstraints { (make) in
            make.top.equalTo(originTextField.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        
    }
}
