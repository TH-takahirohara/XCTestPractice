//
//  CounterViewController.swift
//  BddCounter
//
//  Created by 原昂大 on 2020/11/26.
//

import UIKit

class CounterViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var decrementButton: UIButton!
    @IBOutlet weak var incrementButton: UIButton!
    
    var count: Int = 0
    
    static func make() -> CounterViewController {
        let storyboard = UIStoryboard(name: "Counter", bundle: nil)
        return storyboard.instantiateInitialViewController() as! CounterViewController
    }
    
    @IBAction func tapIncrementButton(_ sender: Any) {
        count += 1
        updateView()
    }
    
    @IBAction func tapDecrementButton(_ sender: Any) {
        count -= 1
        updateView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    private func updateView() {
        countLabel.text = "\(count)"
        decrementButton.isEnabled = count > 0
    }
}
