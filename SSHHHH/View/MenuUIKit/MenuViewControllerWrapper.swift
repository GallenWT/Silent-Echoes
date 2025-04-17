//
//  MenuViewControllerWrapper.swift
//  SSHHHH
//
//  Created by Nadhif Rahman Alfan on 19/08/24.
//

import SwiftUI
import UIKit

struct MenuViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let menuViewController = MenuViewController()
        let navigationController = UINavigationController(rootViewController: menuViewController)
        return navigationController
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // No need to update anything
    }
}
