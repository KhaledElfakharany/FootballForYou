//
//  Screen2.swift
//  FootballForYou
//
//  Created by Khaled Elfakharany on 5/2/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import UIKit
import Alamofire

class Screen2: UIViewController,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    
    var competitionId : Int!
    var teams = [Teams]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        downloadTeams {
            self.collectionView.reloadData()
            print("7amada")
        }
    }
    
    func downloadTeams(completed: @escaping ()->() ){
        let path = "http://api.football-data.org/v1/competitions/\(competitionId!)/teams"
        Alamofire.request(path).responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary<String,AnyObject> {
                if let teams = dict["teams"] as? [Dictionary<String,AnyObject>] {
                    for team in teams {
                        if let name = team["name"] as? String {
                            if let url = team["crestUrl"] as? String {
                                if let link = team["_links"] as? Dictionary<String,AnyObject>{
                                    if let fixtures = link["fixtures"] as? Dictionary<String,AnyObject>{
                                        if let href1 = fixtures["href"] as? String{
                                            if let players = link["players"] as? Dictionary<String,AnyObject>{
                                                if let href2 = players["href"] as? String{
                                                    let team = Teams(name: name, URL: url, playersURL : href2, fixturesURL : href1)
                                                    self.teams.append(team)
                                                }
                                            }
                                        }
                                    }
                                    
                                }
                            }
                        }
                    }
                }
                completed()
            }
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teams.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Screen2CollectionView" , for: indexPath) as? Screen2CollectionView {
            let team = teams[indexPath.row]
            cell.updateUI(team : team)
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 125)
    }
    
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}


