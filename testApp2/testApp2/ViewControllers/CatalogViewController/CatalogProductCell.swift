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

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .yellow
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .gray
        label.numberOfLines = 0
        label.text = Bool.random() ? "Description" : "Description Description Description Description DescriDescription Description Description Description DescriDescription Description Description Description DescriDescription Description Description Description DescriDescription Description Description Description DescriDescription Description Description Description DescriDescription Description Description Description DescriDescription Description Description Description DescriDescription Description Description Description DescriDescription Description Description Description DescriDescription Description Description Description Description"
        return label
    }()
    
    private lazy var priceButton: SecondaryButton = {
        let but = SecondaryButton()
        let action = UIAction { [weak self] action in
            guard let self, let productId else { return }
            delegate?.didTapButton(productId: productId)
        }
        button.addAction(action, for: .primaryActionTriggered)
        return button
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
    
    func configureCell(productId: String, image: UIImage?, title: String, description: String, price: String, btnTextColor: UIColor?, btnFont: UIFont) {
        self.productId = productId
        self.productImageView.image = image
        self.titleLable.text = title
        self.descriptionLable.text = description
        self.priceButton.configureButton(title: price, textColor: btnTextColor, font: btnFont)
    }
  }

extension CatalogProductCell {
    
    private func setupUI() {
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(12)
            make.leading.trailing.equalToSuperview().inset(16)
        }

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
