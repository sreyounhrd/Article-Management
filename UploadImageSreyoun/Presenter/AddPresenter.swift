//
//  AddPresenter.swift
//  UploadImageSreyoun
//
//  Created by MrJ-The_JoKer on 12/18/16.
//  Copyright © 2016 KSHRD. All rights reserved.
//

import Foundation
import UIKit

class AddPresenter{
    
    var addModel : AddModel?
    var addTableViewControllerInterface : AddTableViewControllerInterface?
    
    init() {
        addModel = AddModel()
        addModel?.addPresenterInterface = self
    }
    
    // Upload Image
    func uploadImage(image: UIImage){
        print("uploadImage")
        addModel?.uploadImage(image: image)
    }
    
    func postArticle(title: String, description:String, imageUrl: String){
        // Pass data to model
        addModel?.postArticle(title: title, description: description, imageUrl: imageUrl)
    }
    
}

extension AddPresenter : AddPresenterInterface{
    func uploadImageSuccess(imageUrl: String) {
        // Reponse image url to view
        print("uploadImageSuccess")
        addTableViewControllerInterface?.uploadImageSuccessWithURL(url: imageUrl)
    }
    
    func postArticleComplete(isSuccess: Bool, message: String) {
        // Reponse message to view
        if isSuccess{
            addTableViewControllerInterface?.postArticleSuccess(message: message)
        }else{
            addTableViewControllerInterface?.postArticleFail(message: message)
        }
    }
}
