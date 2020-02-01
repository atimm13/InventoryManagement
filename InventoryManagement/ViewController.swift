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
    let textToWrite: String = "This is a new book"
    
    @IBOutlet weak var tableView: NSTableView!
    
    
    @objc dynamic var books: [Book] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        print("view loaded")
        
        do {
            let path: String = "/Users/fq5170kj/Desktop/xcodeApps/InventoryManagement/InventoryManagement/BooksFile.txt"
            let file = try String(contentsOfFile: path)
            let text: [String] = file.components(separatedBy: "\n")
            
            
            for line in text {
                
                if line != "" {
                    //print(line)
                   
                    let sections: [String] = line.components(separatedBy: "%")
                    
                    let newIsbn: String = sections[0]
                    let newTitle: String = sections[1]
                    let newAuthor: String = sections[2]
                    let newQty: String = sections[3]
                    let newPrice: String = sections[4]
    
                    books.append(Book(isbn: newIsbn, title: newTitle, author: newAuthor, qty: newQty, price: newPrice))

                }
                
            }
           
            
        } catch let error {
            print("Fatal Error: \(error.localizedDescription)")
        }
        
        
        
    }
    
    override func viewDidAppear() {
        print("view did apear")
    }
   
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
           // tableView.reloadData()
        }
    }

    @IBOutlet weak var searchField: NSSearchField!
    
    @IBAction func searchButton(_ sender: Any) {
        searchContents = searchField.stringValue
        print("\(searchContents)")
        books.append(Book(isbn: "this", title: "is", author: "the", qty: "new", price: "book"))
        //tableView.reloadData()
        
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
    
    @IBAction func reloadTableButton(_ sender: Any) {
        
        do {
                let path: String = "/Users/fq5170kj/Desktop/xcodeApps/InventoryManagement/InventoryManagement/BooksFile.txt"
                let file = try String(contentsOfFile: path)
                let text: [String] = file.components(separatedBy: "\n")
                
                
                for line in text {
                    
                    if line != "" {
                        //print(line)
                       
                        let sections: [String] = line.components(separatedBy: "%")
                        
                        let newIsbn: String = sections[0]
                        let newTitle: String = sections[1]
                        let newAuthor: String = sections[2]
                        let newQty: String = sections[3]
                        let newPrice: String = sections[4]
        
                        books.append(Book(isbn: newIsbn, title: newTitle, author: newAuthor, qty: newQty, price: newPrice))

                    }
                    
                }
               
                
            } catch let error {
                print("Fatal Error: \(error.localizedDescription)")
            }
        
    }
    
    
    
    func addBook(i: String, t: String, a: String, q: String, p: String){
        //books.append(Book(isbn: i, title: t, author: a, qty: q, price: p))
        
        let monkeyLine = "\(i)%\(t)%\(a)%\(q)%\(p)\n"

        if let fileUpdater = try? FileHandle(forWritingAtPath: "/Users/fq5170kj/Desktop/xcodeApps/InventoryManagement/InventoryManagement/BooksFile.txt") {
            
             // function which when called will cause all updates to start from end of the file
             fileUpdater.seekToEndOfFile()

            // which lets the caller move editing to any position within the file by supplying an offset
           fileUpdater.write(monkeyLine.data(using: .utf8)!)

            //Once we convert our new content to data and write it, we close the file and that’s it!
           fileUpdater.closeFile()
        }
        
        
        //currently writes the input on last line, but does not update the table..
        //writeFileToTable()
        
      
    }
    
    
}
            



class Book: NSObject{
    @objc dynamic var isbn: String
    @objc dynamic var title: String
    @objc dynamic var author: String
    @objc dynamic var qty: String
    @objc dynamic var price: String


    init(isbn: String, title: String, author: String, qty: String, price: String){
        self.isbn = isbn
        self.title = title
        self.author = author
        self.qty = qty
        self.price = price

    }
    
}
