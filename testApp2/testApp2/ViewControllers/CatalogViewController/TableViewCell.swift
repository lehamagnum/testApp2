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

    weak var delegate: CatalogProductCellDelegate?

    private var productId: String?

    static let id = "TableViewCell"

    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()

    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var textStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        label.numberOfLines = 2
        label.text = Bool.random() ? "Title" : "Title Title Title Title Title Title Title Title"
        return label
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

    private lazy var buyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purple
        button.setTitle("Button", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        let action = UIAction { [weak self] action in
            guard let self, let productId else {
                return
            }
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
    
    func configureCell(productId: String?, image: UIImage?, title: String, description: String, price: String, btnTextColor: UIColor?, btnFont: UIFont) {
        self.productId = productId
    }
}

extension CatalogProductCell {
    
    private func setupUI() {
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(12)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        containerView.addSubview(productImageView)
        productImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.width.equalTo(136)
            make.bottom.lessThanOrEqualToSuperview().inset(10)
        }

        containerView.addSubview(textStack)
        textStack.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(productImageView.snp.trailing).offset(12)
            make.trailing.equalToSuperview()
        }

        containerView.addSubview(buyButton)
        buyButton.snp.makeConstraints { make in
            make.top.equalTo(textStack.snp.bottom).offset(16)
            make.leading.equalTo(productImageView.snp.trailing).offset(12)
            make.height.equalTo(40)
            make.bottom.equalToSuperview()
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
