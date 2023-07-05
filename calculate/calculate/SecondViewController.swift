//
//  SecondViewController.swift
//  calculate
//
//  Created by Gleb Gurev on 02.07.2023.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let firstVC = ViewController()
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    var historyCalculating = ["История пуста"]
    


    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        tableView.frame = view.bounds
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        buttonBack()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        historyCalculating = firstVC.fuck
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyCalculating.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = historyCalculating[indexPath.row]
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
        let firstVC = ViewController()
        
    }
}
