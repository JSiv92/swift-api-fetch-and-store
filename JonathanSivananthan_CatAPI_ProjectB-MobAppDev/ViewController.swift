//
//  ViewController.swift
//  JonathanSivananthan_CatAPI_ProjectB-MobAppDev
//
//  Created by Jonathan Sivananthan on 19/11/22.
//
//  LAYOUT TESTED ON:
//  iphone 12
//
//  API: https://thecatapi.com/
//  KEY: live_lJYtcWGbh9CVhYNc9YnNNGoM9c5bukCNNzCAxG8AoEWnCh5zvVUuvRpawWVFtY9B
//

import UIKit
import CoreData

//GLOBAL alert message
func showMessage(msg:String, title:String, controller: UIViewController)
{
    let alert = UIAlertController(title:title, message:msg, preferredStyle: .alert)
    let action = UIAlertAction(title:"OK", style:.default, handler: nil)
    alert.addAction(action)
    ///call the alert:
    controller.present(alert, animated: true, completion: nil)
}


class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var originLabel: UILabel!

    @IBOutlet weak var descTextView: UITextView!
    
    @IBOutlet weak var picView: UIImageView!
    var name:String!
    var desc:String!
    var origin:String!
    
    
    
    
    
    
    
    //GET RANDOM CAT BREED WITH INFO
    private func fetchData()
    {

        let address = "https://api.thecatapi.com/v1/breeds"
        //var address = "https://api.thecatapi.com/v1/search?limit=10"
        
        let thisUrl = URL(string: address)
        
        let req = URLRequest(url: thisUrl!)
        
        let task = URLSession.shared.dataTask(with: req)
        {
            (data, response, error)
            in
            if(error == nil)
            {
                
                //all the breeds as json array
                let jsonDict = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! NSArray
                
                //print(jsonDict.count) //67 cat breeds total
                let randomNum = (Int)(arc4random_uniform((UInt32)(jsonDict.count)))
                
                let oneBreed = jsonDict[randomNum] as! [String:Any] //array of dicts
                
                var imageInfo:[String:Any]!
                if (oneBreed["image"]) != nil
                {
                    imageInfo = oneBreed["image"] as? [String:Any] //hitting image tag inside breed to get url
                }
                
                //getting the Cat Breed data we want
                self.name = oneBreed["name"] as? String
                self.desc = oneBreed["description"] as? String
                self.origin = oneBreed["origin"] as? String

                let breedImgUrlString = imageInfo["url"] as? String
                
                let breedUrl = URL(string: breedImgUrlString!) //changing cat url string to URL type
                
                let picdata = try! Data(contentsOf: breedUrl!)
                let image = UIImage(data: picdata)
                
                //testing breed search
                //let searched =
                
                
                
                //main func
                DispatchQueue.main.async
                {
                    //set fetched data to front end
                    self.picView.image = image
                    self.nameLabel.text = self.name
                    self.originLabel.text = self.origin
                    self.descTextView.text = self.desc
                                        
                    ///TESTING  :
                    //print(oneBreed)
                    //print(imageInfo)
                    //print("\n/// Name: " + name + "\n/// Description: " + desc + "\n/// Origin: " + origin + "\n/// URL: " + breedImgUrlString)
                }
            }
            else
            {
                showMessage(msg: "Task Failed", title: "Error", controller: self)
            }
        }
        task.resume()
    }
    
    
    
    
    
    //SAVE CAT TO COREDATA
    @IBAction func saveBtn(_ sender: UIButton)
    {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = delegate.persistentContainer.viewContext
        
        let catCoreData = NSEntityDescription.insertNewObject(forEntityName: "CatBreed", into: context) as! CatBreed
        
        if(nameLabel.text != "Name") //only allow add if cat data is actually fetched first
        {
            catCoreData.name = name
            catCoreData.origin = origin
            catCoreData.desc = desc
            catCoreData.image = picView.image?.pngData()
            
            do
            {
                try context.save()
                showMessage(msg: "successfully added cat to favourites", title: "Success", controller: self)
                
            }
            catch
            {
                showMessage(msg: "Failed to add cat to favourites", title: "Error", controller: self)
            }
        }
        else
        {
            showMessage(msg: "Choose a Cat First!", title: "Wait", controller: self)
        }
    }
    


    
    
    //GET NEXT CAT BUTTON : Use this to keep fetching a random catbreed and save favourite ones:
    //i struggled to figure out how to use my API's search function and had to do it this way in order to get some results to save and view
    
    @IBAction func getBtn(_ sender: UIButton)
    {
        fetchData()
    }
    
    
    
    
    

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

