//
//  Language.swift
//  localizationApp
//
//  Created by adelRadwan on 7/19/17.
//  Copyright © 2017 adelRadwan. All rights reserved.
//

import Foundation
import UIKit

class Language {
    
    class func implementChangeLanguage(){
        
        // implement Exchange method for user interface direction and Localization
        
        exchangeMethod(forClass: Bundle.self, originalSelector: #selector(Bundle.localizedString(forKey:value:table:)), overrideSelector: #selector(Bundle.customLocalizedString(forKey:value:table:)))
        
         exchangeMethod(forClass: UIApplication.self, originalSelector: Selector("userInterfaceLayoutDirection"), overrideSelector: Selector("customInterfaceDrictio"))
    }
    
}


extension Bundle {
    
    
    /*
 
 explain :  on class Bundle ... found function Which is responsible for localization
     there is ---  open func localizedString(forKey key: String, value: String?, table tableName: String?) -> String
 
   if u want change lunnguage without reRun app's do exchange for this metho here in customLocalizedString do override for it 
     
 
 */
      func customLocalizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        
        let currentLang = ChangeLang.currentLang()
        var b = Bundle()
        
        
        if let path = Bundle.main.path(forResource: currentLang, ofType: "lproj") {
            
            b = Bundle(path: path)!
            
        }else{
            
            let path = Bundle.main.path(forResource: "Base", ofType: "lproj")
            
            b = Bundle(path: path!)!
            
        }
        
       return  b.customLocalizedString(forKey: key, value: value, table: tableName)
    }
    
    
}

extension UIApplication {
    
    var customInterfaceDrictio : UIUserInterfaceLayoutDirection {
        get{
            var direction = UIUserInterfaceLayoutDirection.leftToRight
            
            if ChangeLang.currentLang() == "ar" {
                direction = .rightToLeft
            }
            
            return direction
        }
    }

    
}


func exchangeMethod(forClass className : AnyClass , originalSelector : Selector , overrideSelector : Selector){
    
    let originalMethod : Method = class_getInstanceMethod(className, originalSelector)
    let overrideMethod : Method = class_getInstanceMethod(className, overrideSelector)
    
    let methodImplement     = method_getImplementation(overrideMethod)
    let methodType = method_getTypeEncoding(overrideMethod)
    
    let methodOriginalImplement     = method_getImplementation(originalMethod)
    let methodOriginalType          = method_getTypeEncoding(originalMethod)
    
    if  class_addMethod(className, originalSelector, methodImplement, methodType) {
       
        class_replaceMethod(className, overrideSelector, methodOriginalImplement, methodOriginalType)
        
    }else{
        
        method_exchangeImplementations(originalMethod, overrideMethod)
        
    }
    
    
}
