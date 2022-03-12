import UIKit
import PhotosUI

class ViewController: UIViewController {
    @IBOutlet var profileView: UIView!
    @IBOutlet var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        profileView.layer.cornerRadius = 64
        profileView.layer.borderWidth = 1
        profileView.layer.borderColor = UIColor.black.cgColor
        profileView.clipsToBounds = true
    }
    
    @IBAction func onTouchButton(_ sender: UIButton) {
        presentPhotos()
    }
    
    func presentPhotos() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true, completion: nil)
    }
     
    //MARK: PHPickerViewController will be added
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        profileImageView.image = image
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

