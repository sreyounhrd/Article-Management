//
//  UpdateTableViewController.swift
//  UploadImageSreyoun
//
//  Created by sreyoun on 12/18/16.
//  Copyright © 2016 KSHRD. All rights reserved.
//

import Foundation
import Kingfisher
class UpdateTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtDescription: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    // Variable form storing the article to update
    var artId : Int?
    var artTitle : String?
    var artDescribtion:String?
    var imageUrl : String?
    
    // Create UpdatePresenter object
    var updatePresenter:UpdatePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set article to form
        txtTitle.text = artTitle
        txtDescription.text = artDescribtion
        if let imgUrl = imageUrl, let url = URL(string : imgUrl){
            imgView.kf.setImage(with: url)
        }else{
            imgView.image = #imageLiteral(resourceName: "unnamed")
        }
        
        
        updatePresenter = UpdatePresenter()
        // Set Delegate
        updatePresenter?.updateTableViewControllerInterface = self
    }
    
 
    @IBAction func browseImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    
    @IBAction func updateArticle(_ sender: Any) {
        let image = imgView.image
        updatePresenter?.uploadImage(image: image!)

    }
    // After Image Picked
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // Get PickedImage
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            // Set Image to ImageView
            imgView.image = pickedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
        
    }
}

extension UpdateTableViewController : UpdateTableViewControllerInterface{
    func uploadImageSuccessWith(url: String) {
        // Start Posting Article to update
        updatePresenter?.updateArticle(id: artId!, title: txtTitle.text!, description: txtDescription.text!, imageUrl: url)
    }
    
    func updateComplete(message: String) {
        _ = navigationController?.popViewController(animated: true)
    }
}
