import UIKit
import SnapKit

class SummaryViewController: UIViewController {
    
    //MARK: UI Elements
    lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Background"))
        return imageView
    }()
    lazy var mainCard: MainCard = {
        let mainCard = MainCard(wallet: currentWallet)
        return mainCard
    }()
    lazy var tableViewTitleContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.highlightBackground.uiColor()
        return view
    }()
    lazy var tableViewTitleLabel: UILabel = {
        let label = UILabel()
        label.font = TextStyle.titleSmall.uiFont()
        label.textColor = Color.titleText.uiColor()
        label.textAlignment = .left
        return label
    }()
    var transactionTableView = TransactionTableView()
    var transactionTableViewDelegate: TransactionTableViewDelegate?
    var transactionTableViewDatasource: TransactionTableViewDatasource?
    
    //MARK: Properties
    var currentWallet: Wallet
    var walletRepository = WalletRepository()

    //MARK: Life Cycle
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(nibName nibNameOrNil: String? = nil , bundle nibBundleOrNil: Bundle? = nil) {
        currentWallet = walletRepository.getAll().last!
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadCurrentWallet()
        setupTransactionTableView(with: currentWallet.transactions)
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
        setupTransactionTableView(with: currentWallet.transactions)
    }
    
    func setupDesign() {
        view.backgroundColor = .white
    }
    
    func setupTableViewTitle() {
        tableViewTitleLabel.text = "Transações"
    }
    
    func setupTransactionTableView(with transactions: [Transaction]) {
        transactionTableViewDelegate = TransactionTableViewDelegate(delegate: self)
        transactionTableView.delegate = transactionTableViewDelegate
        transactionTableViewDatasource = TransactionTableViewDatasource(transactions, tableView: transactionTableView)
        transactionTableView.dataSource = transactionTableViewDatasource
        transactionTableView.reloadData()
    }
    
    func loadCurrentWallet() {
        currentWallet = walletRepository.getAll().last!
    }
    
}

//MARK: - TransactionSelectionDelegate
extension SummaryViewController: TransactionSelectionDelegate {
    func didSelectAddTransaction() {
        let vc = AddTransactionViewController(wallet: currentWallet)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func didSelect(_ transaction: Transaction) {
        let vc = AddTransactionViewController(transaction: transaction)
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - ViewCode
extension SummaryViewController: ViewCode {
    func buildViewHierarchy() {
        view.addSubview(backgroundImage)
        view.addSubview(mainCard)
        view.addSubview(tableViewTitleContainerView)
        tableViewTitleContainerView.addSubview(tableViewTitleLabel)
        view.addSubview(transactionTableView)
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
        
        transactionTableView.snp.makeConstraints { (make) in
            make.bottom.left.right.equalToSuperview()
            make.top.equalTo(tableViewTitleContainerView.snp.bottom)
        }
        
    }
}
