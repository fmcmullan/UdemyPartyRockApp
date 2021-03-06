//
//  VideoViewController.swift
//  UdemyPartyRockApp
//
//  Created by Frank on 9/11/16.
//  Copyright © 2016 McMullan Computer Services. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var titleLabel: UILabel!
    
    private var _partyRock: PartyRockModel!
    
    var partyRock: PartyRockModel {
        get {
            return _partyRock
        } set {
            _partyRock = newValue
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = partyRock.videoTitle
        webView.loadHTMLString(partyRock.videoURL, baseURL: nil)
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
