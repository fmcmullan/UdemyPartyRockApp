//
//  MainViewController.swift
//  UdemyPartyRockApp
//
//  Created by Frank on 9/11/16.
//  Copyright © 2016 McMullan Computer Services. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var partyRockCells = [PartyRockModel]()
    
    @IBOutlet weak var partyRockTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRockModel(imageURL: "http://ultimateclassicrock.com/files/2012/04/rush-moving-pix.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/auLBLk4ibAk\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Tom Sawyer")
        partyRockCells.append(p1)
        
        let p2 = PartyRockModel(imageURL: "https://i.ytimg.com/vi/UWHEcIbhDiw/hqdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/UWHEcIbhDiw\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "The Trees")
        partyRockCells.append(p2)
        
        let p3 = PartyRockModel(imageURL: "http://www.2112.net/powerwindows/tours/15071139jacobs.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/dzcA8_EkYQ0\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Jacob's Ladder")
        partyRockCells.append(p3)
        
        let p4 = PartyRockModel(imageURL: "https://i.ytimg.com/vi/qbSltmTaK6Y/hqdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/WbsC_fGArVc\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Leave That Thing Alone")
        partyRockCells.append(p4)
        
        let p5 = PartyRockModel(imageURL: "http://www.kempa.com/images/blog/20040315_yyz.gif", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/1eSlvoO3Vw8\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "YYZ")
        partyRockCells.append(p5)
        
        
        partyRockTableView.delegate = self
        partyRockTableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = partyRockTableView.dequeueReusableCell(withIdentifier: "PartyRockTableCell", for: indexPath) as? PartyTableViewCell {
            
            let partyRock = partyRockCells[indexPath.row]
            cell.updateUI(partyRock: partyRock)
            return cell
        } else {
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return partyRockCells.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRockCells[indexPath.row]
        performSegue(withIdentifier: "VideoViewController", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoViewController {
            if let party = sender as? PartyRockModel {
                destination.partyRock = party
            }
        }
    }
}

