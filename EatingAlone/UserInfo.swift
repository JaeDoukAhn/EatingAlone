//
//  UserInfo.swift
//  EatingAlone
//
//  Created by ktds 20 on 2017. 8. 18..
//  Copyright © 2017년 CJON, Inc. All rights reserved.
//

import Foundation
import UIKit

class UserInfo {
    var userId:String
    var userLocalZone:String
    var userTimeZone:String
    var userImage:UIImage
    
    var userGender:String?
    var userAge:Int?
    
    
    init(userId:String, userLocalZone:String, userTimeZone:String, userImage:UIImage, userGender:String?, userAge:Int?) {
        self.userId = userId
        self.userLocalZone = userLocalZone
        self.userTimeZone = userTimeZone
        self.userImage = userImage
        self.userGender = userGender
        self.userAge = userAge
    }
    
    convenience init(userId:String, userLocalZone:String, userTimeZone:String, userImage:UIImage){
        self.init(userId: userId, userLocalZone: userLocalZone, userTimeZone: userTimeZone, userImage: userImage, userGender: nil, userAge: nil)
    }
    
}
