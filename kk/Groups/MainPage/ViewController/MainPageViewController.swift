//
//  SecondViewController.swift
//  kk
//
//  Created by Воробьев Александр on 5/10/20.
//  Copyright © 2020 Serioga. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    @IBAction func settingsButtonAction(_ sender: Any) {
        let vc = UIStoryboard(name: "Settings", bundle: nil).instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }
    
}

//MARK: -
//MARK: - Configure

private extension MainPageViewController {
    
    func configure() {
        configureBackgroundView()
    }
    
    func configureBackgroundView() {
        backgroundView.setGradientBackground(colorOne: #colorLiteral(red: 0.3861683309, green: 0.431995213, blue: 0.5937667489, alpha: 1), colorTwo: #colorLiteral(red: 0.1782957613, green: 0.220055908, blue: 0.3693865538, alpha: 1))
    }
    
}
