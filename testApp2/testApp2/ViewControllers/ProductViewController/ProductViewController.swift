//
//  ViewController.swift
//  testApp2
//
//  Created by Алексей Патрушев on 18.03.2025.
//

import UIKit
import SnapKit

class ProductViewController: UIViewController {
    
    // MARK: - UIElements
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let screenScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
    
    private let contentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        return stack
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
    
    private let titleStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        return stack
    }()
    
    private let titleLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = "Кожанные лоферы"
        label.textColor = Resources.FigmaColors.titleLabelColor
        label.numberOfLines = 1
        return label
    }()
    
    private let infoButton: InfoButton = {
        let but = InfoButton()
        let action = UIAction { action in
        debugPrint("кнопка информации нажата")}
        but.addAction(action, for: .primaryActionTriggered)
        return but
    }()
    
    private let descriptionLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.text = "Лоферы из натуральной кожи. Фигурная союзка с фактурным швом по контуру. Зауженный мыс. Кожаная стелька и подкладка. Прорезиненная подошва. В комплект входит пыльник."
        label.numberOfLines = 0
        label.textColor = Resources.FigmaColors.descriptionColor
        return label
    }()
    
    private let containerButtonView: UIView = {
        let view = UIView()
        view.backgroundColor = Resources.FigmaColors.whiteColor
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: -2)
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 0.1
        return view
    }()
    
    private let buyButton: PrimaryButton = {
        let but = PrimaryButton()
        let action = UIAction { action in
        debugPrint("кнопка купить нажата")}
        but.addAction(action, for: .primaryActionTriggered)
        return but
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    // MARK: - Methods
    
}

extension ProductViewController {
    
        func setupUI() {
            // MARK: - Add Views & Constraints
            // add main container
            view.addSubview(containerView)
            containerView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            // add buy button container
            containerView.addSubview(containerButtonView)
            containerButtonView.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview()
                make.bottom.equalTo(view.safeAreaLayoutGuide)
                make.height.equalTo(68)
            }
    
            containerButtonView.addSubview(buyButton)
            buyButton.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview().inset(16)
                make.bottom.equalToSuperview().inset(8)
                make.top.equalToSuperview().inset(12)
            }
    
            //add scroll
            containerView.addSubview(screenScrollView)
            screenScrollView.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.leading.trailing.equalToSuperview().inset(16)
                make.bottom.equalTo(containerButtonView.snp.top)
            }
            //add content view
            screenScrollView.addSubview(contentStack)
            contentStack.snp.makeConstraints { make in
                make.edges.equalTo(screenScrollView.contentLayoutGuide)
                make.width.equalTo(screenScrollView.snp.width)
            }
            //add content
            contentStack.addArrangedSubview(itemImage)
            itemImage.snp.makeConstraints { make in
                make.height.equalTo(250)
            }
    
            itemImage.addSubview(newImage)
            newImage.snp.makeConstraints { make in
                make.top.equalToSuperview().inset(16)
                make.leading.equalToSuperview()
                make.height.equalTo(24)
                make.width.equalTo(44)
            }
            
            contentStack.addArrangedSubview(titleStack)
            titleStack.snp.makeConstraints { make in
                make.height.equalTo(32)
            }
            
            titleStack.addArrangedSubview(titleLable)
            
            titleStack.addArrangedSubview(infoButton)
            infoButton.snp.makeConstraints { make in
                make.height.width.equalTo(32)
            }
            
            contentStack.addArrangedSubview(descriptionLable)

    
            // MARK: - Configure
    
            view.backgroundColor = .white
            
        }
    
    }
