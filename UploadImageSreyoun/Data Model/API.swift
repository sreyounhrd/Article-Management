//
//  API.swift
//  UploadImageSreyoun
//
//  Created by SREYOUN on 12/15/16.
//  Copyright © 2016 KSHRD. All rights reserved.
//

import Foundation
import Alamofire

// URL
let BASE_URL = "http://120.136.24.174:1301"
let GET_ALL_ARTICLE = BASE_URL + "/v1/api/articles"
let DELETE_ARTICLE_BY_ID = GET_ALL_ARTICLE

// HEADER
let HEADERS : HTTPHeaders = ["Authorization" : "Basic QU1TQVBJQURNSU46QU1TQVBJUEBTU1dPUkQ="]
// Upload
let UPLOAD_SINGLE_IMAGE = BASE_URL + "/v1/api/uploadfile/single"
