//
//  HasAssociatedObjects.swift
//
//  Created by ToKoRo on 2015-11-07.
//

import Foundation

class AssociatedObjects: NSObject {

    var dictionary: [String: Any] = [:]

    var value: Any? {
        get {
            return self.dictionary[""]
        }
        set {
            self.dictionary[""] = newValue ?? ""
        }
    }

    subscript(key: String) -> Any? {
        get {
            return self.dictionary[key]
        }
        set {
            self.dictionary[key] = newValue
        }
    }

    func removeAll() {
        self.dictionary.removeAll()
    }

}

protocol HasAssociatedObjects {
    var associatedObjects: AssociatedObjects { get }
}

var AssociatedObjectsKey: UInt8 = 0

extension HasAssociatedObjects where Self: AnyObject {
    var associatedObjects: AssociatedObjects {
        guard let associatedObjects = objc_getAssociatedObject(self, &AssociatedObjectsKey) as? AssociatedObjects else {
            let associatedObjects = AssociatedObjects()
            objc_setAssociatedObject(self, &AssociatedObjectsKey, associatedObjects, .OBJC_ASSOCIATION_RETAIN)
            return associatedObjects
        }
        return associatedObjects
    }
}
