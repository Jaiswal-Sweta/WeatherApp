

import UIKit

class HomeView: UIViewController {
    
    var WeatherArray = [WeatherDetails]()
    
    private let mylabel:UILabel = {
        let label = UILabel()
        label.text = "Weather App"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 25)
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.shadowColor = .yellow
        return label
    }()
    private let NameTextfield: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder =
            NSAttributedString(string: "Enter City Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        textField.font = UIFont(name: "HoeflerText-BlackItalic", size: 15)
        textField.text = ""
        textField.textColor = .black
        textField.textAlignment = .center
        textField.backgroundColor = .white
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.cornerRadius = 15
        return textField
    }()
    
    private let ShowButton : UIButton = {
        let button = UIButton()
        button.setTitle("Search", for: .normal)
        button.addTarget(self, action: #selector(OnShowClicked), for: .touchUpInside)
       // button.backgroundColor = UIColor(cgColor: UIColor.red.cgColor)
        button.backgroundColor = #colorLiteral(red: 0.4392156899, green:
            0.01176470611, blue: 0.1921568662, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    
    @objc public func OnShowClicked()
    {
        let name = NameTextfield.text!
        WeatherArray = APIHandler.shared.search_weather(with: name)
        for  i in WeatherArray {
            
            location.text = """
              \(i.location.name),\(i.location.country)    \(i.location.localtime)
              \(i.location.tz_id)
            """
            //timezone.text = "\(i.location.localtime)"
            //timezone_id.text  = "\(i.location.tz_id)"
            
            wind.text = """
              Wind
              \(i.current.wind_mph) Mp/h
              \(i.current.wind_kph) Km/h
            """
            
//            wind_mph.text = "\(i.current.wind_mph) Mp/h"
//            wind_kmh.text = "\(i.current.wind_kph) Km/h"
            
            
            temp.text = """
              Temperature
              \(i.current.temp_c) C
              \(i.current.temp_f) F
            """
//            temp_c.text = "\(i.current.temp_c) C"
//            temp_f.text = "\(i.current.temp_f) F"
            
            
            pre.text = """
              Pressure
              \(i.current.pressure_mb) mb
              \(i.current.pressure_in) in
              Humidity
              \(i.current.humidity)
            """
//            pre_mb.text = "\(i.current.pressure_mb) mb"
//            pre_in.text = "\(i.current.pressure_in) in"
            
//            hum.text = "Humidity"
//            hum_pre.text = "\(i.current.humidity) %"
            
        }
    }
    
    
    private let view1:UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = .gray
        view.layer.opacity = 0.6
        return view
    }()

////////////////////////////labeks
    private let location:UILabel = {
        let label = UILabel()
        //label.text = "location"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize:  20)
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.borderWidth = 5
        label.numberOfLines = 3
        return label
    }()
    private let timezone:UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize:  20)
        
        return label
    }()
    private let timezone_id:UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize:  20)
        
        return label
    }()
    private let wind:UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize:  25)
        label.textAlignment = .center
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.borderWidth = 5
        label.numberOfLines = 3
        return label
    }()
   
    
    
    
    private let temp:UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize:  25)
        label.textAlignment = .center
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.borderWidth = 5
        label.numberOfLines = 3
        return label
    }()
 
    
    
    
    
    private let pre:UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize:  25)
        label.textAlignment = .center
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.borderWidth = 5
        label.numberOfLines = 6
        return label
    }()
   
    
    
  
    
    
    
    
    
    
    
 /////////////////////////////
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        view.addSubview(mylabel)
        view.addSubview(NameTextfield)
        view.addSubview(ShowButton)
         view.addSubview(view1)
        
        //
        view.addSubview(location)
        view.addSubview(timezone)
        view.addSubview(timezone_id)
       
        view.addSubview(wind)
       
       
        view.addSubview(temp)
       
       
        view.addSubview(pre)
       
       
     
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    
        mylabel.frame = CGRect(x: 20, y: 40, width: view.frame.size.width-40, height: 30)
        NameTextfield.frame = CGRect(x: 20, y: 80, width: view.frame.size.width-40, height: 30)
        ShowButton.frame = CGRect(x: 40, y: 120, width: view.frame.size.width-80, height: 40)
        view1.frame = CGRect(x: 20, y:170, width: view.frame.size.width - 40, height: 450)
        
        
        /////
        location.frame = CGRect(x: view1.left + 20, y: view1.top + 20, width:  view.frame.size.width-65, height: 85)
       
       
        wind.frame = CGRect(x: view1.left + 20, y: 300, width:  140, height: 100)
    
        temp.frame = CGRect(x: view1.left+165, y: 300, width: 170, height: 100)


        pre.frame = CGRect(x: view1.left + 20, y: 420, width: view.frame.size.width-65, height: 170)


     
    }

    func assignbackground(){
        let background = UIImage(named: "bg1")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
 
}
