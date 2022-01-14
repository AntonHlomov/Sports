//
//  ViewController.swift
//  Sports
//
//  Created by Anton Khlomov on 12/01/2022.
//
import Foundation
import UIKit

protocol InstatViewProtocol: AnyObject {
    func showMatchInfo(data: Match, date: String)
    func showLinks(linksTime1: MatchLinks, linksTime2: MatchLinks)
}
class ViewController: UIViewController {
    private lazy var presenter = InstatPresenter(with: self)
    
    private var videoLinksFirstTime = [MatchLink]()
    private var videoLinksSecondTime = [MatchLink]()
   
    var tournamentLabel = UILabel.setupLabel(title: "", alignment: .center, color: .darkGray, alpha: 1, size: 16, numberLines: 1)

    var teamLeftLabel = UILabel.setupLabel(title: "", alignment: .left, color: .darkGray, alpha: 1, size: 16, numberLines: 1)
    var teamRightLabel = UILabel.setupLabel(title: "", alignment: .right, color: .darkGray, alpha: 1, size: 16, numberLines: 1)
    var scoreLeftLabel = UILabel.setupLabel(title: "", alignment: .left, color: .darkGray, alpha: 1, size: 16, numberLines: 1)
    var scoreRightLabel = UILabel.setupLabel(title: "", alignment: .right, color: .darkGray, alpha: 1, size: 16, numberLines: 1)
    var dateLabel = UILabel.setupLabel(title: "", alignment: .center, color: .darkGray, alpha: 1, size: 16, numberLines: 1)
     var colonLabel = UILabel.setupLabel(title: "", alignment: .center, color: .darkGray, alpha: 1, size: 16, numberLines: 1)
    var lookMatchLabel = UILabel.setupLabel(title: "", alignment: .center, color: .darkGray, alpha: 1, size: 16, numberLines: 1)
    var firstTimeLabel = UILabel.setupLabel(title: "", alignment: .center, color: .darkGray, alpha: 1, size: 16, numberLines: 1)
    var secondTimeLabel = UILabel.setupLabel(title: "", alignment: .center, color: .darkGray, alpha: 1, size: 16, numberLines: 1)
    
    lazy var stackLabel = UIStackView(arrangedSubviews: [tournamentLabel,teamLeftLabel,teamRightLabel,scoreLeftLabel,scoreRightLabel,dateLabel,colonLabel,lookMatchLabel,firstTimeLabel,secondTimeLabel])
   
    lazy var firstTimeStack = UIStackView()
    lazy var secondTimeStack = UIStackView()
    lazy var stackAllTimeStack = UIStackView(arrangedSubviews: [firstTimeStack,secondTimeStack])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
  
        presenter.loadInfo()
        presenter.loadLinks()
        configureViewComponents()
       
 
    }
    fileprivate func configureViewComponents(){

        stackLabel.axis = .vertical
        stackLabel.spacing = 7
        stackLabel.distribution = .fillEqually
        view.addSubview(stackLabel)
        stackLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, pading: .init(top: 30, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: view.frame.height/2))

        stackAllTimeStack.axis = .horizontal
        stackAllTimeStack.spacing = 30
        stackAllTimeStack.distribution = .fillEqually  // для корректного отображения
        view.addSubview(stackAllTimeStack)
        stackAllTimeStack.anchor(top: stackLabel.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, pading: .init(top: 20, left: 20, bottom: 0, right: 20), size: .init(width: view.frame.width - 70, height: view.frame.height/2))
    }
    
    func createButtonsForVideos(videosFirstTime: MatchLinks, videosSecondTime: MatchLinks) {
        
        for index in videosFirstTime.indices {
            lazy var button = UIButton()
            button.tag = index
            button.setTitle(videosFirstTime[index].quality, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.setTitleColor(.white, for: .highlighted)
            button.backgroundColor = .gray
            button.addTarget(self, action: #selector(buttonTime1Pressed), for: .touchUpInside)
            firstTimeStack.addArrangedSubview(button)
            
        }
        
        for index in videosSecondTime.indices {
            lazy var button = UIButton()
            button.tag = index
            button.setTitle(videosSecondTime[index].quality, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.setTitleColor(.white, for: .highlighted)
            button.backgroundColor = .gray
            button.addTarget(self, action: #selector(buttonTime2Pressed), for: .touchUpInside)
            secondTimeStack.addArrangedSubview(button)
    
        }
        configureViewComponents()
    }
    
    @objc func buttonTime1Pressed(sender: UIButton) {
        let urlVideo = videoLinksFirstTime[sender.tag].url
        showPlayer(with: urlVideo)
    }
    
    @objc func buttonTime2Pressed(sender: UIButton) {
        let urlVideo = videoLinksSecondTime[sender.tag].url
        showPlayer(with: urlVideo)
    }
    
    func showPlayer(with urlVideo: String) {
        printContent("showPlayer")
        let vc = Player()
        vc.urlVideo = urlVideo
        let navControler = UINavigationController(rootViewController: vc)
        navControler.modalPresentationStyle = .popover //окно появиться на весь экран
        self.present(navControler, animated: true, completion: nil)
  
    }
}

extension ViewController: InstatViewProtocol {
    func showLinks(linksTime1: MatchLinks, linksTime2: MatchLinks) {
        self.videoLinksFirstTime = linksTime1
        self.videoLinksSecondTime = linksTime2
        createButtonsForVideos(videosFirstTime: linksTime1, videosSecondTime: linksTime2)
    }
    
    func showMatchInfo(data: Match,date: String) {
        colonLabel.text = ":"
        lookMatchLabel.text = "Смотреть матч"
        firstTimeLabel.text = "1 тайм"
        secondTimeLabel.text = "2 тайм"
        tournamentLabel.text = "\(data.tournament.nameRus)"
        dateLabel.text = "\(date)"
        teamLeftLabel.text = "\(data.team1.nameRus)"
        teamRightLabel.text = "\(data.team2.nameRus)"
        scoreLeftLabel.text = "\(data.team1.score ?? 0)"
        scoreRightLabel.text = "\(data.team2.score ?? 0)"
    }
}

