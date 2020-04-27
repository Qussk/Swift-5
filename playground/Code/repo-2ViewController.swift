//
//  repo-2ViewController.swift
//  content
//
//  Created by Qussk_MAC on 2020/04/24.
//  Copyright © 2020 Qussk_MAC. All rights reserved.
//

import UIKit

class repo_2ViewController: UIViewController {
    
    let colors: [UIColor] = [.blue, .red, .green] //1-1.반복문 돌릴 배열.
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addView() //1-2.호출하기
        
    }
        
       func addView(){
        var SuperView : UIView = view //1-3.슈퍼뷰는 UIView다,
        
    
        let colorView = creatSubview(size: SuperView.frame.size, color: colors)
            //1-4.반복문 들어올 주머니 = colorView만들기.(사이즈는 슈퍼뷰 기준의 파라메 사이즈, 컬러는 컬러)
            
            SuperView.addSubview(colorView) //슈퍼뷰 addSubview로 가져오고(컬러뷰활용).
            SuperView = colorView //슈퍼뷰는 컬러뷰
            print(colorView.frame) //확인용
        }
    }
    
    
    func RectFrame(from frame: CGRect) -> CGRect {
        CGRect(x: frame.minX + 30, y: frame.maxY + 30, width: frame.width - 60, height: frame.height - 60)
}
      
      func creatSubview(frame: CGRect, color: UIColor) -> UIView {
        let view = UIView(frame: RectFrame(from: frame))
        view.backgroundColor = color
        return view
      }
      
      func createSubview(size: CGSize, color: UIColor) -> UIView {
        creatSubview(frame: CGRect(origin: .zero, size: size), color: color)
      }
    


