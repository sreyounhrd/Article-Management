//
//  DisplayTableViewController.swift
//  UploadImageSreyoun
//
//  Created by MrJ-The_JoKer on 12/18/16.
//  Copyright © 2016 KSHRD. All rights reserved.
//

import UIKit
import Kingfisher

class DisplayTableViewController: UITableViewController {

    var displayPresenter:DisplayPresenter?
    var arr = [Article]()
    
    override func viewWillAppear(_ animated: Bool) {
        // Tell Presenter to Load Data
        displayPresenter?.loadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayPresenter = DisplayPresenter()
        displayPresenter?.displayTableViewControllerInterface = self
        displayPresenter?.loadData()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DisplayCell", for: indexPath) as! DisplayTableViewCell
        // loop each index
        let art = arr[indexPath.row]
        cell.displayTitle.text = art.title
        cell.displayDes.text = art.description
        
        if let imgUrl = art.image, let url = URL(string: imgUrl){
            cell.displayImgView.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "unnamed"), options: nil, progressBlock: nil, completionHandler: nil)
        }
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            // get article id to delete
            let artID = arr[indexPath.row].id
            // tell presenter to delete
            displayPresenter?.deleteArticleWithID(id: artID!)
        }
    }
    
}

extension DisplayTableViewController : DisplayTableViewControllerInterface{
    func displayViewWithData(_ data: [Article]) {
        arr = data
        tableView.reloadData()
    }
    
    func deleteSuccess() {
        // reload the data again
        displayPresenter?.loadData()
    }
}
