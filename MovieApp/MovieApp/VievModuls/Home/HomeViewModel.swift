//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Ayxan Humbatov on 28.02.24.
//

import Foundation

final class HomeViewModel {
    var popularlist:PopularMovieModel?
    var successCallBack:(() -> Void)?
    var errorCallBack:((String) -> Void)?
    
    func getPopularMovieList(){
        MovieManager.shared.getPopularMovieList { [weak self] responsedata , errorstring in
            guard let self = self else {return}
            if let errorstring = errorstring{
                self.errorCallBack?(errorstring)
            } else if let responsedata = responsedata {
                
                self.popularlist = responsedata
                self.successCallBack?()
            }
        }
    }
}


