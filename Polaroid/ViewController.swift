//
//  ViewController.swift
//  Polaroid
//
//  Created by 方仕賢 on 2022/1/8.
//

import UIKit
import CoreImage.CIFilterBuiltins

//存入被編輯過的濾鏡圖片
var filterImage: UIImage?

//存入被編輯過的比例圖片
var petImageViewFrame = UIImageView(frame: CGRect(x: 36, y: 53, width: 239, height: 209))

//存入圖片
let image = UIImage(named: "pet")

class ViewController: UIViewController {
    //背景
    @IBOutlet weak var backgroundImageView: UIImageView!
    //照片
    @IBOutlet weak var petImageView: UIImageView!
    //背景加照片
    @IBOutlet weak var photoView: UIView!
    
    //濾鏡調整器
    @IBOutlet weak var filterSlider: UISlider!
    @IBOutlet weak var filterSlider2: UISlider!
    @IBOutlet weak var filterSlider3: UISlider!
    @IBOutlet weak var filterSlider4: UISlider!
    @IBOutlet weak var filterSlider5: UISlider!
    
    //生成找片的按鈕
    @IBOutlet weak var nextButton: UIView!
    
    //結束編輯的按鈕
    @IBOutlet weak var finishButton:
    UIButton!
    
    //選擇濾鏡種類的按鈕
    @IBOutlet weak var filterButton1: UIButton!
    @IBOutlet weak var filterButton2: UIButton!
    @IBOutlet weak var filterButton3: UIButton!
    @IBOutlet weak var filterButton4: UIButton!
    @IBOutlet weak var filterButton5: UIButton!
    @IBOutlet weak var filterButton6: UIButton!
    @IBOutlet weak var filterButton7: UIButton!
    
    //選擇比例種類的按鈕
    @IBOutlet weak var button43: UIButton!
    @IBOutlet weak var button169: UIButton!
    @IBOutlet weak var button54: UIButton!
    @IBOutlet weak var button32: UIButton!
    @IBOutlet weak var button11: UIButton!
    
    //全部功能選擇介面
    @IBOutlet weak var functionScrollView: UIScrollView!
    
    //比例功能選擇介面
    @IBOutlet weak var ratioScrollView: UIScrollView!
    
    //濾鏡功能選擇介面
    @IBOutlet weak var filterScrollView: UIScrollView!
    
