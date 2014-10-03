//
//  ViewController.swift
//  ImsgeView
//
//  Created by Student on 10/3/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import UIKit
import AssetsLibrary


class ViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    var context: CIContext!
    var filter: CIFilter!
    var beginImage: CIImage!
    var orientation: UIImageOrientation = .Up
    
    

    @IBOutlet weak var UlImageCiew: UIImageView!
    
    @IBOutlet var amountSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileURL = NSBundle.mainBundle().URLForResource("image", withExtension: "jpg")
        
        beginImage = CIImage(contentsOfURL: fileURL)
        
        filter = CIFilter(name: "CISepiaTone")
        filter.setValue(beginImage, forKey: kCIInputImageKey)
        filter.setValue(0.5, forKey: kCIInputIntensityKey)
        let outputImage = filter.outputImage
        
        context = CIContext(options: nil)
        let cgimg = context.createCGImage(outputImage, fromRect: outputImage.extent())
        
        let newImage = UIImage(CGImage: cgimg)
        
        self.UlImageCiew.image = newImage
        
        self.logAllFilters()
        
        
        
    }
    
    @IBAction func loadPhoto(sender: AnyObject) {
        let pickerC = UIImagePickerController()
        pickerC.delegate = self
        self.presentViewController(pickerC, animated: true, completion: nil)
    }
    

    @IBAction func savePhoto(sender: AnyObject) {
        let imageToSave = filter.outputImage
        
        let softwareContext = CIContext(options: [kCIContextUseSoftwareRenderer:true])
        
        let cgimg = softwareContext.createCGImage(imageToSave, fromRect: imageToSave.extent())
        
        let library = ALAssetsLibrary()
        library.writeImageToSavedPhotosAlbum(cgimg, metadata:imageToSave.properties(),completionBlock:nil)
        
    }
    
    
   
    @IBAction func amountSliderValueChanged(sender: UISlider) {
        let sliderValue = sender.value
        
        
     let outputImage = self.oldPhoto(beginImage, withAmount: sliderValue)
        
       
        let cgimg = context.createCGImage(outputImage, fromRect: outputImage.extent())
        
        let newImage = UIImage(CGImage: cgimg, scale:1, orientation: orientation)
        self.UlImageCiew.image = newImage
    }
    
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info:NSDictionary!) {
        self.dismissViewControllerAnimated(true, completion: nil);
        
        let gotImage = info[UIImagePickerControllerOriginalImage] as UIImage
        
        beginImage = CIImage(image: gotImage)
        orientation = gotImage.imageOrientation
        filter.setValue(beginImage, forKey: kCIInputImageKey)
        self.amountSliderValueChanged(amountSlider)
        
    }
    
    func logAllFilters(){
        let properties = CIFilter.filterNamesInCategory(kCICategoryBuiltIn)
        print(properties)
    
        for filterName:AnyObject in properties{
        let fltr = CIFilter(name:filterName as String)
        print(fltr.attributes())
    }
}


    func oldPhoto(img:CIImage,withAmount intensity: Float) -> CIImage{
        
        let sepia = CIFilter(name:"CISepiaTone")
        sepia.setValue(img, forKey: kCIInputImageKey)
        sepia.setValue(intensity, forKey: "inputIntensity")
        
        let random = CIFilter(name:"CIRandomGenerator")
        
        let lighten = CIFilter(name:"CIColorControls")
        lighten.setValue(random.outputImage, forKey: kCIInputImageKey)
        lighten.setValue(1 - intensity, forKey: "inputBrightness")
        lighten.setValue(0, forKey: "inputSatulation")
    
        let croppedImage = lighten.outputImage.imageByCroppingToRect(beginImage.extent())
        
        
        let composite = CIFilter(name: "CIHardLightBlendMode")
        composite.setValue(sepia.outputImage, forKey: kCIInputImageKey)
        composite.setValue(croppedImage, forKey: kCIInputBackgroundImageKey)
        
        let vignette = CIFilter(name: "CIVignette")
        vignette.setValue(composite.outputImage, forKey: kCIInputImageKey)
        vignette.setValue(intensity * 2, forKey: "inputIntensity")
        vignette.setValue(intensity * 30, forKey: "iputRadius")
        
        return vignette.outputImage
        
        
        
    
}


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

