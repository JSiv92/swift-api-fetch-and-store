//
//  ShowCatDetailViewController.swift
//  JonathanSivananthan_CatAPI_ProjectB-MobAppDev
//
//  Created by Jonathan Sivananthan on 22/11/22.
//
//  LAYOUT TESTED ON:
//  iphone 12
//
//  API: https://thecatapi.com/
//  KEY: live_lJYtcWGbh9CVhYNc9YnNNGoM9c5bukCNNzCAxG8AoEWnCh5zvVUuvRpawWVFtY9B
//

import UIKit

class ShowCatDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var originLabel: UILabel!
    
    @IBOutlet weak var picView: UIImageView!
    
    @IBOutlet weak var descBox: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    
    //same as in productsuserdefaults class demo but using the core data code from table controller
    //have to still convert pic of type binary data to ui image type
    
    override func viewWillAppear(_ animated: Bool) {
        print("View will appear")
        
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        nameLabel.text! = "Name: " + selectedCat.name!
        originLabel.text! = "Origin:  " + selectedCat.origin!
        descBox.text = selectedCat.desc
        
        let catBinaryPic = selectedCat.image
        if (catBinaryPic != nil)
        {
            picView.image = UIImage(data: catBinaryPic!)
        }
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
