//
//  AddMusicViewController.swift
//  MusicCollection
//
//  Created by Dias on 4/29/20.
//  Copyright © 2020 Dias. All rights reserved.
//

import UIKit

class AddMusicViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var onSelect: ((String) -> Void)? = nil
    
    @IBOutlet weak var textFiled: UITextField!
    
    @IBAction func pressedDone(_ sender: Any) {
        self.onSelect?(textFiled.text!)
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
