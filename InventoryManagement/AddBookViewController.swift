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
        // Do any additional setup after loading the view.
        
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
        
        
        
        //this is supposed to append it to the array, which I think it does but it doesnt save? or I can't figure out how to reload the viewcontroller or the table
        var book = vc.books
        book.append(Book(isbn: ISBN, title: Title, author: Author, qty: Quantity, price: Price))
       
        print(book[book.count - 1].isbn)
        print(book.count - 1)
      
//        self.dismiss(self)
    }
    
    @IBOutlet weak var ISBNTextField: NSTextField!
    
    @IBOutlet weak var titleTextField: NSTextField!
    
    @IBOutlet weak var authorTextField: NSTextField!
    
    @IBOutlet weak var quantityTextField: NSTextField!
    
    @IBOutlet weak var priceTextField: NSTextField!
    
    
    
}
