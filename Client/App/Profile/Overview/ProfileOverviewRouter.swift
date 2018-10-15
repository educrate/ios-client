//
//  ProfileOverviewRouter.swift
//  Client
//
//  Created Ampe on 10/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class ProfileOverviewRouter: ProfileOverviewWireframeProtocol {
    weak var viewController: UIViewController?
}

extension ProfileOverviewRouter {
    static func createModule() -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .profileOverview)
        let view: ProfileOverviewViewController = storyboard.instantiateViewController()
        let interactor = ProfileOverviewInteractor()
        let router = ProfileOverviewRouter()
        let presenter = ProfileOverviewPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}

extension ProfileOverviewRouter {
    func presentAccount() {
        if let view = viewController, let navigationController = view.navigationController {
            navigationController.pushViewController(ProfileAccountRouter.createModule(), animated: true)
        }
    }
    
    func presentPayment() {
        if let view = viewController, let navigationController = view.navigationController {
            navigationController.pushViewController(ProfilePaymentRouter.createModule(), animated: true)
        }
    }
    
    func presentSupport() {
        if let view = viewController, let navigationController = view.navigationController {
            navigationController.pushViewController(ProfileSupportRouter.createModule(), animated: true)
        }
    }
    
    func presentWelcome() {
        if let view = viewController, let navigationController = view.navigationController {
            navigationController.pushViewController(WelcomeRouter.createModule(), animated: true)
        }
    }
}
