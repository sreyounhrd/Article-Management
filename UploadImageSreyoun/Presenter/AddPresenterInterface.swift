//
//  AddPresenterInterface.swift
//  UploadImageSreyoun
//
//  Created by MrJ-The_JoKer on 12/18/16.
//  Copyright © 2016 KSHRD. All rights reserved.
//

import Foundation

protocol AddPresenterInterface {
    func uploadImageSuccess(imageUrl : String)
    func postArticleComplete(isSuccess: Bool, message: String)
}
