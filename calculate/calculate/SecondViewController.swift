//
//  SecondViewController.swift
//  calculate
//
//  Created by Gleb Gurev on 02.07.2023.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView: UITableView = {
            let table = UITableView()
            table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            return table
        }()

    var storage: History
    init(storage: History) {
        self.storage = storage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = view.bounds
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        buttonBack()
      //  storage.defaults.synchronize()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserDefaults.standard.stringArray(forKey: "expression2")?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return storage.datee()
    }


    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return UserDefaults.standard.string(forKey: "dateHistory")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(UserDefaults.standard.stringArray(forKey: "expression2")![indexPath.row])" ?? ""
        return cell
    }
    
    
    func buttonBack() {
        let button = UIButton(type: .system)
        view.addSubview(button)
        button.setTitle("Back", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.backgroundColor = .black
        
        
        button.snp.makeConstraints { maker in
            maker.height.width.equalTo(100)
            maker.bottom.equalToSuperview().inset(20)
            maker.left.right.equalToSuperview().inset(100)
        }
        button.addTarget(self, action: #selector(buttonBackView), for: .touchUpInside)
    }
    
    
    @objc private func buttonBackView() {
        navigationController?.popViewController(animated: true)
    }
}
