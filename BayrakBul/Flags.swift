//
//  Flags.swift
//  BayrakBul
//
//  Created by Burak AÇIK on 3.08.2022.
//

import Foundation

class Flags {
    var flag_id:Int?
    var flag_name:String?
    var flag_image:String?
    
    init() {
    }
    
    init (flag_id:Int,flag_name:String?,flag_image:String?) {
        self.flag_id = flag_id
        self.flag_name = flag_name
        self.flag_image = flag_image
    }
}
