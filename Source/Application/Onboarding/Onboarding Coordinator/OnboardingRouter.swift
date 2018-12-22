//
//  OnboardingRouter.swift
//  Client
//
//  Created Ampe on 10/22/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class OnboardingRouter: OnboardingWireframeProtocol {
    weak var navigationController: UINavigationController?
}

extension OnboardingRouter {
    func presentWalkthrough(_ delegate: WalkthroughDelegate?) {
        navigationController?.setViewControllers([WalkthroughBuilder().create(delegate)], animated: true)
    }
    
    func presentWelcome(_ delegate: WelcomeDelegate?) {
        navigationController?.setViewControllers([WelcomeRouter.createModule(delegate)], animated: true)
    }
    
    func presentCongratulations(_ delegate: CongratulationsDelegate?) {
        navigationController?.setViewControllers([CongratulationsRouter.createModule(delegate)], animated: true)
    }
}
