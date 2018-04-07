//
//  ViewController.swift
//  ExpandTableView Example
//
//  Created by Shiju Varghese on 07/04/18.
//  Copyright © 2018 Shiju. All rights reserved.
//

import UIKit

struct cellData {
  
  var cellOpened = Bool()
  var sectionTitle = String()
  var sectionData = [String]()
  
}

class ViewController: UITableViewController {

  var tableData = [cellData]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableData =
      
    [cellData(cellOpened: false, sectionTitle: "Title 1", sectionData: ["Cell 1", "Cell 2", "Cell 3"]),
    cellData(cellOpened: false, sectionTitle: "Title 2", sectionData: ["Cell 1", "Cell 2", "Cell 3"]),
    cellData(cellOpened: false, sectionTitle: "Title 3", sectionData: ["Cell 1", "Cell 2", "Cell 3"]),
    cellData(cellOpened: false, sectionTitle: "Title 4", sectionData: ["Cell 1", "Cell 2", "Cell 3"]),
    cellData(cellOpened: false, sectionTitle: "Title 5", sectionData: ["Cell 1", "Cell 2", "Cell 3"])]
    
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return tableData.count
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if tableData[section].cellOpened == true {
      return tableData[section].sectionData.count + 1
    }
    
    return 1
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if indexPath.row == 0 {
      
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell()}
      
      cell.textLabel?.text = tableData[indexPath.section].sectionTitle
      
      return cell
      
    }else {
      
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell()}
      
      cell.textLabel?.text = tableData[indexPath.section].sectionData[indexPath.row - 1]
      
      return cell
    }
    
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    if indexPath.row == 0 {
      
      if tableData[indexPath.section].cellOpened == true {
        tableData[indexPath.section].cellOpened = false
        
      }else {
        tableData[indexPath.section].cellOpened = true
        
      }
      
      let sections = IndexSet.init(integer: indexPath.section)
      
      tableView.reloadSections(sections, with: .none)

    }
  }
  
}

