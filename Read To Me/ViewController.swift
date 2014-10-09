//
//  ViewController.swift
//  Read To Me
//
//  Created by Products Department on 10/8/14.
//  Copyright (c) 2014 Eunice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
//    var fileName;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        listFilesFromDocumentsFolder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayAlert(str: NSString) {
        var alert: UIAlertView;
         alert = UIAlertView(title: "Alert", message: str, delegate: self, cancelButtonTitle: "OK");
        alert.show()
    }
    
    func handleDocumentOpenURL(url: NSURL) {
        var requestObj = NSURLRequest(URL: url)
        webView.userInteractionEnabled = true
        webView.loadRequest(requestObj)
    }
    
    func loadFileFromDocumentsFolder(fileName: String) {
        var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        var documentsDirectory : String;
        documentsDirectory = paths[0] as String
        var filePath: String = documentsDirectory.stringByAppendingPathComponent(fileName);
        var fileUrl: NSURL = NSURL(fileURLWithPath: filePath);
        self.handleDocumentOpenURL(fileUrl)
        
    }
    
    func listFilesFromDocumentsFolder() {
        var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        var documentsDirectory : String;
        documentsDirectory = paths[0] as String
        var fileManager: NSFileManager = NSFileManager()
        var fileList: NSArray = fileManager.contentsOfDirectoryAtPath(documentsDirectory, error: nil)!
        var filesStr: NSMutableString = NSMutableString(string: "Files in Documents folder \n")
        for s in fileList {
            filesStr.appendFormat("%@", s as String)
        }
        
        self.displayAlert(filesStr)
//        self.loadFileFromDocumentsFolder(<#fileName: String#>)
    }


}

