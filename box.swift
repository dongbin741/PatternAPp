//
//  box.swift
//  PatternAPp
//
//  Created by china317 on 15/2/10.
//  Copyright (c) 2015年 china317. All rights reserved.
//

import Foundation

class Box: NSObject {
    @objc var name: String?
    var descript: String?
    @objc var volume: NSNumber?
    override init() {
        name = "boxs"
        descript = "it is description"
        volume = 1
    }
}

@objc protocol viewProtocol {
    @objc func clickTapped() ->Bool
}