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
    
    static func make() -> CounterViewController {
        let storyboard = UIStoryboard(name: "Counter", bundle: nil)
        return storyboard.instantiateInitialViewController() as! CounterViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
