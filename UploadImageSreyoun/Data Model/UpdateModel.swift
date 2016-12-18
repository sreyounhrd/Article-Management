//
//  UpdateModel.swift
//  UploadImageSreyoun
//
//  Created by sreyoun on 12/18/16.
//  Copyright © 2016 KSHRD. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class UpdateModel{
    
    // Create object from UpdatePresenterInterface
    var updatePresenterInterface: UpdatePresenterInterface?
    
    func uploadImage(image: UIImage){
        
        Alamofire.upload(multipartFormData: { formData in
            
            // Create image data
            let imageData = UIImageJPEGRepresentation(image, 1)
            
            // Append Image Data to formData
            formData.append(imageData!, withName: "FILE", fileName: "image.jpg", mimeType: "image/jpg")
            
        }, usingThreshold: 0, to: URL(string: UPLOAD_SINGLE_IMAGE)!, method: .post, headers: HEADERS, encodingCompletion: {
            
            encodingResult in
            
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON(completionHandler: { response in
                    if let value = response.result.value as? [String:AnyObject]{
                        // Pass image url to presenter
                        let imageUrl = value["DATA"] as! String
                        // Call presenter delegate
                        self.updatePresenterInterface!.uploadImageComplete(imageUrl: imageUrl)
                    }
                })
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        })
        
    }
    
    func updateArticle(id:Int, title:String, description:String, imageUrl:String){
        
        let params : Parameters = [
            "TITLE": title,
            "DESCRIPTION": description,
            "AUTHOR": 0,
            "CATEGORY_ID": 0,
            "STATUS": "string",
            "IMAGE": imageUrl
        ]
        
        print(params)
        
        Alamofire.request(URL(string: "\(GET_ALL_ARTICLE)/\(id)")!, method: .put, parameters: params, encoding: JSONEncoding.default, headers: HEADERS).responseJSON(completionHandler: { response in
            if let value = response.result.value as? [String:AnyObject]{
                // Tell presenter that the update is complete
                self.updatePresenterInterface?.updateComplete(message: value["MESSAGE"] as! String)
            }
            
        })
        
    }
    
}
