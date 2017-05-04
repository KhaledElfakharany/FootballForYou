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
    
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    @IBOutlet weak var segments: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        teamsCollectionView.delegate = self
        teamsCollectionView.dataSource = self
        
        downloadTeams {
            self.teamsCollectionView.reloadData()
            print("7amada")
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        teamsCollectionView.isHidden = true
    }
    
    
    
    func downloadTeams(completed: @escaping ()->() ){
        let path = "http://api.football-data.org/v1/competitions/\(competitionId!)/teams"
        Alamofire.request(path).responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary<String,AnyObject> {
                if let teams = dict["teams"] as? [Dictionary<String,AnyObject>] {
                    for team in teams {
                        let team = Teams(team: team)
                        self.teams.append(team)
                        print(team.name)
                    }
                }
            }
            completed()
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
    
    @IBAction func segmentChange(_ sender: Any) {
        if segments.selectedSegmentIndex == 0 {
            teamsCollectionView.isHidden = true
        }else if segments.selectedSegmentIndex == 1{
            teamsCollectionView.isHidden = true
        }else if segments.selectedSegmentIndex == 2{
            teamsCollectionView.isHidden = false
        }
        else{
        }
    }
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}


