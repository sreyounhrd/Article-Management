//
//  UpdatePresenter.swift
//  UploadImageSreyoun
//
//  Created by sreyoun on 12/18/16.
//  Copyright © 2016 KSHRD. All rights reserved.
//

import Foundation
import UIKit

class UpdatePresenter{
    
    // Create UpdateModel object
    var updateModel = UpdateModel()
    // Create UpdateTableViewControllerInterface object
    var updateTableViewControllerInterface:UpdateTableViewControllerInterface?
    
    init() {
        updateModel = UpdateModel()
        // Set Delegate
        updateModel.updatePresenterInterface = self
    }
    
    
    func uploadImage(image: UIImage){
        // Tell UpdateModel to upload image
        updateModel.uploadImage(image: image)
    }
    
    func updateArticle(id:Int, title:String, description:String, imageUrl:String){
        // Tell UpdateModel to update article
        updateModel.updateArticle(id: id, title: title, description: description, imageUrl: imageUrl)
    }
    
}

extension UpdatePresenter : UpdatePresenterInterface{
    func uploadImageComplete(imageUrl: String) {
        // Tell View that the upload image is complte and pass image url
        updateTableViewControllerInterface?.uploadImageSuccessWith(url: imageUrl)
    }
    
    func updateComplete(message: String) {
        // Tell view
        updateTableViewControllerInterface?.updateComplete(message: message)
    }
}
