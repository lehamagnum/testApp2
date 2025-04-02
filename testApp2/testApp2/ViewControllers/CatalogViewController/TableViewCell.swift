//
//  TableViewCell.swift
//  testApp2
//
//  Created by Алексей Патрушев on 05.04.2025.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    
    static let id = "TableViewCell"
    
    private lazy var contentViewCell: UIView = {
        let view = UIView()
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        return view
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
//        image.setContentHuggingPriority(.defaultLow, for: .vertical)
        return image
    }()
    
    private lazy var descriptionView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var titleLable: UILabel = {
        let lable = UILabel()
        lable.textColor = Resources.FigmaColors.blackLabelColor
        lable.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        lable.numberOfLines = 0
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
        let action = UIAction { action in
            debugPrint("Кнопка цены нажата")
        }
        but.addAction(action, for: .primaryActionTriggered)
        but.backgroundColor = Resources.FigmaColors.secondaryButtonBG
        but.layer.cornerRadius = 4
        return but
    }()
    
    private lazy var spacerViewBottom: UIView = {
        let spacer = UIView()
        return spacer
    }()
    
    private lazy var spacerViewTop: UIView = {
        let spacer = UIView()
        return spacer
    }()
    
    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(image: UIImage?, title: String, description: String, price: String, btnTextColor: UIColor?, btnFont: UIFont) {
        self.image.image = image
        self.titleLable.text = title
        self.descriptionLable.text = description
        self.priceButton.configureButton(title: price, textColor: btnTextColor, font: btnFont)
    }
}

extension TableViewCell {
    
    private func setupUI() {

        addSubview(contentViewCell)
        contentViewCell.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentViewCell.addSubview(spacerViewTop)
        spacerViewTop.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(16)
        }
        
        contentViewCell.addSubview(spacerViewBottom)
        spacerViewBottom.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(16)
        }
        
        contentViewCell.addSubview(image)
        image.snp.makeConstraints { make in
            make.width.equalTo(136)
            make.leading.equalToSuperview()
            make.bottom.equalTo(spacerViewBottom.snp.top)
            make.top.equalTo(spacerViewTop.snp.bottom)
        }
        
        contentViewCell.addSubview(descriptionView)
        descriptionView.snp.makeConstraints { make in
            make.top.equalTo(spacerViewTop.snp.bottom)
            make.trailing.equalToSuperview()
            make.leading.equalTo(image.snp.trailing).offset(12)
        }
        
        descriptionView.addSubview(titleLable)
        titleLable.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        descriptionView.addSubview(descriptionLable)
        descriptionLable.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(titleLable.snp.bottom).offset(8)
        }
        
        descriptionView.addSubview(priceButton)
        priceButton.snp.makeConstraints { make in
            make.leading.bottom.equalToSuperview()
//            make.bottom.equalTo(spacerViewBottom.snp.top)
            make.height.equalTo(40)
            make.width.equalTo(96)
            make.top.equalTo(descriptionLable.snp.bottom).offset(16)
        }
        
        self.contentView.isUserInteractionEnabled = false
    }
}
