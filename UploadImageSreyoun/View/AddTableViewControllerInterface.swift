//
//  AddTableViewControllerInterface.swift
//  UploadImageSreyoun
//
//  Created by sreyoun on 12/18/16.
//  Copyright © 2016 KSHRD. All rights reserved.
//

import Foundation
protocol AddTableViewControllerInterface {
    func uploadImageSuccessWithURL(url: String)
    func postArticleSuccess(message: String)
    func postArticleFail(message: String)
}
