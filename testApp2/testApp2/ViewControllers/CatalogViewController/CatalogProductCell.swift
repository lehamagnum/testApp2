//
//  TableViewCell.swift
//  testApp2
//
//  Created by Алексей Патрушев on 05.04.2025.
//

import Foundation
import UIKit

protocol CatalogProductCellDelegate: AnyObject {
    
    func didTapButton(productId: String)
}

class CatalogProductCell: UITableViewCell {
    //MARK: - Variables
    static let cellId = "TableViewCell"
    
    private var productId: String?
    
    weak var delegate: CatalogProductCellDelegate?
    
    //MARK: - UIelements
    private lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var productImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var descriptionContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var titleLable: UILabel = {
        let lable = UILabel()
        lable.textColor = Resources.FigmaColors.blackLabelColor
        lable.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        lable.numberOfLines = 2
        lable.setContentHuggingPriority(.defaultLow, for: .vertical)
        return lable
    }()
    
    private lazy var descriptionLable: UILabel = {
        let lable = UILabel()
        lable.textColor = Resources.FigmaColors.descriptionColor
        lable.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        lable.numberOfLines = 0
        return lable
    }()
    
    private lazy var priceButton: SecondaryButton = {
        let but = SecondaryButton()
        let action = UIAction { [weak self] action in
            guard let self, let productId else { return }
            delegate?.didTapButton(productId: productId)
        }
        but.addAction(action, for: .primaryActionTriggered)
        but.backgroundColor = Resources.FigmaColors.secondaryButtonBG
        but.layer.cornerRadius = 4
        return but
    }()
    
    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
//    func configureCell(productId: String, image: UIImage?, title: String, description: String, price: String, btnTextColor: UIColor?, btnFont: UIFont) {
//        self.productId = productId
//        self.productImageView.image = image
//        self.titleLable.text = title
//        self.descriptionLable.text = description
//        self.priceButton.configureButton(textColor: btnTextColor, font: btnFont)
//    }
    
    func configureCell(title: String, description: String, btnTextColor: UIColor?, btnFont: UIFont) {

        self.titleLable.text = title
        self.descriptionLable.text = description
        self.priceButton.configureButton(textColor: btnTextColor, font: btnFont)
    }
    
}

extension CatalogProductCell {
    
    private func setupUI() {

        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(16)
        }
        
        containerView.addSubview(productImageView)
        productImageView.snp.makeConstraints { make in
            make.width.equalTo(UIScreen.main.bounds.width * 0.39)
            make.leading.top.equalToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
            
        }
        
        containerView.addSubview(descriptionContainerView)
        descriptionContainerView.snp.makeConstraints { make in
            make.leading.equalTo(productImageView.snp.trailing).offset(12)
            make.trailing.top.equalToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
        }
        
        descriptionContainerView.addSubview(titleLable)
        titleLable.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        descriptionContainerView.addSubview(descriptionLable)
        descriptionLable.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(titleLable.snp.bottom).offset(8)
        }
        
        descriptionContainerView.addSubview(priceButton)
        priceButton.snp.makeConstraints { make in
            make.leading.bottom.equalToSuperview()
            make.top.equalTo(descriptionLable.snp.bottom).offset(16)
            make.height.equalTo(40)
            make.width.equalTo(96)
            
        }
    }
}
