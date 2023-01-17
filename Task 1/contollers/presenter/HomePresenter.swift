//
//  HomePresenter.swift
//  Task 1
//
//  Created by Ogabek Matyakubov on 17/01/23.
//

import Foundation


protocol HomePresenterProtocol {
    func apiPostList()
}

class HomePresenter: HomePresenterProtocol {
    var homeView: HomeView!
    var controller: HomeViewController!
    
    func apiPostList() {
        controller.showLoading()
        Network.get(url: Network.API_POST_LIST, params: Network.emptyParams(), handler: { response in
            self.controller.hideProgress()
            switch response.result {
            case .success:
                let posts = try! JSONDecoder().decode([Post].self, from: response.data!)
                self.homeView.onLoadPosts(posts: posts)
            case .failure(let error):
                print(error)
                self.homeView.onLoadPosts(posts: [])
            }
        })
        
    }
}
