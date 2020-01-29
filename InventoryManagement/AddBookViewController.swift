//
//  AddBookViewController.swift
//  InventoryManagement
//
//  Created by Timm, Adria M on 1/28/20.
//  Copyright © 2020 Timm, Adria M. All rights reserved.
//

import Foundation
import Cocoa

class AddBookViewController: NSViewController {
    
     let filePath: String = "\(NSHomeDirectory())/tmp/book.txt"
    
    var ISBN: String = ""
    var Title: String = ""
    var Author: String = ""
    var Quantity: String = ""
    var Price: String = ""
    
//    let ISBNTextField: NSTextField = NSTextField()
//    let TitleTextField: NSTextField = NSTextField()
//    let AuthorTextField: NSTextField = NSTextField()
//    let QuantityTextField: NSTextField = NSTextField()
//    let PriceTextField: NSTextField = NSTextField()
    
    let vc: ViewController = ViewController()
    let bookTableView: NSScrollView = NSScrollView()

//
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        
        self.dismiss(self)
    }
    
    @IBAction func addButton(_ sender: Any) {
       // var myButton = NSButton.self
//        let myButtonRect = CGRect(x: 10, y: 10, width: 100, height: 10)
//              let myButton =  NSButton(frame: myButtonRect)
//              view.addSubview(myButton)
//           myButton.title = "Add Book"
//              myButton.target = self
//              myButton.action = Selector("Add")
                
//       button.addTarget(self, action: #selector(AddBookViewController.addBook), for: NSControl.Event.touchUpInside)
        
        
     
        ISBN = ISBNTextField.stringValue
        print("\(ISBN)")
        Title = titleTextField.stringValue
        print("\(Title)")
        Author = authorTextField.stringValue
        print("\(Author)")
        Quantity = quantityTextField.stringValue
        print("\(Quantity)")
        Price = priceTextField.stringValue
        print("\(Price)")
        
        vc.bookList.append(Book(isbn: ISBN, title: Title, author: Author, qty: Quantity, price: Price))
        print(vc.bookList[0])
        vc.saveToFile()
        vc.restoreFromFile()
        //vc.tableView.reloadData()


        self.vc.viewDidLoad()
        self.dismiss(self)

       // ISBNTextField.frame = CGRect(x: 10, y: 50, width: 30, height: 20)
//         ISBNTextField.textColor = NSColor.white
//         ISBNTextField.font = NSFont.systemFont(ofSize: 24.0)
//         ISBNTextField.backgroundColor = NSColor.white
//        ISBNTextField.delegate = self as? NSTextFieldDelegate
//        view.addSubview( ISBNTextField)
//
//       // TitleTextField.frame = CGRect(x: 50, y: 70, width: 30, height: 20)
//         TitleTextField.textColor = NSColor.white
//         TitleTextField.font = NSFont.systemFont(ofSize: 24.0)
//         TitleTextField.backgroundColor = NSColor.white
//        TitleTextField.delegate = self as? NSTextFieldDelegate
//               view.addSubview( TitleTextField)
//
//       // AuthorTextField.frame = CGRect(x: 100, y: 70, width: 300, height: 20)
//        AuthorTextField.textColor = NSColor.white
//        AuthorTextField.font = NSFont.systemFont(ofSize: 24.0)
//       AuthorTextField.backgroundColor = NSColor.white
//       AuthorTextField.delegate = self as? NSTextFieldDelegate
//                      view.addSubview( AuthorTextField)
//        //QuantityTextField.frame = CGRect(x: 100, y: 70, width: 300, height: 20)
//         QuantityTextField.textColor = NSColor.white
//         QuantityTextField.font = NSFont.systemFont(ofSize: 24.0)
//         QuantityTextField.backgroundColor = NSColor.white
//          QuantityTextField.delegate = self as? NSTextFieldDelegate
//                             view.addSubview( QuantityTextField)
//
//        //PriceTextField.frame = CGRect(x: 100, y: 50, width: 300, height: 20)
//        PriceTextField.textColor = NSColor.white
//         PriceTextField.font = NSFont.systemFont(ofSize: 24.0)
//          PriceTextField.backgroundColor = NSColor.white
//          PriceTextField.delegate = self as? NSTextFieldDelegate
//               view.addSubview(PriceTextField)
        
        //this is supposed to append it to the array, which I think it does but it doesnt save? or I can't figure out how to reload the viewcontroller or the table
       // var book = vc.books2
       // book.append(Book(isbn: ISBN, title: Title, author: Author, qty: Quantity, price: Price))
//
//        print(book[book.count - 1].isbn)
//        print(book.count - 1)
      
//        self.dismiss(self)
    }
    
    @IBOutlet weak var ISBNTextField: NSTextField!
    
    @IBOutlet weak var titleTextField: NSTextField!

    @IBOutlet weak var authorTextField: NSTextField!

    @IBOutlet weak var quantityTextField: NSTextField!

    @IBOutlet weak var priceTextField: NSTextField!
//
    @objc func addBook () {
    //let vc : ViewController =   presentingViewController as! ViewController
//    vc.books.append(Book(isbn: ISBN, title: Title, author: Author, qty: Quantity, price: Price))
//    vc.saveToFile()
//    vc.restoreFromFile()
//    vc.tableView.reloadData()
//
//
//      self.vc.viewDidLoad()
//        self.dismiss(self)
   }

@objc func clearRecords(){
     
         let vc : ViewController =  presentingViewController as! ViewController
         vc.deleteFile()
         vc.bookTableView.reloadData()
}
//
//}
}
