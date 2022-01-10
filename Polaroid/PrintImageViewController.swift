//
//  PrintImageViewController.swift
//  Polaroid
//
//  Created by 方仕賢 on 2022/1/9.
//

import UIKit

//存入被編輯過的背景圖片
var printedBackground = UIImageView(frame: CGRect(x: -12, y: -10, width: 333, height: 379))


class PrintImageViewController: UIViewController {
    
    //印出來的背景加照片
    @IBOutlet weak var printedPhoteView: UIView!
    //被印出來的背景
    @IBOutlet weak var backgroundImageView: UIImageView!
    //被印出來的照片
    @IBOutlet weak var printedPetImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        insertImage()
        // Do any additional setup after loading the view.
        
    }
    
    //插入圖片
    func insertImage(){
       
    
        backgroundImageView.image = printedBackground.image
    
            printedPetImageView.frame = petImageViewFrame.frame
         
        
        if let printedImage = filterImage {
            
            printedPetImageView.image = printedImage

        } else {
            
            printedPetImageView.image = image
        }
        
        //照片加背景的動畫
        let animator = UIViewPropertyAnimator(duration: 2, curve: .easeIn) {
            self.printedPhoteView.frame = self.printedPhoteView.frame.offsetBy(dx: 0, dy: 300)
        }
        
        animator.startAnimation()
    }

}
