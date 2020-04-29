//
//  ViewController.swift
//  MusicCollection
//
//  Created by Dias on 4/28/20.
//  Copyright © 2020 Dias. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
 
    
    var tracks: [Track] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Music", style: .plain, target: self, action: #selector(presentAddMusicView))
       
    }
    
    @objc func presentAddMusicView(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let selectVC = storyboard.instantiateViewController(identifier: "AddMusicViewController") as? AddMusicViewController
        else { return }
        navigationController?.pushViewController(selectVC, animated: true)
        selectVC.onSelect = {
            [weak self] track in
            self?.tracks.append(track)
        }
    }
}
    

extension ViewController: TrackCollectionViewCellDelegate {
    
    func didPressPlay(track: Track) {
        MusicService.shared.play(track: track)
    }
    
    func didPressDownload(track: Track, completion: @escaping (Track) -> ()) {
        MusicService.shared.download(track: track) { url, error in
            if url != nil {
                completion(track)
            } else if let error = error {
                print(error)
            }
        }
        tracks.append(track)
        self.collectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.tracks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "track", for: indexPath) as! TrackCollectionViewCell
        cell.track = self.tracks[indexPath.row]
        cell.delegate = self
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 180, height: 160)
    }
}



