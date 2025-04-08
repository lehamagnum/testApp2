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
    
//    Надо переверстать, может быть поможет, примерно такая же ячейка, не говорю что она идеальная, но для констрейнтов подойдет:
//    // MARK: - UI elements
//    
//    /// Фото товара
//    private lazy var imageView: UIImageView = {
//        let view = UIImageView(frame: .zero)
//        view.backgroundColor = Colors.white.ui
//        view.contentMode = .scaleAspectFit
//        view.clipsToBounds = true
//        view.layer.cornerRadius = 10
//        return view
//    }()
//    
//    /// Только самовывоз
//    private lazy var pickupTagView = PickupOnlyTagView()
//    
//    /// Стэк с названием и описанием
//    private lazy var descriptionStack: UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [titleLabel, descrLabel])
//        stackView.backgroundColor = Colors.white.ui
//        stackView.axis = .vertical
//        stackView.spacing = 8
//        stackView.clipsToBounds = true
//        return stackView
//    }()
//    
//    /// Название товара
//    private lazy var titleLabel: UILabel = {
//        let label = UILabel()
//        label.backgroundColor = Colors.white.ui
//        label.font = .pantonFont(ofSize: 18, weight: .semibold)
//        label.textColor = Colors.blackTitle.ui
//        label.numberOfLines = 0
//        return label
//    }()
//    
//    /// Описание товара
//    private lazy var descrLabel: UILabel = {
//        let label = UILabel()
//        label.backgroundColor = Colors.white.ui
//        label.font = .systemFont(ofSize: 15, weight: .regular)
//        label.textColor = Colors.gray.ui
//        label.numberOfLines = 0
//        return label
//    }()
//    
//    /// Цена/ Скоро появится/ счетчик
//    private lazy var priceView: PriceView = {
//        let view = PriceView()
//        view.layer.cornerRadius = 20
//        view.clipsToBounds = true
//        view.delegate = self
//        return view
//    }()
//    
//    /// теги
//    fileprivate let tagsView: NewVoblerView = {
//        let view = NewVoblerView()
//        return view
//    }()
//    
//    // MARK: - Lifecycle
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        commonInit()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        commonInit()
//    }
//    
//    // MARK: - Init
//    
//    private func commonInit() {
//        
//        addSubview(imageView)
//        imageView.snp.makeConstraints { make in
//            make.width.equalTo(UIScreen.main.bounds.width * 0.36)
//            make.height.equalTo(UIScreen.main.bounds.width * 0.36)
//            make.left.equalToSuperview()
//            make.top.equalToSuperview()
//            make.bottom.lessThanOrEqualToSuperview().inset(10)
//        }
//        
//        addSubview(descriptionStack)
//        descriptionStack.snp.makeConstraints { make in
//            make.top.equalToSuperview()
//            make.left.equalTo(imageView.snp.right).offset(12)
//            make.right.equalToSuperview().inset(16)
//        }
//        
//        addSubview(priceView)
//        priceView.snp.makeConstraints { make in
//            make.height.equalTo(40)
//            make.left.equalTo(imageView.snp.right).inset(-12)
//            make.top.greaterThanOrEqualTo(descriptionStack.snp.bottom).inset(-16)
//            make.bottom.equalToSuperview()
//        }
//        
//        addSubview(pickupTagView)
//        pickupTagView.snp.makeConstraints { make in
//            make.left.equalTo(imageView.snp.left).inset(5)
//            make.right.equalTo(imageView.snp.right).inset(5)
//            make.bottom.equalTo(imageView.snp.bottom)
//        }
//        
//        addSubview(tagsView)
//        tagsView.snp.makeConstraints { make in
//            make.top.equalTo(imageView.snp.top)
//            make.left.equalTo(imageView.snp.left)
//            make.right.equalTo(imageView.snp.right)
//            make.bottom.equalTo(imageView.snp.bottom).inset(8).priority(.init(250))
//            make.bottom.equalTo(pickupTagView.snp.top).inset(-8).priority(.init(251))
//        }
//    }
}
