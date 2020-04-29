//
//  AddMusicViewController.swift
//  MusicCollection
//
//  Created by Dias on 4/29/20.
//  Copyright © 2020 Dias. All rights reserved.
//
import UIKit

class AddMusicViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    var tracks: [Track] = []
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func pressed(_ sender: Any) {
        MusicService.shared.searchForMusic (songName: textField.text!, completion: { [weak self] result, error in
            guard let self = self else { return }

            if let tracks = result?.tracks {
                self.tracks = tracks
                self.collectionView.reloadData()
            } else if let error = error {
                print(error)
            }
        })
//        print(tracks)
//        print(textField.text!)
//        collectionView.reloadData()
    }
    @IBOutlet weak var done: UIButton!
    
    var onSelect: ((Track) -> Void)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
    
extension AddMusicViewController: TrackCollectionViewCellDelegate {
    
    func didPressPlay(track: Track) {
        MusicService.shared.play(track: track)
    }
    
    func didPressDownload(track: Track, completion: @escaping (Track) -> ()) {
        print("download");
        MusicService.shared.download(track: track) { url, error in
            if url != nil {
                completion(track)
            } else if let error = error {
                print(error)
            }
        }
        //self.onSelect?(track)
    }
}

extension AddMusicViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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

    
    


