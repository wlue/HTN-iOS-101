//
//  IngredientsViewController.swift
//  HTN iOS
//
//  Created by Wen-Hao Lue on 2015-09-19.
//  Copyright © 2015 Wen-Hao Lue. All rights reserved.
//

import UIKit

class IngredientsViewController: UITableViewController {
    class Item {
        let name: String
        var quantity: Int?

        init(name: String, quantity: Int?) {
            self.name = name
            self.quantity = quantity
        }
    }

    var items: [Item] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Grocery List"
        let button = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addPressed")
        self.navigationItem.rightBarButtonItem = button
    }

    func addPressed() {
        print("pressed")

        self.items.append(Item(name: "Carrot", quantity: nil))
        self.tableView.reloadData()
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("MyCell")

        if cell == nil {
            cell = UITableViewCell(style: .Value1, reuseIdentifier: "MyCell")
        }

        let item = self.items[indexPath.row]
        cell.textLabel?.text = item.name
        if let quantity = item.quantity {
            cell.detailTextLabel?.text = "\(quantity) items"
        } else {
            cell.detailTextLabel?.text = "Nothing"
        }

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        let item = self.items[indexPath.row]
        if let quantity = item.quantity {
            item.quantity = quantity + 1
        } else {
            item.quantity = 0
        }

        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
}
