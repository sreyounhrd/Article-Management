//
//  DisplayPresenter.swift
//  UploadImageSreyoun
//
//  Created by MrJ-The_JoKer on 12/18/16.
//  Copyright © 2016 KSHRD. All rights reserved.
//

import Foundation
import UIKit

class DisplayPresenter{
    
    var displayModel:DisplayModel?
    var displayTableViewControllerInterface : DisplayTableViewControllerInterface?
    
    init() {
        displayModel = DisplayModel()
        // Set Delegate to Model
        displayModel?.displayPresenterInterface = self
    }
    
    // Load Data
    func loadData(){
        print("loadData")
        // call service to load data
        displayModel?.loadData()
    }
    
    func deleteArticleWithID(id:Int){
        // tell service to delete
        displayModel?.deleteArticleFromAPI(id:id)
    }
}

extension DisplayPresenter:DisplayPresenterInterface{
    func responseData(_ data: [Article]) {
        // Response Data to View
        displayTableViewControllerInterface?.displayViewWithData(data)
    }
    func deleteSuccess() {
        // Tell View that the deletion is success
        displayTableViewControllerInterface?.deleteSuccess()
    }
}
