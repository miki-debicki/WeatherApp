//
//  CityViewController.swift
//  Weather App
//
//  Created by Mikołaj Dębicki on 15/11/2020.
//

import UIKit

class CityViewController: UIViewController, CityViewModelDelegate, UITableViewDelegate, UITableViewDataSource {
    let viewModel = CityViewModel()

    var tableView: UITableView!
    
    var cityData: CityData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        bindView()
    }
    
    init(cityID: Int?) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
        self.viewModel.setID(cityID: cityID)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - INIT VIEW
extension CityViewController {
    func initView() {
        view.backgroundColor = Colors.bgGrey
        
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .white

        tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        tableView.contentInsetAdjustmentBehavior = .always
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        view.addSubview(tableView)
        tableView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor)
    }
}

// MARK: - BIND
extension CityViewController {
    func bindView() {
        viewModel.cityData.bind { (cityData) in
            self.cityData = cityData
            DispatchQueue.main.async {
                self.navigationItem.title = cityData?.city?.name
                self.tableView.reloadData()
            }
        }
    }
}

// MARK: - TABLE VIEW
extension CityViewController {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        var cell: UITableViewCell?

        cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier)

        if(cell == nil) {
            cell = CityTableViewCell()
        }
        
        let c = cell as! CityTableViewCell
        c.update(cityList: (self.viewModel.cityData.value?.list?[row]))
        cell = c
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.cityData.value?.list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
