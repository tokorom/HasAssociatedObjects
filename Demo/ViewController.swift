//
//  ViewController.swift
//
//  Created by ToKoRo on 2015-11-08.
//

import UIKit
import HasAssociatedObjects

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.associatedObjects.value = "SUCCESS :)"
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        self.label?.text = self.associatedObjects.value as? String
    }

}

// MARK: - HasAssociatedObjects

extension ViewController: HasAssociatedObjects {
}
