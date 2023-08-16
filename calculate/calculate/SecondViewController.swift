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
    
    var closure: ((String) -> Void)?
    
    let peredachka = Peredacha()
    
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
        
        let longTap = UILongPressGestureRecognizer(target: self, action: #selector(longTapped(_:)))
        longTap.minimumPressDuration = 0.5
        view.addGestureRecognizer(longTap)
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
        view.addGestureRecognizer(tap)
        //  storage.defaults.synchronize()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let testLibrary = UserDefaults.standard.dictionary(forKey: "test4") as? [String: [String]]
        var dates: [String] = []
        for key in testLibrary!.keys {
            dates.append(key)
        }
        let currentdate = dates[section]
        if let expressions = testLibrary![currentdate] {
            return expressions.count
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let test = UserDefaults.standard.dictionary(forKey: "test4")
        return test?.keys.count ?? 3
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var arrayKeys: [String] = []
        if let testValue = UserDefaults.standard.dictionary(forKey: "test4") {
            for value in testValue.keys {
                arrayKeys.append(value)
            }
        }
        return arrayKeys[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let testLibrary = UserDefaults.standard.dictionary(forKey: "test4") ?? [:]
        let dates = Array(testLibrary.keys)
        let currentDate = dates[indexPath.section]
        let expressions = testLibrary[currentDate] as? [String] ?? []
        cell.textLabel?.text = expressions[indexPath.row]
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
    

    @objc private func longTapped(_ sender: UITapGestureRecognizer) {
        let tapLocation = sender.location(in: tableView)
        if let locationIndex = tableView.indexPathForRow(at: tapLocation) {
            let tappedCell = tableView.cellForRow(at: locationIndex)
            if let text = tappedCell?.textLabel?.text {
                let copy = UIPasteboard.general
                copy.string = text
                let popupLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 70, height: 40))
                popupLabel.center = view.center
                popupLabel.textAlignment = .center
                popupLabel.backgroundColor = UIColor.black.withAlphaComponent(0.5)
                popupLabel.textColor = .white
                popupLabel.text = "Copy"
                popupLabel.alpha = 0
                popupLabel.layer.cornerRadius = 5
                popupLabel.clipsToBounds = true
                view.addSubview(popupLabel)
                
                UIView.animate(withDuration: 0.3, animations: {
                    popupLabel.alpha = 1
                }, completion: {(_) in
                    DispatchQueue.main.asyncAfter(deadline: .now())
                    { UIView.animate(withDuration: 0.3, animations: {
                        popupLabel.alpha = 0
                    }, completion: {(_) in
                        popupLabel.removeFromSuperview()
                    })}
                })
            }
            
        }
    }
    
    @objc private func tapped(_ sender: UITapGestureRecognizer) {
        let tapLocation = sender.location(in: tableView)
        if let tappedIndexPath = tableView.indexPathForRow(at: tapLocation) {
            let tappedCell = tableView.cellForRow(at: tappedIndexPath)
            if let text = tappedCell?.textLabel?.text {
                
                let a = peredachka.app(text)
                print(a)
                closure?(a)
    
                
            }
        }
        
        
    }
    @objc private func buttonBackView() {
        navigationController?.popViewController(animated: true)
    }
}

