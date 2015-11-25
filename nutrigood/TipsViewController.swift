//
//  TipsViewController.swift
//  nutrigood
//
//  Created by Andrew Fang on 11/20/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import UIKit

class TipsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var chats:[ChatItem] = []
    
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var firstChatOptions:UIView!
    @IBOutlet weak var mealChatOptions:UIView!
    
    private struct Constants {
        static let UserCell = "meCell"
        static let AICell = "youCell"
        static let AIFoodCell = "foodCell"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tips"
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100.0
        
        if let bkgd = UIImage(named: "chatBackground") {
            self.view.layer.contents = bkgd.CGImage
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if (self.chats.count == 0) {
            self.chats.append(ChatItem(content: "Hi, how can I help you?", type: .AI))
            self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: self.chats.count - 1, inSection: 0)], withRowAnimation: .Fade)
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.mealChatOptions.alpha = 0.0
    }
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell
        let chatItem = chats[indexPath.item]
        
        // Different chat type for different user
        if chatItem.type == ChatType.AIFood {
            cell = tableView.dequeueReusableCellWithIdentifier(Constants.AIFoodCell, forIndexPath: indexPath)
        } else if chatItem.type == ChatType.AI {
            cell = tableView.dequeueReusableCellWithIdentifier(Constants.AICell, forIndexPath: indexPath)
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier(Constants.UserCell, forIndexPath: indexPath)
        }
        
        // Set the text to be the chat item's content
        if let cell = cell as? ChatTableViewCell {
            cell.content.text = chatItem.content
        } else if let cell = cell as? ChatFoodTableViewCell {
            cell.foodItem = chatItem.foodItem!
        }
        
        cell.layoutIfNeeded()
        
        return cell
    }
    
    @IBAction func sayRandomTip(sender: UIButton) {
        guard let buttonText = sender.titleLabel?.text else {
            return
        }
        
        self.chats.append(ChatItem(content: buttonText, type: .User))
        self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: self.chats.count - 1, inSection: 0)], withRowAnimation: .Fade)
        
        let tip = Database.getRandomTip()
        self.chats.append(ChatItem(content: tip, type: .AI))
        self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: self.chats.count - 1, inSection: 0)], withRowAnimation: .Fade)

        self.tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: self.chats.count - 1, inSection: 0), atScrollPosition: .Bottom, animated: false)
    }
    
    @IBAction func suggestAMeal(sender: UIButton) {
        guard let buttonText = sender.titleLabel?.text else {
            return
        }
        self.chats.append(ChatItem(content: buttonText, type: .User))
        self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: self.chats.count - 1, inSection: 0)], withRowAnimation: .Fade)
        self.mealChatOptions.alpha = 1.0
        self.firstChatOptions.alpha = 0.0
    }
    
    @IBAction func suggestABreakfast(sender: UIButton) {
        guard let buttonText = sender.titleLabel?.text else {
            return
        }
        self.performMealSuggestion(Database.CollectionNames.Breakfast, buttonText: buttonText)
    }
    
    @IBAction func suggestALunch(sender: UIButton) {
        guard let buttonText = sender.titleLabel?.text else {
            return
        }
        self.performMealSuggestion(Database.CollectionNames.Lunch, buttonText: buttonText)
    }
    
    @IBAction func suggestADinner(sender: UIButton) {
        guard let buttonText = sender.titleLabel?.text else {
            return
        }
        self.performMealSuggestion(Database.CollectionNames.Dinner, buttonText: buttonText)
    }
    
    private func performMealSuggestion(meal:String, buttonText:String) {
        
        self.chats.append(ChatItem(content: buttonText, type: .User))
        self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: self.chats.count - 1, inSection: 0)], withRowAnimation: .Fade)

        let meal = Database.getRandomMeal(meal)
        if (meal != nil) {
            self.chats.append(ChatItem(content: "May I suggest for \(buttonText.lowercaseString) that you have...", type: .AI))
            self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: self.chats.count - 1, inSection: 0)], withRowAnimation: .Fade)
            self.chats.append(ChatItem(content: meal!))
            self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: self.chats.count - 1, inSection: 0)], withRowAnimation: .Fade)
        }
        
        self.tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: self.chats.count - 1, inSection: 0), atScrollPosition: .Bottom, animated: false)
        self.mealChatOptions.alpha = 0.0
        self.firstChatOptions.alpha = 1.0
    }
}
