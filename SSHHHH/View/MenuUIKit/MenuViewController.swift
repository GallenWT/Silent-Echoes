//
//  MenuViewController.swift
//  SSHHHH
//
//  Created by Nadhif Rahman Alfan on 19/08/24.
//

import UIKit
import SwiftUI

class MenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let label = UILabel()
        label.text = "Menu in UIKit"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        let button1 = UIButton(type: .system)
        button1.setTitle("Select Chapter", for: .normal)
        button1.addTarget(self, action: #selector(goToSelectChapter), for: .touchUpInside)

        let button2 = UIButton(type: .system)
        button2.setTitle("Credits", for: .normal)
        button2.addTarget(self, action: #selector(goToCredits), for: .touchUpInside)

        let button3 = UIButton(type: .system)
        button3.setTitle("Exit", for: .normal)
        button3.addTarget(self, action: #selector(goToConfirmExit), for: .touchUpInside)

        let stackView = UIStackView(arrangedSubviews: [label, button1, button2, button3])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20

        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func goToSelectChapter() {
        let hostingController = UIHostingController(rootView: SelectChapterView())
        navigationController?.pushViewController(hostingController, animated: true)
    }

    @objc func goToCredits() {
        let hostingController = UIHostingController(rootView: CreditView())
        navigationController?.pushViewController(hostingController, animated: true)
    }

    @objc func goToConfirmExit() {
        let hostingController = UIHostingController(rootView: ConfirmExitView())
        navigationController?.pushViewController(hostingController, animated: true)
    }
}
