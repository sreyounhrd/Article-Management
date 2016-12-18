//
//  Category.swift
//  UploadImageSreyoun
//
//  Created by SREYOUN on 12/15/16.
//  Copyright © 2016 KSHRD. All rights reserved.
//

import Foundation
import ObjectMapper

struct Category:Mappable {
    var id:Int?
    var name:String?
    init?(map: Map) {
    
    }
    mutating func mapping(map: Map) {
        id    <- map["ID"]
        name <- map["NAME"]
        
    }
}

