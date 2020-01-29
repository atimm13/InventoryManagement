//
//  ViewController.swift
//  InventoryManagement
//
//  Created by Timm, Adria M on 1/28/20.
//  Copyright © 2020 Timm, Adria M. All rights reserved.
//

import Cocoa




class ViewController: NSViewController {
    
    var sortBy: String = "ISBN"
    var searchContents: String = ""
    let filePath: String = "\(NSHomeDirectory())/tmp/book.txt"
    let bookTableView: NSTableView = NSTableView()
    var bookList = [Book]()
    
    @IBOutlet weak var tableView: NSTableView!
    
    @objc dynamic var books: [Book] = [Book(isbn: "456", title: "This Book", author: "Adria Timm", qty: "7", price: "4.99"), Book(isbn: "345", title: "This Book Two", author: "Adria Timm", qty: "2", price: "5.99"), Book(isbn: "234", title: "This Book Three", author: "Adria Timm", qty: "6", price: "4.99"), Book(isbn: "567", title: "This Book Four", author: "Adria Timm", qty: "9", price: "3.99")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sort()
        //print(books[0].isbn)

        // Do any additional setup after loading the view.
    }
   
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
            tableView.reloadData()
        }
    }

    @IBOutlet weak var searchField: NSSearchField!
    
    @IBAction func searchButton(_ sender: Any) {
        searchContents = searchField.stringValue
        print("\(searchContents)")
        
        books.append(Book(isbn: "888", title: "Book ", author: "Adria Timm", qty: "9", price: "9.99"))
        tableView.reloadData()
        
        
    }
    
    @IBAction func addButton(_ sender: Any) {
      
    }
    
    @IBAction func removeButton(_ sender: Any) {
    }
    
    
    @IBAction func sortByISBN(_ sender: Any) {
        sortBy = "ISBN"
        print("sort by \(sortBy)")
        sort()
    }
    
    @IBAction func sortByTitle(_ sender: Any) {
        sortBy = "Title"
        print("sort by \(sortBy)")
        sort()
    }
    
    @IBAction func sortByAuthor(_ sender: Any) {
        sortBy = "Author"
        print("sort by \(sortBy)")
        sort()
    }
    
    func sort(){
        //called each time the sort by menu is clicked
        print("sort function called")
    }
    
    func saveToFile() {
        
        print("save to file function called")
            do {
                
                 let data = try NSKeyedArchiver.archivedData(withRootObject: bookList, requiringSecureCoding: false)
                if FileManager.default.createFile(atPath: filePath,
                                          contents: data,
                                          attributes: nil) {
                    print("File \(filePath) successfully created")
                }
                else {
                    print("File \(filePath) could not be created")
                }
                restoreFromFile()
               tableView.reloadData()
            }
            catch {
                print("Error archiving data: \(error)")
            }
        }
        
         func restoreFromFile() {
             do {
                 if let data = FileManager.default.contents(atPath: filePath) {
                     print("Retrieving data from file (filePath)")
                     bookList = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Book] ?? [Book]()
                    tableView.reloadData()
                 }
                 else {
                     print("No data available in file (filePath)")
                     bookList = [Book]()
                 }
             }
             catch {
                 print("Error unarchiving data: (error)")
             }
             //tableView.reloadData()
         }
        
         func deleteFile() {
            do {
                try FileManager.default.removeItem(atPath: filePath)
            }
            catch {
                print("Error deleting file: \(error)")
            }
        }
     @objc func clearBook() {
            //bookList.removeAll(where: <#T##(Book) throws -> Bool#>)()
        
            deleteFile()
            
          bookTableView.reloadData()
        }
        
              
    }
            



class Book: NSObject{
    @objc dynamic var isbn: String
    @objc dynamic var title: String
    @objc dynamic var author: String
    @objc dynamic var qty: String
    @objc dynamic var price: String
    //let filePath: String = "\(NSHomeDirectory())/tmp/book.txt"
    
    let ISBNKEY: String = "ISBN"
    let TITLEKEY: String = "Title"
    let AUTHORKEY: String = "Author"
    let QTYKEY: String = "Quantity"
    let PRICEKEY: String = "Price"

    init(isbn: String, title: String, author: String, qty: String, price: String){
        self.isbn = isbn
        self.title = title
        self.author = author
        self.qty = qty
        self.price = price

    }
    
    required init(coder aDecoder: NSCoder) {
        isbn = (aDecoder.decodeObject(forKey: ISBNKEY) as? String)!
        title = (aDecoder.decodeObject(forKey: TITLEKEY) as? String)!
        author = (aDecoder.decodeObject(forKey: AUTHORKEY) as? String)!
        qty = (aDecoder.decodeObject(forKey: QTYKEY) as? String)!
        price = (aDecoder.decodeObject(forKey: PRICEKEY) as? String)!
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(isbn, forKey: ISBNKEY)
        aCoder.encode(title, forKey: TITLEKEY)
        aCoder.encode(author, forKey: AUTHORKEY)
        aCoder.encode(qty, forKey: QTYKEY)
        aCoder.encode(price, forKey: PRICEKEY)
    }
    
}
