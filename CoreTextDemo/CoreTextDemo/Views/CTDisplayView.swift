//
//  CTDisplayView.swift
//  CoreTextDemo
//
//  Created by ke.li on 2018/1/30.
//  Copyright © 2018年 ke.li. All rights reserved.
//

import UIKit

class CTDisplayView: UIView {
    
    var data: CoreTextData?

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        // 1.获取上下文
        let context = UIGraphicsGetCurrentContext()
        
        // 2.转换坐标
        context?.textMatrix = .identity
        context?.translateBy(x: 0, y: self.bounds.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        
        // 根据数据绘制
        if((self.data) != nil) {
            CTFrameDraw((data?.ctFrame)!, context!)
        }
    }
    
}
