//
//  TrackCollectionViewCell.swift
//  MusicCollection
//
//  Created by Dias on 4/28/20.
//  Copyright © 2020 Dias. All rights reserved.
//

import UIKit

protocol TrackCollectionViewCellDelegate: class {
    func didPressPlay(track: Track)
    func didPressDownload(track: Track, completion: @escaping (Track) -> ())
}

class TrackCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var downloadButton: UIButton!
    
    var track: Track! {
        didSet {
            self.nameLabel.text = track.trackName
            
            let isDownloaded = MusicService.shared.isDownloaded(track: self.track)
            
            downloadButton.isUserInteractionEnabled = !isDownloaded
            downloadButton.isHidden = isDownloaded
        }
    }
    weak var delegate: TrackCollectionViewCellDelegate?
    
    
    @IBAction func play(_ sender: UIButton) {
        delegate?.didPressPlay(track: track)
    }

    @IBAction func download(_ sender: UIButton) {
        delegate?.didPressDownload(track: track) { track in
            self.track = track
        }
    }
    
}
