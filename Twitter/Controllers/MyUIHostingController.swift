//
//  UIHostingController.swift
//  Twitter
//
//  Created by Yuyu Qian on 11/13/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit
import SwiftUI


@available(iOS 13.0, *)
class MyUIHostingController: UIViewController {
    
    
    @IBSegueAction func showDetails(_ coder: NSCoder) -> UIViewController? {
        let detailsView = ProfileUIView()
        print("Here")
        return UIHostingController(coder: coder, rootView: detailsView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}

//@available(iOS 13.0, *)
//struct UIHostingController_Previews: PreviewProvider {
//    static var previews: some View {
//        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
//    }
//}
