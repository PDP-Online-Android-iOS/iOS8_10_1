//
//  HomeViewController.swift
//  Task 1
//
//  Created by Ogabek Matyakubov on 17/01/23.
//

import UIKit
import JGProgressHUD

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, HomeView {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    var items: Array<Post> = Array()
    var presenter: HomePresenter!
    
    let hud = JGProgressHUD()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
        
    }
    
    func showLoading() {
        if !hud.isVisible {
            hud.textLabel.text = "Loading..."
            hud.show(in: self.view)
        }
    }
    
    func hideProgress() {
        if hud.isVisible {
            hud.dismiss(animated: true)
        }
    }

    func initViews() {
        tableView.dataSource = self
        tableView.delegate = self
        
        presenter = HomePresenter()
        presenter.homeView = self
        presenter.controller = self
        
        presenter.apiPostList()
        
    }

    func onLoadPosts(posts: [Post]) {
        if posts.count > 0 {
            reloadTableView(posts: posts)
        }
    }
    
    func reloadTableView(posts: [Post]) {
        self.items = posts
        self.tableView.reloadData()
    }
    
    // MARK: - Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
        
        cell.tvTitle.text = item.body
        cell.tvBody.text = item.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }

}
