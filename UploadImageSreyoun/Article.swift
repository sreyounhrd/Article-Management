//
//  Article.swift
//  UploadImageSreyoun
//
//  Created by SREYOUN on 12/14/16.
//  Copyright © 2016 KSHRD. All rights reserved.
//

import Foundation
import ObjectMapper

struct Article:Mappable {
    var id:Int?
    var title:String?
    var description:String?
    var createDate: String?
    var status: String?
    var category: Category?
    var image: String?

    init?(map: Map) {
        
    }
    mutating func mapping(map: Map) {
        id          <- map["ID"]
        title       <- map["TITLE"]
        description <- map["DESCRIPTION"]
        createDate  <- map["CREATED_DATE"]
        status      <- map["STATUS"]
        category    <- map["CATEGORY"]
        image       <- map["IMAGE"]
    }
}







































