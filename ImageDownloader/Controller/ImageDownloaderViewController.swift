//
//  ImageDownloaderViewController.swift
//  ImageDownloader
//
//  Created by Mac on 12/27/21.
//

import UIKit

class ImageDownloaderViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var imageCollectionView: UICollectionView! {
        didSet {
            self.imageCollectionView.registerNibWithNames("ImageDownloaderCollectionViewCell")
        }
    }
    @IBOutlet weak var ImageProgressView: UIProgressView! {
        didSet {
            self.ImageProgressView.progress = 0
        }
    }
    
    //MARK: - Variables
    let downloadManager = DownloadManager()
    let urlStrings = ["https://thumbs.dreamstime.com/z/sunrise-sunset-love-romance-birds-concept-flock-flying-heart-formation-behind-them-95869871.jpg","https://thumbs.dreamstime.com/z/sunrise-sunset-love-romance-birds-concept-flock-flying-heart-formation-behind-them-95869871.jpg","https://thumbs.dreamstime.com/z/sunrise-sunset-love-romance-birds-concept-flock-flying-heart-formation-behind-them-95869871.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateProgress(notification:)), name: .updateProgress, object: nil)
    }
    
    @objc func updateProgress(notification: Notification) {
        
        if let progress = notification.userInfo?["progress"] as? Double {
            DispatchQueue.main.async {
                self.ImageProgressView.progress = Float(progress)
            }
        }
    }
    
    //MARK: - Actions
    
    @IBAction func startDownloadPressed(_ sender: Any) {
        self.ImageProgressView.progress = 0
        let urls = urlStrings.compactMap { URL(string: $0) }
            
            let completion = BlockOperation {
                print("all done")
            }
            
            for url in urls {
                let operation = downloadManager.queueDownload(url)
                completion.addDependency(operation)
            }

            OperationQueue.main.addOperation(completion)
    }
}

