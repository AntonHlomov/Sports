//
//  ViewController.swift
//  Sports
//
//  Created by Anton Khlomov on 12/01/2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
   
    }
   

}
protocol InstatViewProtocol: AnyObject {
    func showMatchInfo(data: Match, date: String)
    func showLinks(linksTime1: MatchLinks, linksTime2: MatchLinks)
}

