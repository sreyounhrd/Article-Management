//
//  Pagination.swift
//  UploadImageSreyoun
//
//  Created by SREYOUN on 12/16/16.
//  Copyright © 2016 KSHRD. All rights reserved.
//

import Foundation
import ObjectMapper

class Pagination: Mappable{
    var page:Int?
    var limit:Int?
    var total_count:Int?
    var total_pages:Int?
    required init(map:Map) {}
    
    func mapping(map: Map) {
        page            <- map["PAGE"]
        limit           <- map["Limit"]
        total_count     <- map["TOTAL_COUNT"]
        total_pages     <- map["TOTAL_PAGES"]
    }
}
