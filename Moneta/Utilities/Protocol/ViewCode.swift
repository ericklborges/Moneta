import Foundation

protocol ViewCode {
    func setupView()
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfigurations()
}

extension ViewCode {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfigurations()
    }
    
    func setupAdditionalConfigurations() {}
}
