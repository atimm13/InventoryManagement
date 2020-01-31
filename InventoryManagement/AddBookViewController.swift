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
    
    
    
    var ISBN: String = ""
    var Title: String = ""
    var Author: String = ""
    var Quantity: String = ""
    var Price: String = ""
    
    
    let vc: ViewController = ViewController()

    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        
        self.dismiss(self)
    }
    
    @IBAction func addButton(_ sender: Any) {
        
     
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
        
        //vc.bookList.append(Book(isbn: ISBN, title: Title, author: Author, qty: Quantity, price: Price))
 
        vc.addBook(i: ISBN, t: Title, a: Author, q: Quantity, p: Price)
        self.dismiss(self)

    
    }
    
    @IBOutlet weak var ISBNTextField: NSTextField!
    
    @IBOutlet weak var titleTextField: NSTextField!

    @IBOutlet weak var authorTextField: NSTextField!

    @IBOutlet weak var quantityTextField: NSTextField!

    @IBOutlet weak var priceTextField: NSTextField!


}


