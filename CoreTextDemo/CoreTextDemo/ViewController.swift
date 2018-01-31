//
//  ViewController.swift
//  CoreTextDemo
//
//  Created by ke.li on 2018/1/30.
//  Copyright © 2018年 ke.li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ctView: CTDisplayView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let config = CTFrameParserConfig()
        config.textColor = UIColor.black
        config.width = self.ctView.frame.size.width
        
//        let content = " 对于上面的例子，我们给 CTFrameParser 增加了一个将 NSString 转  换为 CoreTextData 的方法。 但这样的实现方式有很多局限性，因为整个内容虽然可以定制字体  大小，颜色，行高等信息，但是却不能支持定制内容中的某一部分。 例如，如果我们只想让内容的前三个字显示成红色，而其它文字显  示成黑色，那么就办不到了。\n\n 解决的办法很简单，我们让`CTFrameParser`支持接受 NSAttributeString 作为参数，然后在 NSAttributeString 中设置好  我们想要的信息。"
//        let attr = CTFrameParser.attributesWithConfig(config: config)
//        let attributedString = NSMutableAttributedString(string: content, attributes: attr as? [String : Any])
//        attributedString.addAttributes([kCTForegroundColorAttributeName as String: UIColor.red], range: NSMakeRange(0, 8))
        let path = Bundle.main.path(forResource: "content", ofType: "json")! as String
        
        let  data = CTFrameParser.parseTemplateFile(path: path, config: config)
        self.ctView.data = data
        self.ctView.setHeight(data.height!)
        self.ctView.backgroundColor = UIColor.yellow
    }

}

