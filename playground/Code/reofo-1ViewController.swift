//
//  reofo-1ViewController.swift
//  content
//
//  Created by Qussk_MAC on 2020/04/26.
//  Copyright © 2020 Qussk_MAC. All rights reserved.
//

import UIKit

class reofo_1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let view1 = setSuperview(Superview: view)
        let view2 = setSubview(Superview: view)
        var view3 = setCenterview(Subview: view)
        
        view3.layer.cornerRadius = 100
        
    }
    
    func setSuperview(Superview: UIView) -> UIView {
        let view1 = UIView()
        view1.backgroundColor = .blue
        view1.frame = CGRect(x: 15, y: 15, width: Superview.frame.size.width - 30, height: 100)
        Superview.addSubview(view1)
       return view1
    }
  
    func setSubview(Superview: UIView) -> UIView {
        let view2 = UIView()
        view2.backgroundColor = .red
        view2.frame = CGRect(x: 15, y: Superview.frame.size.height-115, width: Superview.frame.size.width - 30, height: 100)
        Superview.addSubview(view2)
        return view2
    }

    
    func setCenterview(Subview: UIView) -> UIView {
        let view3 = UIView()
        view3.backgroundColor = .yellow
        view3.frame = CGRect(x: Subview.frame.size.height/9, y: Subview.frame.size.height/2.8, width: 200, height: 200)
        Subview.addSubview(view3)
        
        return view3
    }
}

//Superview.frame.size.height = 슈퍼뷰를 기준으로 기기비율중 높이
//Superview.frame.size.width = 슈퍼뷰를 기준으로 기기비율중 넓이

