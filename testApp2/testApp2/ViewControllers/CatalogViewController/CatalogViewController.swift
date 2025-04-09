//
//  MainViewController.swift
//  testApp2
//
//  Created by Алексей Патрушев on 18.03.2025.
//

import Foundation
import UIKit
import SnapKit

let screenWidth = UIScreen.main.bounds.width

class CatalogViewController: UIViewController {
    
    private let typeOfClothes = ["Каталог", "Новинки","Джинсы", "Футболки"]
    
    private let clothes = [
        UIModel(image: Resources.Images.blazer,
                       title: "Блейзер прямого кроя",
                       description: "Двубортный блейзер на основе лиоцелла и вискозы.",
                       price: "2 970 р"),
        UIModel(image: Resources.Images.pants,
                       title: "Брюки из лиоцелла",
                       description: "Брюки прямого кроя из ткани.",
                       price: "5000 р"),
        UIModel(image: Resources.Images.tshort,
                       title: "Кардиган из хлопка",
                       description: "Короткие рукава. Застежка на пуговицы.",
                       price: "14 999 р"),
        UIModel(image: Resources.Images.jeans,
                       title: "Джинсы straight fit",
                       description: "Пять карманов. Джинсы моднячие.",
                       price: "50 000 р"),
    ]
    
    
    // MARK: - UIElements
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.dropShadow(offset: CGSizeMake(0, 3))
        return view
    }()
    
    private lazy var clothesScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    
    private lazy var clothesContentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        return stack
    }()
    
    private var tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 136
        return table
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTableView()
        registerCells()
        bindCatalogViewController(type: typeOfClothes, isSelected: typeOfClothes[0])
    }
    
    // MARK: - Methods
    func bindCatalogViewController(type: [String], isSelected: String?) {
        clothesContentStack.subviews.forEach { $0.removeFromSuperview() }
        clothesContentStack.subviews.forEach { clothesContentStack.removeArrangedSubview($0) }
        
        for type in typeOfClothes {
            let view = ClothesTypeEntityView()
            view.delegate = self
            view.bindTypeEntityView(type: type, isSelected: isSelected == type)
            clothesContentStack.addArrangedSubview(view)
        }
    }
}

extension CatalogViewController: ClothesTypeEntityViewDelegate {
    func typeDidSelected(with type: String) {
        bindCatalogViewController(type: typeOfClothes, isSelected: type)
    }
}

extension CatalogViewController {
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func registerCells() {
        tableView.register(CatalogProductCell.self, forCellReuseIdentifier: CatalogProductCell.id)
    }

    private func setupUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
        
        //add sizeScroll
        containerView.addSubview(clothesScrollView)
        clothesScrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(12)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }
        
        clothesScrollView.addSubview(clothesContentStack)
        clothesContentStack.snp.makeConstraints { make in
            make.edges.equalTo(clothesScrollView.contentLayoutGuide)
            make.height.equalTo(clothesScrollView.snp.height)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(58)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(58)
        }
    }
}

extension CatalogViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        clothes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CatalogProductCell.id, for: indexPath) as? CatalogProductCell else {return UITableViewCell()}
        cell.selectionStyle = .none
        cell.delegate = self
        let data = clothes[indexPath.row]
        cell.configureCell(productId: UUID().uuidString,
                           image: data.image,
                           title: data.title,
                           description: data.description,
                           price: data.price,
                           btnTextColor: Resources.FigmaColors.secondaryButtonTitleBrown,
                           btnFont: UIFont.systemFont(ofSize: 15, weight: .semibold))
        return cell
    }
}

extension CatalogViewController: CatalogProductCellDelegate {

    func didTapButton(productId: String) {
        print("productId: \(productId)")
        let viewController = ProductViewController(productId: productId)
        viewController.productIdd = productId
        present(viewController, animated: true)
    }
}
