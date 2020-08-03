//
//  ThirdViewController.swift
//  kk
//
//  Created by Воробьев Александр on 5/14/20.
//  Copyright © 2020 Serioga. All rights reserved.
//

import UIKit

class SettingsArr {
    
    var settingsSections: String?
    var settingsName: [String]?
    
    init( settingsSections: String, settingsName: [String]) {
        self.settingsSections = settingsSections
        self.settingsName = settingsName
    }
    
}

class SettingsViewController: UIViewController {
    
    // - UI
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var backgroundView: UIView!
    
    // - Data
    var images = ["image1", "image2", "image3", "image4"]
    var images1 = ["image6", "image7"]
    var settingsArr = [SettingsArr]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
}

//MARK: -
//MARK: - TableView Delegate

extension SettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 43
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (indexPath.section == 2 ) && (indexPath.row == 1){
            let vcc = UIStoryboard(name: "Restore", bundle: nil).instantiateViewController(withIdentifier: "RestoreViewController") as! RestoreViewController
            vcc.modalPresentationStyle = .overFullScreen
            self.present(vcc, animated: true, completion: nil)
        }else {
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        view.backgroundColor = .clear
        
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 15, height: 40))
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.textColor = #colorLiteral(red: 0.6312749386, green: 0.9386207461, blue: 0.05994417518, alpha: 1)
        lbl.text = settingsArr[section].settingsSections
        view.addSubview(lbl)
        
        return view
    }
    
}

//MARK: -
//MARK: - TableView Data Source

extension SettingsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingsArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsArr[section].settingsName?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThirdTableViewCell", for: indexPath) as! ThirdTableViewCell
        cell.settingsLabel.text = settingsArr[indexPath.section].settingsName?[indexPath.row]
        if(indexPath.section == 0 ) {
            cell.settingsImage.image = UIImage(named: images[indexPath.row])
        }else if(indexPath.section == 1) {
            cell.settingsImage.image = UIImage(named: "image5")
        }else {
            cell.settingsImage.image = UIImage(named: images1[indexPath.row])
        }
        
        return cell
    }
    
}

//MARK: -
//MARK: - Configure

private extension SettingsViewController {
    
    func configure() {
        configureSettingsArr()
        configureTableView()
        configureBackgroundView()
    }
    
    func configureSettingsArr() {
        settingsArr.append(SettingsArr.init(settingsSections: "MAIN", settingsName: ["Smart Autoconnect", "Terms of Use", "Privacy Policy", "Support"]))
        settingsArr.append(SettingsArr.init(settingsSections: "APP", settingsName: ["Rate app"]))
        settingsArr.append(SettingsArr.init(settingsSections: "SUBSCRIPTION", settingsName: ["Subscription Plans", "Restore"]))
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureBackgroundView() {
        backgroundView.setGradientBackground(colorOne: #colorLiteral(red: 0.3861683309, green: 0.431995213, blue: 0.5937667489, alpha: 1), colorTwo: #colorLiteral(red: 0.1782957613, green: 0.220055908, blue: 0.3693865538, alpha: 1))
    }
    
}
