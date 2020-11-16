//
//  MainViewController.swift
//  Weather App
//
//  Created by Mikołaj Dębicki on 15/11/2020.
//

import UIKit

class MainViewController: UIViewController, MainViewModelDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let viewModel = MainViewModel()
    
    var collectionView: UICollectionView!
    
    var weatherData: WeatherData?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        bindView()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - INIT VIEW
extension MainViewController {
    func initView() {
        view.backgroundColor = Colors.bgGrey
        
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Weather App"
        
        let padding: CGFloat = 30
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: (view.frame.width-padding)/2, height: (view.frame.width-padding)/3)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.backgroundColor = .clear
        view.addSubview(collectionView)
        collectionView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor)
    }
}

// MARK: - BIND VIEW
extension MainViewController {
    func bindView() {
        viewModel.weatherData.bind { (weatherData) in
            self.weatherData = weatherData
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

// MARK: - COLLECTION VIEW
extension MainViewController {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = indexPath.row
        var cell: UICollectionViewCell?
        
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath)
        
        if(cell == nil) {
            cell = MainCollectionViewCell()
        }
        
        let c = cell as! MainCollectionViewCell
        c.update(weatherList: self.weatherData?.list?[row])
        cell = c

        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.viewModel.weatherData.value?.list?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row = indexPath.row
        navigationController?.pushViewController(CityViewController(cityID: self.weatherData?.list?[row].id), animated: true)
    }
}
