import Foundation

//MARK: OPTIONALS
struct OptionalExample {
    var optionalWithValue: String? = "Labas"
    var optionalWithoutValue: String?
}

class ClassWithOptional {
    var optionalExample: OptionalExample? = OptionalExample()

    func printString(string: String) {
        print(string)
    }
    
    //Code in this function, try to unwrap optionalWithValue and optionalWithoutValue and pass values to printString(string) function
    //handled nil cases should print error to console
    func unwrapValues() {
        //Force unwrap
        
        //Default value

        //if let
        
        //guard let (print if both variables are not nil)

        //switch

        //printString(string: optionalExample.optionalWithValue)

        //call extraPrint function if both variables are not nil (use combined optional unwrapping)
    }
    
    func extraPrint() {
        print("einam toliau")
    }
}

let classWithOptional = ClassWithOptional()
classWithOptional.unwrapValues()

//MARK: PROPERTIES

//Add lazy or computed properties where it's possible
//add new property currentSong which will print previous song when new song is set, use property observers if possible
struct Song {
    let title: String
    let authorName: String
    var isPlaying: Bool
}

struct RunApp {
    let id: String
    let startTime: Date
    var isMusicLoaded: Bool = false
    
    func elapsedTime() -> TimeInterval {
        Date().timeIntervalSince(startTime)
    }
    
    func loadSongs() -> [Song] {
        //print("loading started")
        sleep(2)
        return [
            Song(
                title: "Nice song",
                authorName: "nice gui",
                isPlaying: false
            )
        ]
    }
}

var runApp = RunApp(id: "1", startTime: Date())
//print(runApp.elapsedTime())
//
//print(runApp.loadSongs().first!.title)
//print(runApp.loadSongs().first!.authorName)

//PRO tip enum with computed propety

enum Category: String {
    case shoes
    case dress
    case jeans
}
//
struct Item {
    var name: String
    var category : Category
}
//
//let item = Item(name: "Nauji batai", category: .shoes)
//
//extension Category {
//    var sizes: String {
//        switch self {
//        case .dress:
//            return "S, M,  L XL"
//        case .shoes:
//            return "39, 40, 41, 42, 43"
//        case .jeans:
//            return "32/33, 33/34, 123"
//        }
//    }
//}
//
//print(item.category.sizes)

//MARK: CLOSURES
class ItemUploadForm {
    var colorId: String?
    
    deinit {
        print("Item upload form was deinitialized")
    }
}

class ColorPickerVC {

    //Define closure: onComplete, that takes String as input parameter and retuns void.
    //Closure should be optional
    //var onComplete:
    
    func selectRedColor() {
        //call closure onComplete with string "3"
    }
    
    deinit {
        print("color picker was deinitialized")
    }
}

class AddItemViewController {
    var itemUploadForm: ItemUploadForm = ItemUploadForm()
    var colorPicker = ColorPickerVC()

    func openColorPicker() {
        //print("present color picker")
        
        //give value for ColorPickerVC onComplete closure. String received from closure should be added to ItemUploadForm as colorId
        //colorPicker.onComplete =
        
        //Simulating color selection in colorPickerVC
        colorPicker.selectRedColor()
        //print("Color was selected")
    }
}

var addItemVC: AddItemViewController? = AddItemViewController()
addItemVC?.openColorPicker()

//Does it have a memory leak? prove it and fix it, does your code above has a memory leak?

class DownloaderManager {
    var imagesDownloader: ImagesDownloader?
    
    func doManagerThings() {
        //print("Do manager things")
    }
}

class ImagesDownloader {
    var onPublish: ((_ value: String) -> Void)?
    var images: [String] = [String]()
    
    var downloadManager: DownloaderManager?
    
    init() {
        onPublish = { imgName in
            self.images.append(imgName)
            //print("new img appended, img count: \(self.images.count)")
        }
    }
    
    func addNewImage(name: String) {
        onPublish?(name)
    }
}

var downloader: ImagesDownloader? = ImagesDownloader()
var manager: DownloaderManager? = DownloaderManager()
downloader?.downloadManager = manager
manager?.imagesDownloader = downloader

downloader?.addNewImage(name: "new Img")


//MARK: PROTOCOLS

