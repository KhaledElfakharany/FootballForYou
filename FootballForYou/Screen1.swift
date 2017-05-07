//
//  ViewController.swift
//  FootballForYou
//
//  Created by Khaled Elfakharany on 5/2/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import UIKit
import Alamofire

class Screen1: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var competitions = [Competitions]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        ParseCSV()
        downloadCompetitionDetails {
            print("Completed")
        }
        
    }
    
    func downloadCompetitionDetails(completed: @escaping ()->()){
        for item in competitions {
            let path = "http://api.football-data.org/v1/competitions/\(item.id)"
            Alamofire.request(path).responseJSON{ response in
                let result = response.result
                if let dict = result.value as? Dictionary<String,AnyObject>{
                    if let matchDay = dict["currentMatchday"] as? Int {
                        item.matchDay = matchDay
                    }
                }
            }
            completed()
        }
    }
    
    func ParseCSV() {
        let path = Bundle.main.path(forResource: "Competitions", ofType: "csv")
        do {
            let csv = try CSV(contentsOfURL: path!)
            let rows = csv.rows
            
            for row in rows {
                
                let competitionID = row["id"]!
                let name = row["name"]!
                
                let competition = Competitions(name: name, id: Int(competitionID)!)
                self.competitions.append(competition)
            }
        }catch let error as NSError {
            print(error.debugDescription)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Screen1CollectionView", for: indexPath) as? Screen1CollectionView {
            let competition = competitions[indexPath.row]
            cell.updateUI(competition: competition)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return competitions.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let competition = competitions[indexPath.row]
        performSegue(withIdentifier: "segue1", sender: competition)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 140 , height: 140)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue1" {
            if let destination = segue.destination as? Screen2 {
                if let sent = sender as? Competitions {
                    destination.competitionId = sent.id
                    destination.matchDay = sent.matchDay
                }
            }
        }
    }
    
    
}

