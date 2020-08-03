//
//  LastViewController.swift
//  kk
//
//  Created by Воробьев Александр on 5/11/20.
//  Copyright © 2020 Serioga. All rights reserved.
//

import UIKit

class RestoreViewController: UIViewController {
    
    // - UI
    @IBOutlet var backVIew: UIView!
    @IBOutlet weak var footerButtonAction: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    @IBAction func CloseButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

//MARK: -
//MARK: - Configure

private extension RestoreViewController {
    
    func configure() {
        configureBackgroundView()
        configureButtonAction()
    }

    func configureBackgroundView() {
        backVIew.setGradientBackground(colorOne: #colorLiteral(red: 0.3861683309, green: 0.431995213, blue: 0.5937667489, alpha: 1), colorTwo: #colorLiteral(red: 0.1782957613, green: 0.220055908, blue: 0.3693865538, alpha: 1))
    }
    
    func configureButtonAction() {
        footerButtonAction.layer.borderWidth = 2.0
        footerButtonAction.layer.borderColor = (UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)).cgColor
        footerButtonAction.clipsToBounds = true
    }
    
}
