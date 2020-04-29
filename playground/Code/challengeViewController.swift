//
//  challengeViewController.swift
//  UItextfieldEX
//
//  Created by Qussk_MAC on 2020/04/28.
//  Copyright © 2020 Qussk_MAC. All rights reserved.
//


//[ 과제 ]
//1. 영상 파일 참고
//> 텍스트 필드에 어떤 값을 입력하면 별도의 Label 에 입력된 텍스트 표시.
//> 텍스트 필드가 활성화 되어 있을 땐 Label 의 텍스트 색상이 파란색이고, Font 크기는 40
//> 텍스트 필드가 비활성화되면 Label 텍스트 색상이 빨간색이고, Font 크기는 20

import UIKit

class challengeViewController: UIViewController {
  
  
  let showLable = UILabel()
  let colorTextfield = UITextField()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    //let showLable = UILabel()
    showLable.frame = CGRect(x: 15, y: 30, width: view.frame.size.width - 30, height: 44)
    showLable.backgroundColor = .white
    showLable.text = ""
    view.addSubview(showLable)
    
    
    //let colorTextfield = UITextField()
    colorTextfield.frame = CGRect(x: 15, y: 100, width: view.frame.size.width - 30, height: 44)
    colorTextfield.textAlignment = .left
    colorTextfield.keyboardType = .namePhonePad
    colorTextfield.borderStyle = .roundedRect
    view.addSubview(colorTextfield)
    
    
    colorTextfield.addTarget(self, action: #selector(colorTF(_:)), for: .editingDidEndOnExit)
    colorTextfield.addTarget(self, action: #selector(colorTf(_:)), for: .editingChanged)
    colorTextfield.addTarget(self, action: #selector(textDIdBegin), for: .editingDidBegin)
    colorTextfield.addTarget(self, action: #selector(textDidEnd(_:)), for: .editingDidEnd)

    
  }
  
  
  @objc func beLable (_ sender: UILabel) {
        
  }
  
  
  @objc func textDIdBegin(_ sender: UITextField) {
    showLable.textColor = .blue
    showLable.font = UIFont.systemFont(ofSize: 40)
    self.showLable.text = sender.text

  }
  
  @objc func colorTF (_ sender: UITextField) {
    
  }
  
  @objc func colorTf (_ sender: UITextField) {
    if sender.text!.count > 10 {
      sender.text?.removeLast()
    }
    self.showLable.text = sender.text

  }
   @objc func textDidEnd(_ sender: UITextField) {
    showLable.textColor = .red
    showLable.font = UIFont.systemFont(ofSize: 20)

    self.showLable.text = sender.text


  }
  
  }
  




