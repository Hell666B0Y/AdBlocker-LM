//
//  FirstViewController.swift
//  kk
//
//  Created by Воробьев Александр on 5/6/20.
//  Copyright © 2020 Serioga. All rights reserved.
//

import UIKit

class SetupViewController: UIViewController {
    
    // - UI
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var myView: UIView!
    
    // - Data
    var numbers: [String] = ["1", "2", "3", "4"]
    var name: [String] = ["Exit this app.", "Open the iPhone Settings app.", "Locate and tap Safari, then tap Content Blockers.", "Toggle on Adblock Start."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    @IBAction func WatchButtonAction(_ sender: Any) {
        let vc = UIStoryboard(name: "MainPage", bundle: nil).instantiateViewController(withIdentifier: "MainPageViewController") as! MainPageViewController
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }
    
}

//MARK: -
//MARK: - TableView Delegate

extension SetupViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 62
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

//MARK: -
//MARK: - TableView Data Source

extension SetupViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.numberLabel.text = numbers[indexPath.row]
        cell.nameLabel.text = name[indexPath.row]
        cell.nameLabel.numberOfLines = 2
        cell.nameLabel.lineBreakMode = .byWordWrapping
        tableView.separatorColor = UIColor.white
        tableView.tableFooterView = UIView()
        return cell
    }
    
}

//MARK: -
//MARK: - Configure

private extension SetupViewController {
    
    func configure() {
        configureTableView()
        configureBackgroundView()
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureBackgroundView() {
        myView.setGradientBackground(colorOne: #colorLiteral(red: 0.3861683309, green: 0.431995213, blue: 0.5937667489, alpha: 1), colorTwo: #colorLiteral(red: 0.1782957613, green: 0.220055908, blue: 0.3693865538, alpha: 1))
    }
    
}
