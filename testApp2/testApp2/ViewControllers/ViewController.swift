//
//  ViewController.swift
//  testApp2
//
//  Created by Алексей Патрушев on 18.03.2025.
//

import UIKit



class ViewController: UIViewController {
    
    // MARK: - UIElements
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let itemImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "itemImage")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let newImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "newImage")
        return image
    }()
    
    private let textContainerView: UIView = {
        let textContainerView = UIView()
        return textContainerView
    }()
    
    private let titleLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.text = "Кожанные лоферы"
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    private let infoButton: UIButton = {
        let but = UIButton()
        but.setImage(UIImage(named: "infoButton"), for: .normal)
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
    
    private let buyButton: UIButton = {
        let but = UIButton()
        but.setTitle("В корзину 4 950 Р", for: .normal)
        but.backgroundColor = .systemBrown
        but.layer.cornerRadius = 10
        return but
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let sizeContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let titleSize: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.text = "Выбрать размер"
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    private let sizeSegmentedControl: UISegmentedControl = {
        let items = ["38", "39", "40", "41", "42", "43", "44"]
        let segmented = UISegmentedControl(items: items)
        segmented.selectedSegmentIndex = 0
        segmented.backgroundColor = .systemBackground
        return segmented
    }()

    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    // MARK: - Methods
    
    func configureViewShadow(view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: -2)
        view.layer.shadowRadius = 2
        view.layer.shadowOpacity = 0.2
        
        // Для оптимизации
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
    }
    
    @objc private func segmentedControlValueChanged() {
        let selectedIndex = sizeSegmentedControl.selectedSegmentIndex
        print("Выбран размер")

    }
    
    @objc private func infoButtonTapped() {
        print("Нажата кнопка информации")

    }

    @objc private func buyButtonTapped() {
        print("Нажата кнопка в корзину")

    }

}





extension ViewController {

    func setupUI() {
        // MARK: - Add Views
    
        view.addSubview(containerView)
        containerView.addSubview(itemImage)
        itemImage.addSubview(newImage)
        
        containerView.addSubview(titleLable)
        containerView.addSubview(infoButton)
        containerView.addSubview(descriptionLable)

        containerView.addSubview(titleSize)
        containerView.addSubview(sizeSegmentedControl)
        
        containerView.addSubview(containerButtonView)
        containerButtonView.addSubview(buyButton)
        containerView.addSubview(separatorView)

        // MARK: - Constraints
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            itemImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            itemImage.topAnchor.constraint(equalTo: containerView.topAnchor),
            itemImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            itemImage.heightAnchor.constraint(equalToConstant: 250),
            
            newImage.topAnchor.constraint(equalTo: itemImage.topAnchor, constant: 16),
            newImage.leadingAnchor.constraint(equalTo: itemImage.leadingAnchor, constant: 16),
            newImage.heightAnchor.constraint(equalToConstant: 24),
            newImage.widthAnchor.constraint(equalToConstant: 44),
            

            
            titleLable.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            titleLable.topAnchor.constraint(equalTo: itemImage.bottomAnchor, constant: 8),
            titleLable.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            infoButton.topAnchor.constraint(equalTo: itemImage.bottomAnchor, constant: 8),
            infoButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            infoButton.heightAnchor.constraint(equalToConstant: 32),
            infoButton.widthAnchor.constraint(equalToConstant: 32),
            
            descriptionLable.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 8),
            descriptionLable.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            descriptionLable.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            
            
            titleSize.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            titleSize.topAnchor.constraint(equalTo: descriptionLable.bottomAnchor, constant: 8),
            
            sizeSegmentedControl.topAnchor.constraint(equalTo: titleSize.bottomAnchor),
            sizeSegmentedControl.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            sizeSegmentedControl.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            
            
            containerButtonView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            containerButtonView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            containerButtonView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            containerButtonView.heightAnchor.constraint(equalToConstant: 68),
            
            buyButton.topAnchor.constraint(equalTo: containerButtonView.topAnchor, constant: 12),
            buyButton.bottomAnchor.constraint(equalTo: containerButtonView.bottomAnchor, constant: -8),
            buyButton.leadingAnchor.constraint(equalTo: containerButtonView.leadingAnchor, constant: 16),
            buyButton.trailingAnchor.constraint(equalTo: containerButtonView.trailingAnchor, constant: -16),
            
            separatorView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 3),
            separatorView.bottomAnchor.constraint(equalTo: containerButtonView.topAnchor),
            
                                                   
        ])
        
        // MARK: - Configure
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        itemImage.translatesAutoresizingMaskIntoConstraints = false
        textContainerView.translatesAutoresizingMaskIntoConstraints = false
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        descriptionLable.translatesAutoresizingMaskIntoConstraints = false
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        newImage.translatesAutoresizingMaskIntoConstraints = false
        containerButtonView.translatesAutoresizingMaskIntoConstraints = false
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        sizeContainerView.translatesAutoresizingMaskIntoConstraints = false
        titleSize.translatesAutoresizingMaskIntoConstraints = false
        sizeSegmentedControl.translatesAutoresizingMaskIntoConstraints = false

        view.backgroundColor = .white
        
        configureViewShadow(view: separatorView)
        
        sizeSegmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        
        infoButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
        
        buyButton.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)
        
    }
    
    
}
