//
//  ViewController.swift
//  PhotoMaster
//
//  Created by 遠藤佳奈 on 2017/06/11.
//  Copyright © 2017年 遠藤佳奈. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UINavigationControllerDelegate ,UIImagePickerControllerDelegate {
    
    @IBOutlet var photoImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func onTappedAlbumButton(){
        presentPickerController(sourceType: .photoLibrary)
    }
    
    func presentPickerController(sourceType: UIImagePickerControllerSourceType){
        if UIImagePickerController.isSourceTypeAvailable(sourceType){
            let picker = UIImagePickerController()
            picker.sourceType = sourceType
            picker.delegate = self
            self.present(picker, animated: true,completion: nil)
        }
    }
    
   
    
    func drawText(image: UIImage) -> UIImage{
        
        
        
        
        let text = "でぃお"
        let textFontAttributes = [
            NSFontAttributeName: UIFont(name:"Arial", size: 50)!,
            NSForegroundColorAttributeName: UIColor.red]
        
        
        UIGraphicsBeginImageContext(image.size)
 
        
        image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        
        
        let margin: CGFloat = 5.0
        
        let textRect = CGRect(x: margin, y: margin, width: image.size.width - margin, height: image.size.height - margin)
        
        
   
        
        text.draw(in: textRect, withAttributes: textFontAttributes)
        
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
   
        
        UIGraphicsEndImageContext()
        
        
        
        return newImage!
    }
    
    func drawMaskImage(image: UIImage) -> UIImage {
        
        
        
        let maskImage = UIImage(named: "628880.origidkgm")!
        
        UIGraphicsBeginImageContext(image.size)
        
        image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        
        
        
        let margin: CGFloat = 70.0
        
        let maskRect = CGRect(x: image.size.width - maskImage.size.width - margin,
                              
                              y: image.size.height - maskImage.size.height - margin,
                              
                              width: maskImage.size.width, height: maskImage.size.height)
        
        
        
        maskImage.draw(in: maskRect)
        
        
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        
        
        UIGraphicsEndImageContext()
        
        
        
        return newImage!
    }
    
    @IBAction func banana(_ sender: Any) {
        performSegue(withIdentifier: "goToNameViewController", sender: nil)
    }
    @IBAction func onTappedTextButton(){
        
       
//        if photoImageView.image != nil {
//        photoImageView.image = drawText(image: photoImageView.image!)
//        } else {
//            print("画像がありません")
//        }
    }
    @IBAction func onTappedIllustButton(){
        if photoImageView.image != nil{
            photoImageView.image = drawMaskImage(image: photoImageView.image!)
        } else {
            print("画像がありません")
        }
    }
    
    @IBAction func onTappedUploadButton() {
        
        if photoImageView.image != nil {
            
            // 共有するアイテムを設定
            
            let activityVC = UIActivityViewController(activityItems: [photoImageView.image!,"#PhotoMatser"],
                                                      
                                                      applicationActivities: nil)
            
            self.present(activityVC, animated: true, completion: nil)
            
        } else {
            
            print("画像がありません")
            
        }
        
    }
    
    @IBAction func takePhoto(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.delegate = self
            picker.allowsEditing = true
            
            present(picker, animated: true, completion: nil)
        } else {
            print("error")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[String: Any]) {
        self.dismiss(animated: true,completion: nil)
        photoImageView.image = info[UIImagePickerControllerOriginalImage]as? UIImage
    }
    
    
}
