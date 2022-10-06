//
//  ViewController.swift
//  Stopwatch
//
//  Created by Наталья Карпова on 05.10.2022.
//

import UIKit

class Stopwatch: UIViewController, UITableViewDelegate, UITableViewDataSource {
  

    @IBOutlet weak var stopWatchLabel: UILabel!
    
    @IBOutlet weak var tabel: UITableView!
    
    var stopWatch = Timer()
    var counter: Double = 0.0
    var arrayLap: [String] = []

    
    @IBAction func startStopAction(_ sender: UIButton) {
        
        stopWatch = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(tikStopWatch), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func lapAction(_ sender: UIButton) {
        
        arrayLap.append(stopWatchLabel.text!)
        
        tabel.reloadData()
    }
    
    @objc func tikStopWatch() {
        
        counter += 1.0
        
        stopWatchLabel.text = String(counter)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayLap.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lapCell", for: indexPath) as! TableRow
       
        cell.lapLabel.text = arrayLap[indexPath.row]
        return cell
    }
    
}

