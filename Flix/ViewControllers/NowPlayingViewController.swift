//
//  NowPlayingViewController.swift
//  Flix
//
//  Created by Pranaya Adhikari on 1/23/18.
//  Copyright © 2018 Pranaya Adhikari. All rights reserved.
//

import UIKit
import AlamofireImage




class NowPlayingViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var movies:[Movie] = []
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(NowPlayingViewController.didPullToRefresh(_:)), for: .valueChanged)
        
        tableView.insertSubview(refreshControl, at: 0)
        tableView.dataSource = self
        tableView.rowHeight = 151
        fetchMovies()
    }
    
    @objc func didPullToRefresh(_ refreshControl:UIRefreshControl){
        fetchMovies()
    }
    
    func fetchMovies(){
        self.activityIndicator.startAnimating()
        
        /*let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy:.reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            //This will run when the network request returns
            if let error = error{
                let alertController = UIAlertController(title: "Cannot Get Movies", message: "The internet connection appears to be offline", preferredStyle: .alert)
                
                // create a cancel action
                let cancelAction = UIAlertAction(title: "Try Again", style: .cancel) { (action) in
                    // handle cancel response here. Doing nothing will dismiss the view.
                    self.fetchMovies()
                }
                // add the cancel action to the alertController
                alertController.addAction(cancelAction)
                self.present(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
                //print(error.localizedDescription)
            }
            else if  let data = data{
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as![String:Any]
                let movieDictionaries = dataDictionary["results"] as! [[String:Any]]
                self.movies = []
                for dictionary in movieDictionaries{
                    let movie = Movie(dictionary: dictionary)
                    self.movies.append(movie)
                }
                self.tableView.reloadData()
         
                
            }
        }
        task.resume() */
//        MovieApiManager().nowPlayingMovies { (movies: [Movie]?, error: Error?) in
//            if let movies = movies {
//                self.movies = movies
//                self.tableView.reloadData()
//                self.refreshControl.endRefreshing()
//                self.activityIndicator.stopAnimating()
//        }
//    }
        MovieApiManager().popularMovies { (movies: [Movie]?, error: Error?) in
            if let movies = movies {
                self.movies = movies
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.movie = movies[indexPath.row]
        /*let title = movie["title"] as! String
        let overview = movie["overview"] as! String
        
        let posterPathString = movie["poster_path"] as! String
        let baseURLString = "https://image.tmdb.org/t/p/w500"
        let posterURL = URL(string:baseURLString+posterPathString )!*/
    
        
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell){
            let movie = movies[indexPath.row]
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.movie = movie 
        }
        
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

