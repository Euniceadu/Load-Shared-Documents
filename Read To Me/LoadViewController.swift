//
//  LoadViewController.swift
//  Read To Me
//
//  Created by Products Department on 10/9/14.
//  Copyright (c) 2014 Eunice. All rights reserved.
//

import UIKit

class LoadViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    var selectedFileName: String = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadFileFromDocumentsFolder(self.selectedFileName)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    
    
}
