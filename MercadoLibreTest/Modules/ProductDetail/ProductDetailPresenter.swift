//
//  ProductDetailPresenter.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 7/07/22.
//

import Foundation

final class ProductDetailPresenter {

    // MARK: - Private properties -
    private unowned let view: ProductDetailViewInterface
    private let interactor: ProductDetailInteractorInterface
    private let wireframe: ProductDetailWireframeInterface
    
    private var productId: String?
    private var item: ItemResponse?

    // MARK: - Lifecycle -
    init(
        view: ProductDetailViewInterface,
        interactor: ProductDetailInteractorInterface,
        wireframe: ProductDetailWireframeInterface,
        productId: String? = nil
    ) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        self.productId = productId
    }
    
    // MARK: - Private methods -
    private func setDataForView() {
        guard let item = item else { return }
        let model = ItemDetailModel(
            address: item.sellerAddress.city?.name  ?? "",
            city: item.sellerAddress.state?.name ?? "",
            price: item.price?.formatCurrency() ?? "",
            title: item.title ?? "",
            condition: item.condition ?? .new
        )
        view.setData(with: model)
    }
}

// MARK: - Extensions -
extension ProductDetailPresenter: ProductDetailPresenterInterface {
    
    var numberOfPictures: Int {
        guard let item = item, let pictures = item.pictures else { return 0 }
        return pictures.count
    }
    
    func viewDidLoad() {
        guard let productId = productId else { return }
        interactor.getProductInfo(productId: productId) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let item):
                strongSelf.item = item
                strongSelf.setDataForView()
            case .error:
                let action: () -> Void = { [weak self] in
                    guard let strongSelf = self else { return }
                    strongSelf.wireframe.goToBack()
                }
                strongSelf.wireframe.showAlertWithAction(Constants.Alert.title, message: Constants.Alert.message, handler: action)
            }
        }
    }
    
    func getItemImage(at row: Int) -> String {
        guard let item = item,
              let pictures = item.pictures,
              let url = pictures[row].url
        else { return "" }
        return url
    }
}
