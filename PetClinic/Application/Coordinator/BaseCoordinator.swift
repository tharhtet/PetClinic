//
//  BaseCoordinator.swift
//  PetClinic
//
//  Created by Thant Han Linn on 1/31/24.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var navigationVC: UINavigationController { get set }
    var parentCoordinator: Coordinator? { get set }
    
    func start()
    func start(window: UIWindow?)
    func start(coordinator: Coordinator)
    func didFinish(coordinator: Coordinator)
    func removeChildCoordinators()
    func windowRootAnimation(window: UIWindow?)
}

class BaseCoordinator: Coordinator {
    
    var navigationVC = UINavigationController()
    var childCoordinators = [Coordinator]()
    var parentCoordinator: Coordinator?
    
    func start() {
        fatalError("Start method should be implemented.")
    }
    
    func start(window: UIWindow?) {
        fatalError("Start method should be implemented.")
    }
    
    func start(coordinator: Coordinator) {
        childCoordinators += [coordinator]
        coordinator.parentCoordinator = self
        coordinator.start()
    }
    
    func removeChildCoordinators() {
        childCoordinators.forEach { $0.removeChildCoordinators() }
        childCoordinators.removeAll()
    }
    
    func didFinish(coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
    
    func windowRootAnimation(window: UIWindow?) {
        if let window = window {
            UIView.transition(with: window,
                                  duration: 0.3,
                                  options: .transitionCrossDissolve,
                                  animations: nil,
                                  completion: nil)
        }
    }
}
