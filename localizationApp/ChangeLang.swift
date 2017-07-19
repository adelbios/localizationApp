//
//  ChangeLang.swift
//  localizationApp
//
//  Created by adelRadwan on 7/19/17.
//  Copyright © 2017 adelRadwan. All rights reserved.
//

import Foundation


class ChangeLang {
    
    
    class func currentLang()->String{
        
        let def = UserDefaults.standard
        let lang = def.object(forKey: "AppleLanguages") as! NSArray
        let firstLang = lang.firstObject as! String
        
        
        return firstLang
        
    }
    
    
    class func setLanguage(lang : String){
        
        let def = UserDefaults.standard
        def.set([lang , currentLang()], forKey: "AppleLanguages")
        def.synchronize()
        
    }
    
    
    
  class  func isArabicLang()->Bool{

    return self.currentLang() == "ar" ? true : false
        
    }
    
    
}
