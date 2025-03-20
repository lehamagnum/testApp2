//
//  ViewController.swift
//  testApp2
//
//  Created by Алексей Патрушев on 18.03.2025.
//

import UIKit

class ProductViewController: UIViewController {
    
    // MARK: - UIElements
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let itemImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Resources.Images.itemImage
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let newImage: UIImageView = {
        let image = UIImageView()
        image.image = Resources.Images.newImage
        return image
    }()
    
    private let textContainerView: UIView = {
        let textContainerView = UIView()
        return textContainerView
    }()
    
    private let titleLable: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Bold", size: 24)
        label.text = "Кожанные лоферы"
        label.textColor = Resources.FigmaColors.titleLabelColor
        label.numberOfLines = 1
        return label
    }()
    
    private let infoButton: UIButton = {
        let but = UIButton()
        but.setImage(Resources.Images.infoButtonImage, for: .normal)
        but.addTarget(ProductViewController.self, action: #selector(infoButtonTapped), for: .primaryActionTriggered)
        return but
    }()
    
    private let descriptionLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.text = "Лоферы из натуральной кожи. Фигурная союзка с фактурным швом по контуру. Зауженный мыс. Кожаная стелька и подкладка. Прорезиненная подошва. В комплект входит пыльник."
        label.numberOfLines = 0
        label.textColor = .lightGray
        return label
    }()
    
    private let containerButtonView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let buyButton: PrimaryButton = {
        let but = PrimaryButton()
        but.addTarget(ProductViewController.self, action: #selector(buyButtonTapped), for: .primaryActionTriggered)
        return but
    }()
    
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Resources.FigmaColors.whiteColor
        // настройка тени
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: -2)
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 0.1
        return view
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    // MARK: - Methods
    
    @objc private func infoButtonTapped() {
        debugPrint("Нажата кнопка информации")
    }

    @objc private func buyButtonTapped() {
        debugPrint("Нажата кнопка в корзину")
    }
}

extension ProductViewController {

    func setupUI() {
        // MARK: - Add Views & Constraints
    
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        containerView.addSubview(itemImage)
        itemImage.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(250)
        }
        
        itemImage.addSubview(newImage)
        newImage.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(16)
            make.height.equalTo(24)
            make.width.equalTo(44)
        }
        
        containerView.addSubview(titleLable)
        titleLable.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(itemImage.snp.bottom).offset(8)

        }
        containerView.addSubview(infoButton)
        infoButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.top.equalTo(titleLable.snp.top)
            make.height.width.equalTo(32)
        }

        containerView.addSubview(descriptionLable)
        descriptionLable.snp.makeConstraints { make in
            make.top.equalTo(titleLable.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        containerView.addSubview(containerButtonView)
        containerButtonView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(containerView.snp.bottom).inset(34)
            make.height.equalTo(68)
        }
        
        containerButtonView.addSubview(buyButton)
        buyButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(8)
            make.top.equalToSuperview().inset(12)
        }
        
        containerView.addSubview(separatorView)
        separatorView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(3)
            make.bottom.equalTo(containerButtonView.snp.top)
        }
        
        // MARK: - Configure
        
        view.backgroundColor = .white
        

        

        
    }
    
}