struct Bitcoin {
    let name = "Bitcoin"
    let symbol = "BTC"
    var holdings: Double
    var price: NSDecimalNumber?

}

struct Ethereum {
    let name = "Ethereum"
    let symbol = "ETH"
    var holdings: Double
    var price: NSDecimalNumber?
}

class Wallet {
    //add variable that can store array of different coins
    //var coins
    
    //create function that can append new type of coin to created array
    
    //add function named printValue to created protocol that prints general info(name, symbol and holdings) about coin
    func printAllCoins() {
        //coins.forEach { $0.printValue() }
    }
}

//let wallet = Wallet()
//wallet.addCoin(...)
//wallet.printAllCoins()

//MARK: HIGHER ORDER FUNCTIONS

var arrayOfItems: [Item] = [
    Item(name: "Nike batai", category: .shoes),
    Item(name: "Nauji dzinsai", category: .jeans),
    Item(name: "nelabai nauja suknele", category: .dress)
]

//create items names array of Strings from arrayOfItems use map is possible

//var namesOfItems: [String] =

//namesOfItems.forEach { print($0) }

//Create function that transforms value from dictionary into array of strings - description about movie (Good > 5, bad <=5
//["Home Alone 1 (Good)", "Star Wars (Bad)", "Harry Potter (Good)", "Home Alone 4 (Bad)"]

let movies: [String: Float] = ["Home Alone 1": 10, "Star wars": 5, "Harry Potter": 8, "Home Alone 4": 2]

//let mappedMovies: [String]
//mappedMovies.forEach { print($0) }

let arrayOfIntegers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

var newArray: [Int] = []

//Rewrite it using filter
arrayOfIntegers.forEach {
    if $0 % 2 == 0 {
        newArray.append($0)
    }
}

newArray.forEach { print($0) }

//flat map

var arrayOfArrays: [[Int]] = [[1], [2], [1, 4, 6], [6, 5, 3], [2,5,6]]

//arrayOfArrays.forEach { print($0) }

//create array of Integers, from given array - arrayOfArrays which has all values from previous array

//let arrayOfInt: [Int]
//arrayOfInt.forEach { print($0) }

//remove all nil values from given array, use compactMap if possible
var arrayOfRandomObjects: [Any?] = [1, "aasd", 2, "fasf", nil, nil, "value"]

//arrayOfRandomObjects.forEach {
//    print("\($0)")
//}

//create a new array of Items that contains only shoes, use filter if possible
var arrayOfItems2: [Item?] = [
    Item(name: "Nike batai", category: .shoes),
    Item(name: "Nauji dzinsai", category: .jeans),
    nil,
    Item(name: "nelabai nauja suknele", category: .dress),
    Item(name: "Vans", category: .shoes),
    nil,
    Item(name: "Suknele", category: .dress),
    Item(name: "Dzinsai", category: .jeans)
]

//var arrayOfShoes: [Item]
//arrayOfShoes.forEach {
//    print($0.name)
//}

//MARK: DELEGATES
//Rewrite it using delegate pattern

class NetworkService {
    var imageDownloaded: ((String) -> ())?
    var imageDownloadFailed: (() -> ())?
    var imageDownloadPaused: (() -> ())?
    var imageDownloadResumed: (() -> ())?
    
    func fetchImageFromBE() {
        //call api and handle all cases

        //if success
        imageDownloaded?("image name")

        //if failed
        imageDownloadFailed?()

        //if pause
        imageDownloadPaused?()

        //if resume
        imageDownloadResumed?()
    }
    
    deinit {
        print("service deinit")
    }
}

class ImagePickerViewController {
    let newtworkService = NetworkService()
    
    init() {
        newtworkService.imageDownloaded = { image in
            //proccess working with img
            print("\(image) was downloaded")
        }
        
        newtworkService.imageDownloadFailed = {
            //show error alert
            print("failed")
        }
        
        newtworkService.imageDownloadPaused = {
            //show that it's paused
            print("paused")
        }
        
        newtworkService.imageDownloadResumed = {
            //show that it's resumed
            print("resumed")
        }
    }

    deinit {
        print("VC deinit")
    }
    
    func buttonPressed() {
        newtworkService.fetchImageFromBE()
    }
}

var imageVC: ImagePickerViewController? = ImagePickerViewController()

imageVC?.buttonPressed()

imageVC = nil
