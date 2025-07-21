//
//  Bundle.swift
//  EMI_Calculator_iOS
//
//  Created by Kishan Monpara on 19/07/25.
//

import Foundation
import ObjectiveC

private var bundleKey: UInt8 = 0

extension Bundle {
    class func setLanguage(_ language: String,
                           completioHandler:@escaping(_ isSucess: Bool,_ newBundle: Bundle?) -> Void) {
        defer {
            object_setClass(Bundle.main, PrivateBundle.self)
        }
        
        guard let path = Bundle.main.path(forResource: language, ofType: "lproj"),
              let languageBundle = Bundle(path: path) else {
            return
        }
        
        objc_setAssociatedObject(Bundle.main, &bundleKey, languageBundle, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        completioHandler(true, languageBundle)
    }
    
    private class PrivateBundle: Bundle, @unchecked Sendable {
        override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
            let languageBundle = objc_getAssociatedObject(self, &bundleKey) as? Bundle
            return languageBundle?.localizedString(forKey: key, value: value, table: tableName) ??
            super.localizedString(forKey: key, value: value, table: tableName)
        }
    }
    
}

/*private class BundleToken: Bundle, @unchecked Sendable {
    let bundle: Bundle?
    
    init(bundle: Bundle? = nil) {
        self.bundle = bundle
        super.init()
    }

    override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        return bundle?.localizedString(forKey: key, value: value, table: tableName) ?? super.localizedString(forKey: key, value: value, table: tableName)
    }
}*/
