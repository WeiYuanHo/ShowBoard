//
//  ShowBoard.swift
//
//  Created by Hou's Mac on 16/1/26.
//  Copyright © 2016年 霍伟元. All rights reserved.
//

import UIKit

class ShowBoard: UIView {
    private var contentScrollView: UIScrollView!
    private var ranks: (Int,Int)!
    private var childNum: Int = 0
    private var showFrame: CGRect!
    private var blackView: UIView!
    private var titleHeight: CGFloat!
    private var superView: UIView!
    var views: [UIView]! {
        didSet{
            self.putUpViews()
        }
    }
    var isShow: Bool {
        if self.blackView.alpha > 0.1 {
            return true
        }else {
            return false
        }
    }
    /**
     初始化
     
     - parameter frame:
     - parameter ranks: 行列数量
     
     - returns:
     */
    init(superView: UIView, frame: CGRect, ranks: (Int,Int), titleView: UIView!, titleHeight: CGFloat) {
        super.init(frame: CGRectMake(0, superView.frame.size.height, frame.size.width, frame.size.height + titleHeight))
        self.showFrame = frame
        self.titleHeight = titleHeight
        
        self.contentScrollView = UIScrollView(frame: CGRectMake(0, self.titleHeight+8, frame.size.width, frame.size.height))
        self.contentScrollView.pagingEnabled = true
        self.contentScrollView.showsHorizontalScrollIndicator = false
        self.addSubview(self.contentScrollView)
        
        self.ranks = ranks
        self.backgroundColor = UIColor.whiteColor()
        
        self.blackView = UIView(frame: CGRectMake(0,0,superView.frame.size.width,superView.frame.size.height))
        self.blackView.backgroundColor = UIColor.blackColor()
        self.blackView.alpha = 0

        let tap = UITapGestureRecognizer(target: self, action: Selector("cancel:"))
        self.blackView.addGestureRecognizer(tap)
        self.blackView.userInteractionEnabled = true
        
        titleView.frame = CGRectMake(0, 0, frame.size.width, titleHeight)
        self.addSubview(titleView!)
        
        self.views = [UIView]()
        
        self.superView = superView
        
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
    }
    
    
    func cancel(sender: UITapGestureRecognizer) {
        self.hide()
    }
    
    func show() {
        self.superView.addSubview(self.blackView)
        self.superView.addSubview(self)
        self.superview!.bringSubviewToFront(self)
        UIView.animateWithDuration(0.25, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.25, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.transform = CGAffineTransformMakeTranslation(0, -(self.showFrame.size.height+self.titleHeight))
            self.blackView.alpha = 0.5
            }, completion: nil)
    }
    
    func hide() {
        UIView.animateWithDuration(0.25, animations: { () -> Void in
            self.transform = CGAffineTransformMakeTranslation(0, 0)
            self.blackView.alpha = 0
            }, completion: {(BOOL) -> Void in
                self.blackView.removeFromSuperview()
                self.removeFromSuperview()
        })
    }
    
    func addChildView(view: UIView!) {
        self.views.append(view)
    }
    
    private func removeSubviews() {
        for view in self.contentScrollView.subviews {
            view.removeFromSuperview()
        }
    }
    
    private func putUpViews() {
        self.childNum = 0
        self.removeSubviews()

        for view in self.views {
            let postionX = (self.contentScrollView.bounds.size.width-8)/CGFloat(self.ranks.1*2) // 获取第一个元素中心点x轴坐标
            let postionY = (self.contentScrollView.bounds.size.height-8)/CGFloat(self.ranks.0*2) // 获取第一个元素中心点y轴坐标
            let page = ceil(Double(self.childNum+1)/Double(self.ranks.1*self.ranks.0))-1// 获取页码
            
            let offsetX = (self.childNum)%self.ranks.1 + 1 // 当前行偏移位置
            let x = (self.contentScrollView.bounds.size.width)*CGFloat(page) + CGFloat(2*offsetX-1)*postionX
            
            let offsetY = self.childNum%(self.ranks.1*self.ranks.0)/self.ranks.1 + 1
            let y = CGFloat(offsetY*2-1)*postionY
            
            view.center = CGPointMake(x, y)
            
            self.contentScrollView.addSubview(view)
            self.contentScrollView.contentSize = CGSizeMake(CGFloat(page+1)*self.contentScrollView.bounds.size.width, 0)
            self.childNum++
        }
    }
    
    private func removeBlacView() {
        if self.blackView != Optional.None {
            self.blackView = nil
        }
    }
    
    deinit {
        self.removeBlacView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
