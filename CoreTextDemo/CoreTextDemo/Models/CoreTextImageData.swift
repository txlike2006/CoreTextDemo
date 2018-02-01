//
//  CoreTextImageData.swift
//  CoreTextDemo
//
//  Created by ke.li on 2018/2/1.
//  Copyright © 2018年 ke.li. All rights reserved.
//

import UIKit

class CoreTextImageData: NSObject {
    var name: String?
    var position: String?
    
    // 此坐标是 CoreText 的坐标系，而不是UIKit的坐标系
    var imagePosition: CGRect?
}
