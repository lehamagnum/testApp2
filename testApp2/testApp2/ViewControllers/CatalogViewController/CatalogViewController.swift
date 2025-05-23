//
//  MainViewController.swift
//  testApp2
//
//  Created by Алексей Патрушев on 18.03.2025.
//

import Foundation
import UIKit
import SnapKit
import SDWebImage
import RxSwift
import RxCocoa

class CatalogViewController: UIViewController {
    
    private let typeOfClothes = ["Каталог", "Новинки","Джинсы", "Футболки"]
    
    var productData: [ProductResponceModel] = []
    
    let disposeBag = DisposeBag()
    
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
        scroll.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
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
        return table
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTableView()
        registerCells()
        bindCatalogViewController(type: typeOfClothes, isSelected: typeOfClothes[0])
        getProductData()
    
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
    
     func getProductData() {
         
         let client = NetworkClient()
         client.requestAdapter = RequestAdapters()
         
         let request = GetProductRequest()
         
         client.sendRx(request)
             .observe(on: MainScheduler.instance)
             .subscribe(
                onNext: { [weak self] products in
                    guard let self else { return }
                    self.productData = products
                    self.tableView.reloadData()
                 },
                onError: { [weak self] error in
                    guard let self else { return }
                    print("Ошибка: \(error)")
                    let alert = UIAlertController(title: "Ошибка",
                                                  message: "Проверьте интернет соединение.",
                                                  preferredStyle: .actionSheet)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert, animated: true)
                    
                }
             )
             .disposed(by: disposeBag)
         
        // async/await
//        Task { [weak self] in
//            guard let self else { return }
//            
//            let client = NetworkClient()
//            let request = GetProductRequest()
//            
//            do {
//                let JSONdata = try await client.send(request)
//                self.productData = JSONdata
//                
//                self.tableView.reloadData()
//                
//            } catch {
//                debugPrint("Network request failed: \(error.localizedDescription)")
//                let alert = UIAlertController(title: "Ошибка", message: "Проверьте интернет соединение.", preferredStyle: .actionSheet)
//                alert.addAction(UIAlertAction(title: "OK", style: .default))
//                present(alert, animated: true)
//            }
//        }
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
        tableView.register(CatalogProductCell.self, forCellReuseIdentifier: CatalogProductCell.cellId)
    }

    private func setupUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(58)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(64)
        }
        
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(58)
        }
        //add sizeScroll
        containerView.addSubview(clothesScrollView)
        clothesScrollView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(12)
        }
        
        clothesScrollView.addSubview(clothesContentStack)
        clothesContentStack.snp.makeConstraints { make in
            make.edges.equalTo(clothesScrollView.contentLayoutGuide)
            make.height.equalTo(clothesScrollView.snp.height)
        }
    }
}

extension CatalogViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CatalogProductCell.cellId, for: indexPath) as? CatalogProductCell else {return UITableViewCell()}
        cell.selectionStyle = .none
        cell.delegate = self
        
        let data = self.productData[indexPath.row]
        
        cell.configureCell(id: data.id,
                           title: data.title,
                           description: data.description,
                           price: String(data.price),
                           btnTextColor: Resources.FigmaColors.secondaryButtonTitleBrown,
                           btnFont: UIFont.systemFont(ofSize: 15, weight: .semibold))
        
        let url = URL(string: data.image)
        cell.configureCellImages(url: url)
        
        return cell
    }
}

extension CatalogViewController: CatalogProductCellDelegate {
    
    func didTapButton(productId: Int) {
        let viewController = ProductViewController(productId: productId)
        viewController.productId = productId
        present(viewController, animated: true)
    }
}
