//
//  SearchViewController.swift
//  InstagramApp
//
//  Created by Arpit iOS Dev. on 17/05/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    
    @IBOutlet weak var SearchCollectionView: UICollectionView!
    
    var arrData = [CollectionModel]()
    var searching = false
    var searchFood = [CollectionModel]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        configureSearchController()
    }
    
    private func setData() {
        let data2 = CollectionModel(searchImage: "02", searchLbl: "Arpit")
        arrData.append(data2)
        let data1 = CollectionModel(searchImage: "1", searchLbl: "Aadi yogi")
        arrData.append(data1)
        
        let data3 = CollectionModel(searchImage: "3", searchLbl: "Trafic")
        arrData.append(data3)
        let data4 = CollectionModel(searchImage: "4", searchLbl: "ganesh")
        arrData.append(data4)
        let data5 = CollectionModel(searchImage: "5", searchLbl: "Holi")
        arrData.append(data5)
        let data6 = CollectionModel(searchImage: "06", searchLbl: "Hiren")
        arrData.append(data6)
        let data7 = CollectionModel(searchImage: "7", searchLbl: "Dilhi Gate")
        arrData.append(data7)
        let data8 = CollectionModel(searchImage: "08", searchLbl: "harshil")
        arrData.append(data8)
        let data9 = CollectionModel(searchImage: "9", searchLbl: "Rath Yatra")
        arrData.append(data9)
        let data10 = CollectionModel(searchImage: "10", searchLbl: "Harshad")
        arrData.append(data10)
        let data11 = CollectionModel(searchImage: "11", searchLbl: "Milan")
        arrData.append(data11)
        let data12 = CollectionModel(searchImage: "2", searchLbl: "Android")
        arrData.append(data12)
        let data13 = CollectionModel(searchImage: "03", searchLbl: "meet")
        arrData.append(data13)
        let data14 = CollectionModel(searchImage: "6", searchLbl: "iOS")
        arrData.append(data14)
        let data15 = CollectionModel(searchImage: "8", searchLbl: "Diwali")
        arrData.append(data15)
        let data16 = CollectionModel(searchImage: "09", searchLbl: "Neel")
        arrData.append(data16)
        let data17 = CollectionModel(searchImage: "04", searchLbl: "harsh")
        arrData.append(data17)
        let data18 = CollectionModel(searchImage: "12", searchLbl: "Web")
        arrData.append(data18)
        let data19 = CollectionModel(searchImage: "13", searchLbl: "Ran")
        arrData.append(data19)
        let data20 = CollectionModel(searchImage: "05", searchLbl: "Dev")
        arrData.append(data20)
        let data21 = CollectionModel(searchImage: "07", searchLbl: "Ved")
        arrData.append(data21)
        let data22 = CollectionModel(searchImage: "14", searchLbl: "Motion")
        arrData.append(data22)
        let data23 = CollectionModel(searchImage: "15", searchLbl: "South")
        arrData.append(data23)
        let data24 = CollectionModel(searchImage: "16", searchLbl: "dance")
        arrData.append(data24)
        let data25 = CollectionModel(searchImage: "17", searchLbl: "Ugad")
        arrData.append(data25)
        let data26 = CollectionModel(searchImage: "18", searchLbl: "Kite")
        arrData.append(data26)
        let data27 = CollectionModel(searchImage: "19", searchLbl: "Banganga")
        arrData.append(data27)
        let data28 = CollectionModel(searchImage: "20", searchLbl: "Kanha")
        arrData.append(data28)
        let data29 = CollectionModel(searchImage: "21", searchLbl: "Janmashtami")
        arrData.append(data29)
        let data30 = CollectionModel(searchImage: "22", searchLbl: "Melo")
        arrData.append(data30)
        let data31 = CollectionModel(searchImage: "23", searchLbl: "Golden Temple")
        arrData.append(data31)
        let data32 = CollectionModel(searchImage: "25", searchLbl: "Qtumb binar")
        arrData.append(data32)
        let data33 = CollectionModel(searchImage: "26", searchLbl: "UI Ux")
        arrData.append(data33)
        let data34 = CollectionModel(searchImage: "27", searchLbl: "Lal Killo")
        arrData.append(data34)
        let data35 = CollectionModel(searchImage: "28", searchLbl: "Unity")
        arrData.append(data35)
        let data36 = CollectionModel(searchImage: "29", searchLbl: "Gudi Padwa")
        arrData.append(data36)
        let data37 = CollectionModel(searchImage: "30", searchLbl: "Ran Utsav")
        arrData.append(data37)
        let data38 = CollectionModel(searchImage: "31", searchLbl: "Tajmahal")
        arrData.append(data38)
        let data39 = CollectionModel(searchImage: "32", searchLbl: "NagPacham")
        arrData.append(data39)
        let data40 = CollectionModel(searchImage: "33", searchLbl: "Wallpaper")
        arrData.append(data40)
        let data41 = CollectionModel(searchImage: "34", searchLbl: "Navratri")
        arrData.append(data41)
        let data42 = CollectionModel(searchImage: "35", searchLbl: "Vasant Pachmi")
        arrData.append(data42)
        let data43 = CollectionModel(searchImage: "36", searchLbl: "Darshan")
        arrData.append(data43)
    }
    	
    private func configureSearchController(){
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Search Here"
    }
    
}

extension SearchViewController : UICollectionViewDelegate,UICollectionViewDataSource,
                                 UISearchBarDelegate,UISearchResultsUpdating{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searching{
            return searchFood.count
        }else{
            return arrData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = SearchCollectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as! SearchCollectionViewCell
        if searching {
            cell.SearchCollectionImage.image = UIImage(named: searchFood[indexPath.row].searchImage)
            cell.SearchLbl.text = searchFood[indexPath.row].searchLbl
        }else{
            cell.SearchCollectionImage.image = UIImage(named: arrData[indexPath.row].searchImage)
            cell.SearchLbl.text = arrData[indexPath.row].searchLbl
        }
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty {
            searching = true
            searchFood.removeAll()
            for food in arrData {
                if food.searchLbl.lowercased().contains(searchText.lowercased()) {
                    searchFood.append(food)
                }
            }
            debugPrint(searchFood.count)

        }else{
            searching = false
            searchFood.removeAll()
            searchFood = arrData

        }
        SearchCollectionView.reloadData()

    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchFood.removeAll()
        SearchCollectionView.reloadData()
    }
    
}
