//
//  ViewController.swift
//  localizationApp
//
//  Created by adelRadwan on 7/19/17.
//  Copyright © 2017 adelRadwan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var changeLanguageBtn: UIBarButtonItem!
    @IBOutlet weak var changeNameBtn: UIButton!
    @IBOutlet weak var nameLabel : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func changeLanguagePressButton(){
        
    
        if ChangeLang.currentLang() == "ar" {
            ChangeLang.setLanguage(lang: "en")
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }else{
           ChangeLang.setLanguage(lang: "ar")
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        }
        
        let windo = (UIApplication.shared.delegate as? AppDelegate)?.window
        
        let vc = UIStoryboard(name: "Main", bundle: nil)
        
        windo?.rootViewController = vc.instantiateViewController(withIdentifier: "root")
        
        UIView.transition(with: windo!, duration: 1, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
        
        if ChangeLang.isArabicLang() == true {
   
        }
        
        
    }
    
    
}

/*
 
 let def = UserDefaults.standard
 
 
 if let lang = def.object(forKey: "AppleLanguages") as? NSArray ,let firstLang = lang.firstObject as? String {
 
 if firstLang == "ar"{
 //chanege To English
 def.set(["en",firstLang], forKey: "AppleLanguages")
 
 }else{
 
 //Change To Arabic
 def.set(["ar",firstLang], forKey: "AppleLanguages")
 
 }
 def.synchronize()
 }
 
 

 
 */
