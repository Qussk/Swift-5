//
//  repoViewController.swift
//  HelloWorld
//
//  Created by Qussk_MAC on 2020/04/23.
//  Copyright © 2020 Qussk_MAC. All rights reserved.
//

import UIKit



//    [ 과제 - 앱 구현 ]
//
//    1. Button을 누를 때마다 Label 의 값 변경하기
//       1) +버튼 또는 -버튼을 누르면 숫자가 증가/감소하도록 만들기
//       2) 숫자가 증가할 때는 label의 텍스트 색을 파란색, 감소할 때는 빨간색으로 변경


class repoViewController: UIViewController {
    
    var myLable: UILabel?
    var plusButton: UIButton?
    var minusButton: UIButton?
    var myIndex: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        plusButton = UIButton(type: .system)
        plusButton? .frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        plusButton?.setTitle("Puls", for: .normal)
        plusButton?.addTarget(self, action: #selector(plus1Button), for: .touchUpInside)
        view.addSubview(plusButton!)
        
        
        
        minusButton = UIButton(type: .system)
        minusButton? .frame = CGRect(x: 150, y: 100, width: 100, height: 100)
        minusButton?.setTitle("miuns", for: .normal)
        minusButton?.addTarget(self, action: #selector(minus1Button), for: .touchUpInside)
        view.addSubview(minusButton!)
        
        
        
        myLable = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        myLable?.text = "0"
        myLable?.center = view.center
        myLable?.textAlignment = .center
        myLable?.font = UIFont.preferredFont(forTextStyle: .title1)
            
        view.addSubview(myLable!)
        
    }
    
    
    @objc func plus1Button(_ sender: UIButton) {
        myIndex += 1
        myLable?.text = "\(myIndex)"
        myLable?.textColor = .blue
    }
    
    
    @objc func minus1Button(_ sender: UIButton) {
        myIndex -= 1
        myLable?.text = "\(myIndex)"
        myLable?.textColor = .red
    }
    
    
}
