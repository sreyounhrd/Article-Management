//
//  ArticleTableViewController.swift
//  UploadImageSreyoun
//
//  Created by SREYOUN on 12/14/16.
//  Copyright © 2016 KSHRD. All rights reserved.
//

import UIKit
import Kingfisher
// View
class ArticleTableViewController : UITableViewController{
    
    var listPresenter : ArticlePresenter?
    
    var articleList = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listPresenter = ArticlePresenter()
        listPresenter?.articleViewDelegate = self
        
        // Load Data
        // Call loadArticle from Presenter
        listPresenter?.loadAllArticle()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleTableViewCell
        let art = articleList[indexPath.row]
        cell.titleLabel.text = art.title
        cell.detailTextview.text=art.description
        //cell.authorLabel.text = art.author?.name
        
        if let imageUrl = art.image, let url = URL(string: imageUrl){     
            cell.imgView.kf.setImage(with: URL(string: art.image!)!, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
        return cell
        
    }
    
}

extension ArticleTableViewController : ArticleViewDelegate{
    func updateViewWithData(_ data: [Article]) {
        articleList = data
        tableView.reloadData()
    }
}
