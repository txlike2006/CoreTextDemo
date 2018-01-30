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
        config.textColor = UIColor.red
        config.width = self.ctView.frame.size.width
        
        let data = CTFrameParser.parseContent(content: " 按照以上原则，我们将CTDisplayView中的部分内容拆开。", config: config)
        self.ctView.data = data
      //  self.ctView.frame = CGRect(self.ctView.frame.origin.x, self.ctView.frame.origin.y, self.ctView.frame.size.width, data.height)
        self.ctView.setHeight(data.height!)
        self.ctView.backgroundColor = UIColor.yellow
    }

}

