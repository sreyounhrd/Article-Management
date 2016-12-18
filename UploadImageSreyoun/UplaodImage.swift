//
//  UplaodImage.swift
//  UploadImageSreyoun
//
//  Created by SREYOUN on 12/15/16.
//  Copyright © 2016 KSHRD. All rights reserved.
//

import Foundation
import ObjectMapper
struct UploadImage:Mappable {
    var code:String?
    var message:String?
    var data:String?
    init?(map: Map) {
        
    }
}
extension UploadImage {
    mutating func mapping(map: Map) {
        code    <- map["CODE"]
        message <- map["MESSAGE"]
        data    <- map["DATA"]
    }
    
}
