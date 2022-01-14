//
//  Player.swift
//  Sports
//
//  Created by Anton Khlomov on 13/01/2022.
//

import UIKit
import AVKit
class Player: UIViewController {
    
    var urlVideo = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        openPlayer()
    }
    func openPlayer() {
        guard  let url = URL(string: urlVideo) else { return }
        let player = AVPlayer(url: url)
                let controller = AVPlayerViewController()
        present(controller, animated: true) {  }
                controller.player = player
        addChild(controller)
                view.addSubview(controller.view)
                controller.view.frame = CGRect(x: 50, y: 50, width: 300, height: 300)
                controller.player = player
                controller.showsPlaybackControls = true
                player.play()
    }

}
