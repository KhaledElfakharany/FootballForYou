//
//  teamScreen.swift
//  FootballForYou
//
//  Created by Khaled Elfakharany on 5/8/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import UIKit
import Alamofire

class teamScreen: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    var playersLink : String!
    var teamName: String!
    var players = [Players]()
    
    @IBOutlet weak var playersCollectionView: UICollectionView!
    @IBOutlet weak var teamNameLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        playersCollectionView.delegate = self
        playersCollectionView.dataSource = self
        teamNameLbl.text = teamName
        downloadPlayersData {
            self.playersCollectionView.reloadData()
        }
        
    }
    
    func downloadPlayersData(completed : @escaping ()->()) {
        Alamofire.request(playersLink).responseJSON{ response in
            let result = response.result
            if let dict = result.value as? Dictionary<String,AnyObject>{
                if let players = dict["players"] as? [Dictionary<String,AnyObject>]{
                    for item in players {
                        let player = Players(dict: item)
                        self.players.append(player)
                    }
                }
            }
            completed()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 135)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return players.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = playersCollectionView.dequeueReusableCell(withReuseIdentifier: "PlayersCollectionViewCell", for: indexPath) as? PlayersCollectionViewCell {
            let player = players[indexPath.row]
            cell.configureCell(player: player)
            return cell 
        }
        return UICollectionViewCell()
    }


    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