    //背景功能選擇介面
    @IBOutlet weak var backgroundScrollView: UIScrollView!
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        hideAllSliders()
        finishButton.isHidden = true
        ratioScrollView.isHidden = true
        filterScrollView.isHidden = true
        backgroundScrollView.isHidden = true
        
    }
    
    //隱藏所有濾鏡調整器
    func hideAllSliders(){
        
        filterSlider.isHidden = true
        filterSlider2.isHidden = true
        filterSlider3.isHidden = true
        filterSlider4.isHidden = true
        filterSlider5.isHidden = true
        
    }
    
    
    //選擇濾鏡功能
    @IBAction func chooseFilters(_ sender: UIButton) {
        nextButton.isHidden = true
        finishButton.isHidden = false
        functionScrollView.isHidden = true
        filterScrollView.isHidden = false
        
        
        filterSlider.isHidden = false
        filterSlider2.isHidden = true
        filterSlider3.isHidden = true
        filterSlider4.isHidden = true
        filterSlider5.isHidden = true
        
        let ciImage = CIImage(image: image!)
        let filter = CIFilter.colorMonochrome()
        filter.inputImage = ciImage
        filter.intensity = 0.5
        
        if let outputCIImage = filter.outputImage {
            filterImage = UIImage(ciImage: outputCIImage)
            petImageView.image = filterImage
        }
  
    }
   //結束編輯
    @IBAction func finishEditingFilter(_ sender: UIButton) {
        
        hideAllSliders()
        functionScrollView.isHidden = false
        finishButton.isHidden = true
        nextButton.isHidden = false
        ratioScrollView.isHidden = true
        filterScrollView.isHidden = true
        backgroundScrollView.isHidden = true
    }
    
    
    //選擇第一個濾鏡
    @IBAction func filterButton1(_ sender: Any) {
        
        filterSlider.isHidden = false
        filterSlider2.isHidden = true
        filterSlider3.isHidden = true
        filterSlider4.isHidden = true
        filterSlider5.isHidden = true
        
        
        if let image = image {
            
            let ciImage = CIImage(image: image)
            let filter = CIFilter.colorMonochrome()
            filter.inputImage = ciImage
            filter.intensity = 0.5
            
            filterImage = UIImage(ciImage: filter.outputImage!)
                petImageView.image = filterImage
          
        }
        
        
    }
    
    //選擇第二個濾鏡
    @IBAction func filterButton2(_ sender: Any) {
        filterSlider.isHidden = true
        filterSlider2.isHidden = false
        filterSlider3.isHidden = true
        filterSlider4.isHidden = true
        filterSlider5.isHidden = true
        
        if let image = image {
            let ciImage = CIImage(image: image)
            let filter = CIFilter.zoomBlur()
            filter.inputImage = ciImage
            filter.amount = 0.5
            
            filterImage = UIImage(ciImage: filter.outputImage!)
                petImageView.image = filterImage
                
        }
        
    }
    
    //選擇第三個濾鏡
    @IBAction func filterButton3(_ sender: Any) {
        filterSlider.isHidden = true
        filterSlider2.isHidden = true
        filterSlider3.isHidden = false
        filterSlider4.isHidden = true
        filterSlider5.isHidden = true
        
        if let image = image {
            let ciImage = CIImage(image: image)
            let filter = CIFilter.vibrance()
            filter.inputImage = ciImage
            filter.amount = 0.5
           
            filterImage = UIImage(ciImage: filter.outputImage!)
                petImageView.image = filterImage
       
        }
        
    }
    
    //選擇第四個濾鏡
    @IBAction func filterButton4(_ sender: Any) {
        filterSlider.isHidden = true
        filterSlider2.isHidden = true
        filterSlider3.isHidden = true
        filterSlider4.isHidden = false
        filterSlider5.isHidden = true
        
        let ciImage = CIImage(image: image!)
        let filter = CIFilter.spotColor()
        filter.inputImage = ciImage
        filter.closeness1 = 0.5
        filter.closeness2 = 0.5
        filter.closeness3 = 0.5
        filter.contrast1 = 0.5
        filter.contrast2 = 0.5
        filter.contrast3 = 0.5
        
        filterImage = UIImage(ciImage: filter.outputImage!)
            petImageView.image = filterImage
         
    }
    
    //選擇第五個濾鏡
    @IBAction func filterButton5(_ sender: Any) {
        filterSlider.isHidden = true
        filterSlider2.isHidden = true
        filterSlider3.isHidden = true
        filterSlider4.isHidden = true
        filterSlider5.isHidden = false
        
        if let image = image {
            let ciImage = CIImage(image: image)
            let filter = CIFilter.vignetteEffect()
            filter.inputImage = ciImage
            filter.intensity = 0.5
            filter.radius = 0.5
            
            
            if let outputIamge = filter.outputImage {
                let filterImage = UIImage(ciImage: outputIamge)
                petImageView.image = filterImage
             
            }
        }
        
    }
    
    
    //調整第一個濾鏡
    @IBAction func filterSliderChange(_ sender: UISlider) {
        
        if let image = image {
            let ciImage = CIImage(image: image)
            let filter = CIFilter.colorMonochrome()
            filter.inputImage = ciImage
            filter.intensity = sender.value
            
            filterImage = UIImage(ciImage: filter.outputImage!)
                petImageView.image = filterImage
              
        }
        
        
    }
    
    //調整第二個濾鏡
    @IBAction func filterSliderChange2(_ sender: UISlider) {
        
        if let image = image {
            let ciImage = CIImage(image: image)
            let filter = CIFilter.zoomBlur()
            filter.inputImage = ciImage
            filter.amount = sender.value
            
            filterImage = UIImage(ciImage: filter.outputImage!)
                petImageView.image = filterImage
          
        }
     
    }
    
    //調整第三個濾鏡
    @IBAction func filterSliderChange3(_ sender: UISlider) {
        
        if let image = image {
            
            let ciImage = CIImage(image: image)
            let filter = CIFilter.vibrance()
            filter.inputImage = ciImage
            filter.amount = sender.value
           
            filterImage = UIImage(ciImage: filter.outputImage!)
            
            petImageView.image = filterImage
         
        }
    }
    
    //調整第四個濾鏡
    @IBAction func filterSliderChange4(_ sender: UISlider){
        
        if let image = image {
            
            let ciImage = CIImage(image: image)
            let filter = CIFilter.spotColor()
            filter.inputImage = ciImage
            filter.closeness1 = sender.value
            filter.closeness2 = 0.5
            filter.closeness3 = 0.5
            filter.contrast1 = sender.value
            filter.contrast2 = 0.5
            filter.contrast3 = 0.5
            
            
            let filterImage = UIImage(ciImage: filter.outputImage!)
                petImageView.image = filterImage
            
        }
     
    }
    
    //調整第五個濾鏡
    @IBAction func filterSliderChange5(_ sender: UISlider) {
        
        if let image = image {
            let ciImage = CIImage(image: image)
            
            let filter = CIFilter.vignetteEffect()
            filter.inputImage = ciImage
            filter.intensity = sender.value
            filter.radius = 0.5
            
        
            let filterImage = UIImage(ciImage: filter.outputImage!)
            petImageView.image = filterImage
       
        }
            
    }
    
    //選擇調整比例功能
    @IBAction func chooseRatio(_ sender: UIButton) {
        
        functionScrollView.isHidden = true
        finishButton.isHidden = false
        ratioScrollView.isHidden = false
        nextButton.isHidden = true
        
    }
    
    //選擇第一種比例
    @IBAction func ratio43(_ sender: Any) {
        
        petImageView.frame = CGRect(origin: CGPoint(x: petImageView.frame.minX, y: petImageView.frame.minY),size: CGSize(width: petImageView.frame.width, height: petImageView.frame.width * 3 / 4))
        
        petImageViewFrame.frame = petImageView.frame
        
        button43.isHidden = true
        button32.isHidden = false
        button54.isHidden = false
        button169.isHidden = false
        button11.isHidden = false
    }
    
    //選擇第二種比例
    @IBAction func ratio169(_ sender: Any) {
        
        petImageView.frame = CGRect(origin: CGPoint(x: petImageView.frame.minX, y: petImageView.frame.minY),size: CGSize(width: petImageView.frame.width, height: petImageView.frame.width * 9 / 16))
        
        print("\(petImageViewFrame.frame)")
        
        petImageViewFrame.frame = petImageView.frame
        
        button43.isHidden = false
        button32.isHidden = true
        button54.isHidden = false
        button169.isHidden = false
        button11.isHidden = false

    }
    
    //選擇第三種比例
    @IBAction func ratio54(_ sender: Any) {
        
        petImageView.frame = CGRect(origin: CGPoint(x: petImageView.frame.minX, y: petImageView.frame.minY),size: CGSize(width: petImageView.frame.width, height: petImageView.frame.width * 4 / 5))
        print("\(petImageViewFrame.frame)")
        petImageViewFrame.frame = petImageView.frame
        
        button43.isHidden = false
        button32.isHidden = false
        button54.isHidden = true
        button169.isHidden = false
        button11.isHidden = false

    }
    
    //選擇第四種比例
    @IBAction func ratio32(_ sender: Any) {
        
        petImageView.frame = CGRect(origin: CGPoint(x: petImageView.frame.minX, y: petImageView.frame.minY),size: CGSize(width: petImageView.frame.width, height: petImageView.frame.width * 2 / 3))
        print("\(petImageViewFrame.frame)")
        petImageViewFrame.frame = petImageView.frame
        
        button43.isHidden = false
        button32.isHidden = false
        button54.isHidden = false
        button169.isHidden = true
        button11.isHidden = false

    }
    
    //選擇第五種比例
    @IBAction func ratio11(_ sender: Any) {
        petImageView.frame = CGRect(origin: CGPoint(x: petImageView.frame.minX, y: petImageView.frame.minY),size: CGSize(width: petImageView.frame.width, height: petImageView.frame.width))
        print("\(petImageViewFrame.frame)")
        petImageViewFrame.frame = petImageView.frame
        
        button43.isHidden = false
        button32.isHidden = false
        button54.isHidden = false
        button169.isHidden = false
        button11.isHidden = true

    }
    
    //選擇更換背景功能
    @IBAction func chooseBackground(_ sender: Any) {
        backgroundScrollView.isHidden = false
        functionScrollView.isHidden = true
        finishButton.isHidden = false
        nextButton.isHidden = true
    }
    
    //選擇第一種背景
    @IBAction func chooseDoodle1(_ sender: Any) {
        backgroundImageView.image = UIImage(named: "doodle1")
        printedBackground.image = backgroundImageView.image
    }
    
    //選擇第二種背景
    @IBAction func chooseDoodle2(_ sender: Any) {
        backgroundImageView.image = UIImage(named: "doodle2")
        printedBackground.image = backgroundImageView.image
    }
    
    //選擇第三種背景
    @IBAction func chooseFlowers1(_ sender: Any) {
        backgroundImageView.image = UIImage(named: "flowers1")
        printedBackground.image = backgroundImageView.image
    }
    
    //選擇第四種背景
    @IBAction func chooseFlowers2(_ sender: Any) {
        backgroundImageView.image = UIImage(named: "flowers2")
        printedBackground.image = backgroundImageView.image
    }
    
    //選擇第五種背景
    @IBAction func choosePainting1(_ sender: Any) {
        backgroundImageView.image = UIImage(named: "painting1")
        printedBackground.image = backgroundImageView.image
    }
    
    //選擇第六種背景
    @IBAction func choosePainting2(_ sender: Any) {
        backgroundImageView.image = UIImage(named: "painting2")
        printedBackground.image = backgroundImageView.image
    }
    
    
    
    
    
}

