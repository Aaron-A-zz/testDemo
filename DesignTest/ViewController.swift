//
//  ViewController.swift
//  DesignTest
//
//  Created by Aaron on 5/7/16.
//  Copyright © 2016 Aaron A. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var menu: CariocaMenu?
    var logging = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
let menuCtrl = self.storyboard?.instantiateViewControllerWithIdentifier("MyMenu") as! MyMenuContentController
        menu = CariocaMenu(dataSource: menuCtrl)
        
        menu?.selectedIndexPath = NSIndexPath(forItem: 0, inSection: 0)
        menu?.boomerang = .None
        //reverse delegate for cell selection by tap :
        menuCtrl.cariocaMenu = menu

        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        menu?.addInView(self.view)
        menu?.isDraggableVertically = true
        //        menu?.showIndicator(.RightEdge, position: .Bottom, offset: -50)
        menu?.showIndicator(.RightEdge, position: .Center, offset: 30)
        //        menu?.showIndicator(.RightEdge, position: .Top, offset: 50)
        //        menu?.showIndicator(.LeftEdge, position: .Top, offset: 50)
        //        menu?.showIndicator(.LeftEdge, position: .Center, offset: 50)
        
        menu?.addGestureHelperViews([.LeftEdge,.RightEdge], width:30)

    }
    
    private func getEqualConstraint(item: AnyObject, toItem: AnyObject, attribute: NSLayoutAttribute) -> NSLayoutConstraint{
        return NSLayoutConstraint(item: item, attribute: attribute, relatedBy: .Equal, toItem: toItem, attribute: attribute, multiplier: 1, constant: 0)
    }
    
    func cariocaMenuDidSelect(menu:CariocaMenu, indexPath:NSIndexPath) {
        
       
    }
    
    ///`Optional` Called when the menu is about to open
    ///- parameters:
    ///  - menu: The opening menu object
    func cariocaMenuWillOpen(menu:CariocaMenu) {
        if(logging){
            print("carioca MenuWillOpen \(menu)")
        }
    }
    
    ///`Optional` Called when the menu just opened
    ///- parameters:
    ///  - menu: The opening menu object
    func cariocaMenuDidOpen(menu:CariocaMenu){
        if(logging){
            switch menu.openingEdge{
            case .LeftEdge:
                print("carioca MenuDidOpen \(menu) left")
                break;
            default:
                print("carioca MenuDidOpen \(menu) right")
                break;
            }
        }
    }
    
    ///`Optional` Called when the menu is about to be dismissed
    ///- parameters:
    ///  - menu: The disappearing menu object
    func cariocaMenuWillClose(menu:CariocaMenu) {
        if(logging){
            print("carioca MenuWillClose \(menu)")
        }
    }
    
    ///`Optional` Called when the menu is dismissed
    ///- parameters:
    ///  - menu: The disappearing menu object
    func cariocaMenuDidClose(menu:CariocaMenu){
        if(logging){
            print("carioca MenuDidClose \(menu)")
        }
    }
    
    // MARK: -
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//Used in demo controllers, simply to round the button's corners

class roundedButton: UIButton{
    
    override func drawRect(rect: CGRect) {
        self.layer.cornerRadius = 6
        self.clipsToBounds = true
    }




}

