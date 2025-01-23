//
//  ViewController.swift
//  Act10-ApplLifeCycle
//
//  Created by Mariana Almaguer Gonzalez on 20/04/24.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var didFinishLaunching: UILabel!
    
    @IBOutlet weak var configurationForConnecting: UILabel!
    
    @IBOutlet weak var willConnectTo: UILabel!
    
    @IBOutlet weak var sceneDidBecomeActive: UILabel!
    
    @IBOutlet weak var sceneWillResignActive: UILabel!
    
    @IBOutlet weak var sceneWillEnterForeground: UILabel!
    
    @IBOutlet weak var sceneDidEnterBackground: UILabel!
    
    
    var sceneDidEnterBackgroundCount = 0
    var sceneWillEnterForegroundCount = 0
    var sceneWillResignActiveCount = 0
    var sceneDidBecomeActiveCount = 0
    var willConnectToCount = 0
    
    var appDelegate = (UIApplication.shared.delegate as!
                       AppDelegate)
    
    func updateView() {
        didFinishLaunching.text = "The app has launched \(appDelegate.launchCount) time(s)"
        
        configurationForConnecting.text = "The apps has connect \(appDelegate.configurationForConnectingCount) time(s)"
        
        willConnectTo.text = "The scene will connect \(willConnectToCount) time(s)"
        
        sceneDidBecomeActive.text = "The scene did become active \(sceneDidBecomeActiveCount) time(s)"
        
        sceneWillResignActive.text = "The scene will resign active  \(sceneWillResignActiveCount) time(s)"
        
        sceneWillEnterForeground.text = "The scene will enter foreground  \(sceneWillEnterForegroundCount) time(s)"
        
        sceneDidEnterBackground.text = "The scene did enter background \(sceneDidEnterBackgroundCount) time(s)"

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

