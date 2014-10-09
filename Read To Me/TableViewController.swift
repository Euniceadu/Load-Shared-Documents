//
//  TableViewController.swift
//  Read To Me
//
//  Created by Products Department on 10/9/14.
//  Copyright (c) 2014 Eunice. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var filesList: [String] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        filesList = listFilesFromDocumentsFolder();
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier:"cell")
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
    if ((self.navigationController) != nil) {
    self.navigationController.navigationBar.hidden = true;
    }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.filesList.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        cell.textLabel.text = self.filesList[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        var vcid: String = "loadView";
        let readerResult: LoadViewController = self.storyboard.instantiateViewControllerWithIdentifier(vcid) as LoadViewController
        readerResult.selectedFileName = self.filesList[indexPath.row]

        self.navigationController.pushViewController(readerResult, animated: true)
//        [self.navigationController pushViewController:readerResult animated:YES];
//        self.displayAlert("You selected cell #\(indexPath.row)!")
        
    }
    
    func displayAlert(str: NSString) {
        var alert: UIAlertView;
        alert = UIAlertView(title: "Alert", message: str, delegate: self, cancelButtonTitle: "OK");
        alert.show()
    }
    
    func listFilesFromDocumentsFolder() -> [String] {
        var files: [String]
        var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        var documentsDirectory : String;
        documentsDirectory = paths[0] as String
        var fileManager: NSFileManager = NSFileManager()
        var fileList: NSArray = fileManager.contentsOfDirectoryAtPath(documentsDirectory, error: nil)!
        
//        var filesStr: NSMutableString = NSMutableString(string: "Files in Documents folder \n")
//        for s in fileList {
//            filesStr.appendFormat("%@", s as String)
//        }
        
//        self.displayAlert(filesStr)
        return fileList as [String]
    }
    
    
}

