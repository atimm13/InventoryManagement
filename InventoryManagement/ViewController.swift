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
    var rowSelected = Int()
    
    @IBOutlet weak var tableView: NSTableView!
    
    @IBAction func tableView(_ sender: Any) {
        rowSelected = tableView.selectedRow
        
    }
    
  
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
        
    }
   
    
    @IBAction func addButton(_ sender: Any) {
      
    }
    
    @IBAction func removeButton(_ sender: Any) {
        
        let alert = NSAlert()
        
        alert.messageText = "Are you sure you want to delete entry?"
        //alert.informativeText = "Are you?"
        alert.alertStyle = .warning
        alert.addButton(withTitle: "Yes")
        alert.addButton(withTitle: "No")
        
        let answer = alert.runModal()
        
        if answer == NSApplication.ModalResponse.alertFirstButtonReturn {
            tableView.removeRows(at: [rowSelected], withAnimation: .effectFade)
        }
        
        
       
    }
    
    
    
    @IBAction func sortByISBN(_ sender: Any) {
        sortBy = "ISBN"
        //print("sort by \(sortBy)")
        sort()
    }
    
    @IBAction func sortByTitle(_ sender: Any) {
        sortBy = "Title"
        //print("sort by \(sortBy)")
        sort()
        
        
    }
    
    @IBAction func sortByAuthor(_ sender: Any) {
        sortBy = "Author"
        //print("sort by \(sortBy)")
        sort()
    }
    
    func sort(){
        //called each time the sort by menu is clicked
        print("sort function called")
    }
    
    @IBAction func reloadTableButton(_ sender: Any) {
        books = []
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
        if p.contains("$"){
        
            let monkeyLine = "\(i)%\(t)%\(a)%\(q)%\(p)\n"

            if let fileUpdater = try? FileHandle(forWritingAtPath: "/Users/fq5170kj/Desktop/xcodeApps/InventoryManagement/InventoryManagement/BooksFile.txt") {

                fileUpdater.seekToEndOfFile()

                fileUpdater.write(monkeyLine.data(using: .utf8)!)

                fileUpdater.closeFile()
            }
            
        }else {
            
            let tempP: String = "$" + p
            
            let monkeyLine = "\(i)%\(t)%\(a)%\(q)%\(tempP)\n"

            if let fileUpdater = try? FileHandle(forWritingAtPath: "/Users/fq5170kj/Desktop/xcodeApps/InventoryManagement/InventoryManagement/BooksFile.txt") {
                
                fileUpdater.seekToEndOfFile()

                fileUpdater.write(monkeyLine.data(using: .utf8)!)

                fileUpdater.closeFile()
        }
        
      
    }
    
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
