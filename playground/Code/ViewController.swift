//
//  ViewController.swift
//  content
//
//  Created by Qussk_MAC on 2020/04/24.
//  Copyright © 2020 Qussk_MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let greenView = setupSuperview(superView: view)
        let redView = setupSubview(superView: view)
        
        
        
    }
    
    func setupSuperview(superView: UIView) -> UIView {
        let greenView = UIView()
        greenView.frame = CGRect(x: 15, y: 15, width: superView.frame.size.width - 30, height: 100)
        greenView.backgroundColor = .blue
        superView.addSubview(greenView)
        return greenView
    }


    func setupSubview(superView: UIView) -> UIView {
        let redView = UIView()
        redView.frame = CGRect(x: 15, y: superView.frame.size.height-115, width: 345, height: 100)
        redView.backgroundColor = .blue
        superView.addSubview(redView)
        return redView
    }


}


//superView.frame.size.width - 30 //기기에 따라 다르게 레이아웃 잡힘). 그래서 비율을 기준으로 줌. 양옆 -15 씩 제외하여 -30 으로 줌.
//superView.frame.size.height-115 //기기 전체 높이 에서 -115를 뺌.

