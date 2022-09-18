import UIKit

class MovieViewController: UIViewController {
    
    //MARK: - Properties

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let movies: [Movie] = [
        .init(poster: "atomicblonde", title: "Atomic Blonde", description: "An undercover MI6 agent is sent to Berlin during the Cold War to investigate the murder of a fellow agent and recover a missing list of double agents.", trailer: Constants.atomicBlondeTrailer),
        .init(poster: "bullettrain", title: "Bullet Train", description: "Five assassins aboard a fast moving bullet train find out their missions have something in common.", trailer: Constants.bulletTrainTrailer),
        .init(poster: "contractor", title: "The Contractor", description: "A discharged U.S. Special Forces sergeant, James Harper, risks everything for his family when he joins a private contracting organization.", trailer: Constants.contractorTrailer),
        .init(poster: "equalizer", title: "Equalizer", description: "A man who believes he has put his mysterious past behind him cannot stand idly by when he meets a young girl under the control of ultra-violent Russian gangsters.", trailer: Constants.equalizerTrailer),
        .init(poster: "forrestgump", title: "Forrest Gump", description: "The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama man with an IQ of 75, whose only desire is to be reunited with his childhood sweetheart.", trailer: Constants.forrestGumpTrailer),
        .init(poster: "magnificent7", title: "The Magnificent Seven", description: "Seven gunmen from a variety of backgrounds are brought together by a vengeful young widow to protect her town from the private army of a destructive industrialist.", trailer: Constants.magnificentTrailer),
        .init(poster: "nobody", title: "Nobody", description: "A docile family man slowly reveals his true character after his house gets burgled by two petty thieves, which, coincidentally, leads him into a bloody war with a Russian crime boss.", trailer: Constants.nobodyTrailer),
        .init(poster: "sicario", title: "Sicario", description: "An idealistic FBI agent is enlisted by a government task force to aid in the escalating war against drugs at the border area between the U.S. and Mexico.", trailer: Constants.sicarioTrailer),
        .init(poster: "theaccountant", title: "The Accountant", description: "As a math savant uncooks the books for a new client, the Treasury Department closes in on his activities, and the body count starts to rise.", trailer: Constants.accountantTrailer),
        .init(poster: "topgun", title: "Top Gun: Mavericks", description: "After thirty years, Maverick is still pushing the envelope as a top naval aviator, but must confront ghosts of his past when he leads TOP GUN's elite graduates on a mission that demands the ultimate sacrifice from those chosen to fly it.", trailer: Constants.topGunTrailer)
    ]
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar(largeTitleColor: .white, backgoundColor: .systemRed, tintColor: .white, title: "Movies", preferredLargeTitle: true)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        registerCells()
    }
    
    //MARK: - Helper Functions
    
    /*
     Function to register custom cells.
     */
    private func registerCells() {
        collectionView.register(.init(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: Constants.movieCellIdentifier)
    }
}

extension MovieViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let st = UIStoryboard(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: Constants.movieDetailViewController) as! MovieDetailViewController
        vc.navBarTitle = movies[indexPath.row].title
        vc.movieDescription = movies[indexPath.row].description
        vc.movieTrailer = movies[indexPath.row].trailer
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension MovieViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.movieCellIdentifier, for: indexPath) as! MovieCell
        cell.configureUI(with: movies[indexPath.row])
        return cell
    }
}

extension MovieViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 4 , bottom: 4, right: 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 24) / 2
        return .init(width: width, height: 300)
    }
}

private extension MovieCell {
    func configureUI(with movie: Movie) {
        imageView.image = UIImage(named: movie.poster)
    }
}


