//
//  CTFrameParserConfig.swift
//  CoreTextDemo
//
//  Created by ke.li on 2018/1/30.
//  Copyright © 2018年 ke.li. All rights reserved.
//

import UIKit

class CTFrameParserConfig: NSObject {
    
    var width: CGFloat
    var fontSize: CGFloat
    var lineSpace: CGFloat
    var textColor: UIColor
    
    override init() {
        self.width = 200.0
        self.fontSize = 16.0
        self.lineSpace = 8.0
        self.textColor = UIColor.init(colorLiteralRed: 108, green: 108, blue: 108, alpha: 1)
    }
    
}
