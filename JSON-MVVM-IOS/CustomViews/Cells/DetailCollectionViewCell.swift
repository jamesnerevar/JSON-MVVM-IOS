//
//  DetailCollectionViewCell.swift
//  JSON-MVVM-IOS
//
//  Created by James Jasenia on 10/12/20.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    
    // MARK:  Properties
    static public let reuseID: String = "DetailCollectionViewCell"
    
    // MARK:  UI Properties
    public lazy var summaryDescriptionLabel: GenericLabel = {
        let label = GenericLabel(fontSize: 20, fontWeight: .regular, textAligned: .center)
        label.numberOfLines = 3
        return label
    }()
    
    public let humidityLabel = GenericLabel(fontSize: 20, fontWeight: .thin, textAligned: .center)
    public let windLabel = GenericLabel(fontSize: 20, fontWeight: .thin, textAligned: .center)
    public let cloudsLabel = GenericLabel(fontSize: 20, fontWeight: .thin, textAligned: .center)
    
    public lazy var humidityWindCloudsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [humidityLabel, windLabel, cloudsLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    // MARK:  Life Cycle Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:  Setup Methods
    private func setupView() {
        configureBackgroundView()
        addLabels()
    }
    
    private func configureBackgroundView() {
        let backgroundImage = UIImageView(image: UIImage(named: K.AssetKeys.BLUE_DRIP_FISH))
        backgroundView = backgroundImage
    }
    
    // MARK:  Accessors
    public func setSummaryDescriptionLabelText(to text: String) { summaryDescriptionLabel.text = text }
    public func setHumidityLabelText(to text: String) { humidityLabel.text = text }
    public func setCoudsLabelText(to text: String) { cloudsLabel.text = text }
    public func setWindLabelText(to text: String) { windLabel.text = text }
    
    // MARK:  Constraints
    
    private func addLabels() {
        let stackView = UIStackView(arrangedSubviews: [summaryDescriptionLabel, humidityWindCloudsStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8)
        ])
    }
}
