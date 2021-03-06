//
//  MainTabBarViewController.swift
//  edadil
//
//  Created by MAXIM KOLESNIK on 27.10.2017.
//  Copyright © 2017 Maxim Kolesnik. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchViewController = SearchViewController()
        searchViewController.title = "Поиск"
        let listViewController = ListViewController()
        listViewController.title = "Список покупок"

        let navigationSearch = UINavigationController(rootViewController: searchViewController)
        let navigationList = UINavigationController(rootViewController: listViewController)
        
        self.viewControllers = [navigationSearch, navigationList]

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
