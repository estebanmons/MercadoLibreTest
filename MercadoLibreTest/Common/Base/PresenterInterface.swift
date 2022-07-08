//
//  PresenterInterface.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 7/07/22.
//

import Foundation

protocol PresenterInterface: AnyObject {
    func viewDidLoad()
    func viewWillAppear(animated: Bool)
    func viewDidAppear(animated: Bool)
    func viewWillDisappear(animated: Bool)
    func viewDidDisappear(animated: Bool)
}

extension PresenterInterface {
    func viewDidLoad() { }
    
    func viewWillAppear(animated: Bool) { }
    
    func viewDidAppear(animated: Bool) { }
    
    func viewWillDisappear(animated: Bool) { }
    
    func viewDidDisappear(animated: Bool) { }
}
