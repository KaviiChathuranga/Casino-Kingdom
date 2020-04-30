//
//  AboutViewController.swift
//  Casino Kingdom
//
//  Created by Treinetic Macbook004 on 8/27/19.
//  Copyright © 2019 Treinetic Macbook004. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var apkVersionLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        apkVersionLbl.text = "App Version : "+"\(appVersion!)"
    }
    
    @IBAction func backActiob(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
