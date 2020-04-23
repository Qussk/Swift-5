//
//  testViewController.swift
//  HelloWorld
//
//  Created by Qussk_MAC on 2020/04/23.
//  Copyright © 2020 Qussk_MAC. All rights reserved.
//

import UIKit

class testViewController: UIViewController {

    
    var countViewLable: UILabel?
    var countButton: UIButton?
    var countIndex: Int = 0

    @objc func clickedButton(_ sender: UIButton) {
        countIndex += 1
        countViewLable?.text = "\(countIndex)개"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        countButton = UIButton(type: .system)
        countButton?.frame = CGRect(x: 100, y: 100, width: 150, height: 150)
        countButton?.setTitle("카운트 증가시키기", for: .normal)
        countButton?.layer.borderColor = UIColor.black.cgColor
        countButton?.layer.borderWidth = 1
        countButton?.addTarget(self, action: #selector(clickedButton), for: .touchUpInside)
        view.addSubview(countButton!)

        countViewLable = UILabel(frame: CGRect(x: 200, y: 200, width: 200, height: 50))
        countViewLable?.text = "0개"
        countViewLable?.font = UIFont.preferredFont(forTextStyle: .title1)
        view.addSubview(countViewLable!)
    
    
    
        func viewDidLoad() {
        super.viewDidLoad()
        
    }


}


}
