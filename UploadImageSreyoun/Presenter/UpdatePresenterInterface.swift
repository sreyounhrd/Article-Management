//
//  UpdatePresenterInterface.swift
//  UploadImageSreyoun
//
//  Created by sreyoun on 12/18/16.
//  Copyright © 2016 KSHRD. All rights reserved.
//

import Foundation

protocol UpdatePresenterInterface {
    func uploadImageComplete(imageUrl: String)
    func updateComplete(message: String)
}
