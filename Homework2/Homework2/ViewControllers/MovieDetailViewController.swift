//
//  MovieDetailViewController.swift
//  Homework2
//
//  Created by Tolga on 18.09.2022.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var movieDescriptionLabel: UILabel!
    @IBOutlet weak var watchTrailerButton: UIButton!
    
    var movieDetail: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationBar(largeTitleColor: .white, backgoundColor: .systemRed, tintColor: .white, title: movieDetail!.title, preferredLargeTitle: false)
        configureUI()
        
        movieDescriptionLabel.text = movieDetail?.description
    }
    
    /*
     Function to configureUI
     */
    private func configureUI() {
        watchTrailerButton.layer.cornerRadius = 8
    }

    @IBAction func didWatchTrailerTapped(_ sender: Any) {
        let st = UIStoryboard(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: Constants.webViewController) as! WebViewController
        vc.movieTrailerLink = self.movieDetail?.trailer
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
