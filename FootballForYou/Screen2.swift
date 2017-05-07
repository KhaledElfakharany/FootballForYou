//
//  Screen2.swift
//  FootballForYou
//
//  Created by Khaled Elfakharany on 5/2/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import UIKit
import Alamofire

class Screen2: UIViewController,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource{
    
    var competitionId : Int!
    var matchDay: Int!
    var teams = [Teams]()
    var tableTeams = [Teams]()
    var fixtureTeams = [Fixtures]()
    var fixtureTeamsSorted = [Fixtures]()
    
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    @IBOutlet weak var teamsView: UIView!
    @IBOutlet weak var tableView: UIView!
    @IBOutlet weak var fixtureView: UIView!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var fixtures: UITableView!
    @IBOutlet weak var segments: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        teamsCollectionView.delegate = self
        teamsCollectionView.dataSource = self
        table.dataSource = self
        table.delegate = self
        fixtures.dataSource = self
        fixtures.delegate = self
        print(matchDay)


        downloadTableData {
            self.table.reloadData()
            //            print("Array count = \(self.tableTeams.count)")
            self.downloadFixturesData {
                self.fixtures.reloadData()
                //            print(self.fixtureTeams[379].homeTeamName)
                self.downloadTeams {
                    self.teamsCollectionView.reloadData()
                    for x in 0...(self.tableTeams.count-1)*2{
                    for item in self.fixtureTeams {
                        if item.matchDay == x {
                            self.fixtureTeamsSorted.append(item)
                        }
                    }
                    }
                }
            }
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.teamsView.isHidden = true
        self.fixtureView.isHidden = true
    }
    
    func downloadFixturesData(completed: @escaping ()->()){
        let path = "http://api.football-data.org/v1/competitions/\(competitionId!)/fixtures"
        Alamofire.request(path).responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject>{
                if let fixture = dict["fixtures"] as? [Dictionary<String,AnyObject>]{
                    for item in fixture {
                        let match = Fixtures(tableInfo: item)
                        self.fixtureTeams.append(match)
                    }
                }
            }
            
            completed()
        }
    }
    
    func downloadTableData(completed: @escaping ()->()){
        let path = "http://api.football-data.org/v1/competitions/\(competitionId!)/leagueTable"
        Alamofire.request(path).responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary<String,AnyObject> {
                if let standings = dict["standing"] as? [Dictionary<String,AnyObject>]{
                    for item in standings {
                        let team = Teams(tableInfo: item)
                        self.tableTeams.append(team)
                    }
                }
            }
            completed()
        }
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
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == table {
            return 1
        }
        return ((teams.count-1)*2)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == table{
        return self.tableTeams.count
        }
        else {
            return self.tableTeams.count/2
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == table {
            if let cell = table.dequeueReusableCell(withIdentifier: "Screen2TableViewCell", for: indexPath) as? Screen2TableViewCell{
                cell.configureCell(team: tableTeams[indexPath.row])
                return cell
            }
        }
        else if tableView == fixtures {
            if let cell = fixtures.dequeueReusableCell(withIdentifier: "FixturesTableViewCell", for: indexPath) as? FixturesTableViewCell{
                let index = indexPath.row + indexPath.section*(tableTeams.count/2)
                cell.configureCell(fixture: fixtureTeamsSorted[index])
                return cell
            }
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView != table{
            return "Section \(section+1)"
        }
        return ""
    }
    
    @IBAction func segmentChange(_ sender: Any) {
        if segments.selectedSegmentIndex == 0 {
            self.tableView.isHidden = false
            self.teamsView.isHidden = true
            self.fixtureView.isHidden = true
            self.table.reloadData()
            
            
        }else if segments.selectedSegmentIndex == 1{
            self.teamsView.isHidden = true
            self.tableView.isHidden = true
            self.fixtureView.isHidden = false
            self.fixtures.reloadData()
            let indexPath = NSIndexPath(row: 0, section: matchDay-1)
            self.fixtures.scrollToRow(at: indexPath as IndexPath, at: .top, animated: true)
        }else if segments.selectedSegmentIndex == 2{
            self.tableView.isHidden = true
            self.teamsView.isHidden = false
            self.fixtureView.isHidden = true
            self.teamsCollectionView.reloadData()
        }
        else{
        }
    }
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}


