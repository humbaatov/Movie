//
//  HomeController.swift
//  MovieApp
//
//  Created by Ayxan Humbatov on 28.02.24.
//

import UIKit

class HomeController: UIViewController {
    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet weak var sortButton:UIButton!
    @IBOutlet weak var searchButton:UIButton!
    private let viewModel = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        viewModel.getPopularMovieList()
        
        setupView()
        collectionView.register(UINib(nibName: "MovieCollectionCell", bundle: nil), forCellWithReuseIdentifier: "MovieCollectionCell")
        collectionView.register(UINib(nibName: "MovieCollectionHeaderView", bundle: nil),forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: "MovieCollectionHeaderView")
        // Do any additional setup after loading the view.
    }
    fileprivate func configureView(){
        viewModel.successCallBack = { [weak self] in
            guard let self = self else {return}
            print("success")
            
        }
        viewModel.errorCallBack = { [weak self] errorstring in
            guard let self = self else {return}
            print(errorstring)
            
        }
    }
    
    fileprivate func setupView(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension HomeController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionCell", for: indexPath) as! MovieCollectionCell
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        return CGSize(width: collectionView.bounds.width, height: 84 )
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader :
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MovieCollectionHeaderView", for: indexPath)
           
            return headerView
        default : assert(false)
        }
        
    }
    
}
