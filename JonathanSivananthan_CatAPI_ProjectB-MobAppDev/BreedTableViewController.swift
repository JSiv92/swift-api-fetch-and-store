//
//  BreedTableViewController.swift
//  JonathanSivananthan_CatAPI_ProjectB-MobAppDev
//
//  Created by Jonathan Sivananthan on 20/11/22.
//
//  LAYOUT TESTED ON:
//  iphone 12
//
//  API: https://thecatapi.com/
//  KEY: live_lJYtcWGbh9CVhYNc9YnNNGoM9c5bukCNNzCAxG8AoEWnCh5zvVUuvRpawWVFtY9B
//

//selected cell cat
var selectedCat : CatBreed!

import UIKit
import CoreData

class BreedTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    //list for the table view
    var yourCats = [CatBreed]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return yourCats.count //how many cells to generate
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! BreedTableViewCell
        
        //set name label
        cell.nameLabel.text = yourCats[indexPath.row].name
        
        //parse pic from binary then set to pic view
        let picBinary = yourCats[indexPath.row].image
        if (picBinary != nil)
        {
            cell.picView.image = UIImage(data: picBinary!)
        }
        return cell
    }
    
    //show single cat detail using global cat variable
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCat = yourCats[indexPath.row]
    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let req = NSFetchRequest<NSManagedObject>(entityName: "CatBreed")  //the entity we want
        
        yourCats = try! context.fetch(req) as! [CatBreed] //entity data back into this list for us to use above
        
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
