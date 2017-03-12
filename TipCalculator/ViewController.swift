//
//  ViewController.swift
//  TipCalculator
//
//  Created by Weijie Chen on 2/28/17.
//  Copyright © 2017 Weijie Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var resultView: UIView!
    
    func updateViewWithAnimation(animated:Bool) {
        let billamount = Double(billField.text!)
        if(billamount == 0 || billamount == nil){
            showInputOnlyWithAnimation(animated:animated)
        }
        else{
            showResultViewWithAnimation(animated:animated)
        }
    }
    
    func showResultViewWithAnimation(animated:Bool) {
        if(animated){
            UIView.animate(withDuration: 0.5, animations: {
                self.showResultView()
            }, completion: nil
            )
        }else{
        self.showResultView()
        }
    }
    
    func showInputOnlyWithAnimation(animated:Bool){
        if(animated){
            UIView.animate(withDuration: 0.5, animations: {
                self.showInputView()
            }, completion: nil)
        }else{
            self.showInputView()
        }
    }
    
    func showInputView(){
        var resultFrame = resultView.frame
        
        resultFrame.origin.y = 454
        resultView.frame = resultFrame
        
        var billamountframe = billField.frame
        billamountframe.origin.y = 186
        billField.frame = billamountframe
    }
    
    func showResultView() {
        var resultFrame = resultView.frame
        
        resultFrame.origin.y = 190
        resultView.frame = resultFrame
        
        var billamountframe = billField.frame
        billamountframe.origin.y = 70
        billField.frame = billamountframe
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()
        print("I can't wait to pusht this project to github!")

        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(self, selector: #selector(onApplicationWillResignActive), name: Notification.Name.UIApplicationWillResignActive, object: nil)
        notificationCenter.addObserver(self, selector: #selector(onApplicationDidBecomeActive), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaulttipindex = UserDefaults.standard.integer(forKey: "default_tip_segment_index")
        
        tipControl.selectedSegmentIndex = defaulttipindex
        
        updateValues()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func calculateTip(_ sender: AnyObject) {

        updateValues()
        
        updateViewWithAnimation(animated: true)
        ///formatBill(bill:bill)
    }
    func updateValues(){
        let tipPercentages = [0.18,0.2,0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = tip + bill
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    func formatBill(bill:Double){
        billField.text = String(format: "$%.2f", bill)
    }
    
    
    func onApplicationWillResignActive(){
        let defaults = UserDefaults.standard
        defaults.set(billField.text, forKey: "last_bill_amount")
        defaults.set(Date(), forKey: "last_bill_datetime")
        defaults.set(tipControl.selectedSegmentIndex, forKey: "last_tip_segment_index")
            }
    
    func onApplicationDidBecomeActive(){
        let defaults = UserDefaults.standard
        let lastdate = defaults.object(forKey: "last_bill_datetime") as? Date
        let lastbillamount = defaults.string(forKey: "last_bill_amount")
        let lasttipsegmentindex = defaults.integer(forKey: "last_tip_segment_index")
        
        let now = Date()
        
        let timeinterval = now.timeIntervalSince(lastdate!)
        
        if(timeinterval < 600){
            self.billField.text = lastbillamount
            self.tipControl.selectedSegmentIndex = lasttipsegmentindex
        }else{
            self.billField.text = ""
        }
        
        updateValues()
    }
}

