//
//  ViewController.swift
//  ShowBoard
//
//  Created by Hou's Mac on 16/2/16.
//  Copyright © 2016年 霍伟元. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy private var showBoard: ShowBoard! = {
        
        
        let title                               = UILabel(frame: CGRectMake(0,0,UIScreen.mainScreen().bounds.size.width,50))
        title.text                              = "(๑*◡*๑)٩(❛ัᴗ❛ั⁎)ೄﾅﾃ\"ﾅﾃ\"♡⃛"
        title.backgroundColor                   = UIColor.skyBlueColor()
        title.textAlignment                     = NSTextAlignment.Center
        
        let lenght                              = UIScreen.mainScreen().bounds.size.width/5
        
        
        let testBtn: UIButton                 = UIButton(type: UIButtonType.System)
        testBtn.frame                         = CGRectMake(0,0,lenght,lenght)
        testBtn.backgroundColor               = UIColor.halfSkyBlueColor()
        testBtn.layer.masksToBounds           = true
        testBtn.layer.cornerRadius            = 8
        testBtn.setTitle("测试1", forState: UIControlState.Normal)
        testBtn.addTarget(self, action: Selector("testClick"), forControlEvents: UIControlEvents.TouchUpInside)
        
        let testBtn_yeah: UIButton                = UIButton(type: UIButtonType.System)
        testBtn_yeah.frame                        = CGRectMake(0,0,lenght,lenght)
        testBtn_yeah.backgroundColor              = UIColor.halfSkyBlueColor()
        testBtn_yeah.layer.cornerRadius           = 8
        testBtn_yeah.layer.masksToBounds          = true
        testBtn_yeah.setTitle("也是测试", forState: UIControlState.Normal)
        testBtn_yeah.addTarget(self, action: Selector("testBtn_yeahClick"), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        let image: UIImageView = UIImageView(frame: CGRectMake(0,0,lenght,lenght))
        image.image = UIImage(named: "mana")
        image.layer.masksToBounds           = true
        image.layer.cornerRadius            = 8
        
        let image2: UIImageView = UIImageView(frame: CGRectMake(0,0,lenght,lenght))
        image2.image = UIImage(named: "mana")
        image2.layer.masksToBounds           = true
        image2.layer.cornerRadius            = 8
        
        let image3: UIImageView = UIImageView(frame: CGRectMake(0,0,lenght,lenght))
        image3.image = UIImage(named: "mana")
        image3.layer.masksToBounds           = true
        image3.layer.cornerRadius            = 8
        
        let image4: UIImageView = UIImageView(frame: CGRectMake(0,0,lenght,lenght))
        image4.image = UIImage(named: "mana")
        image4.layer.masksToBounds           = true
        image4.layer.cornerRadius            = 8
        
        let image5: UIImageView = UIImageView(frame: CGRectMake(0,0,lenght,lenght))
        image5.image = UIImage(named: "mana")
        image5.layer.masksToBounds           = true
        image5.layer.cornerRadius            = 8
        
        let image6: UIImageView = UIImageView(frame: CGRectMake(0,0,lenght,lenght))
        image6.image = UIImage(named: "mana")
        image6.layer.masksToBounds           = true
        image6.layer.cornerRadius            = 8
        
        let image7: UIImageView = UIImageView(frame: CGRectMake(0,0,lenght,lenght))
        image7.image = UIImage(named: "mana")
        image7.layer.masksToBounds           = true
        image7.layer.cornerRadius            = 8
        
        let image8: UIImageView = UIImageView(frame: CGRectMake(0,0,lenght,lenght))
        image8.image = UIImage(named: "mana")
        image8.layer.masksToBounds           = true
        image8.layer.cornerRadius            = 8
        
        let image9: UIImageView = UIImageView(frame: CGRectMake(0,0,lenght,lenght))
        image9.image = UIImage(named: "mana")
        image9.layer.masksToBounds           = true
        image9.layer.cornerRadius            = 8
        
        let image10: UIImageView = UIImageView(frame: CGRectMake(0,0,lenght,lenght))
        image10.image = UIImage(named: "mana")
        image10.layer.masksToBounds           = true
        image10.layer.cornerRadius            = 8
        
        let image11: UIImageView = UIImageView(frame: CGRectMake(0,0,lenght,lenght))
        image11.image = UIImage(named: "mana")
        image11.layer.masksToBounds           = true
        image11.layer.cornerRadius            = 8
        
        let height: CGFloat = 300
        let y: CGFloat = self.view.bounds.height - height
        let showBoard: ShowBoard = ShowBoard(superView: self.view, frame: CGRectMake(0, y, self.view.bounds.width, height), ranks: (3,3), titleView: title, titleHeight: 50)
        
        showBoard.addChildView(testBtn)
        showBoard.addChildView(image)
        showBoard.addChildView(image4)
        showBoard.addChildView(image2)
        showBoard.addChildView(image3)
        showBoard.addChildView(image5)
        showBoard.addChildView(image6)
        showBoard.addChildView(image7)
        showBoard.addChildView(image8)
        showBoard.addChildView(testBtn_yeah)
        showBoard.addChildView(image9)
        showBoard.addChildView(image10)
        showBoard.addChildView(image11)
//        showBoard.addChildView(image)
        return showBoard
    }()
    
    func testBtn_yeahClick() {
        print("touched testBtn_yeahClick")
    }
    
    func testClick() {
        print("touched testClick")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.showBoard.show()
    }


}

