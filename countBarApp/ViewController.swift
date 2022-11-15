//
//  ViewController.swift
//  countBarApp
//
//  Created by 김태경 on 2022/11/08.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer?
    
    var number: Int = 0
    
    let systemSoundID: SystemSoundID = 1016
    
    
    // override가 있으니 이미 있는 함수를 재정의 한것임.
    // 앱에 화면에 가장 먼저 실행되는 부분.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 여기에 선언해도 되지만 깔끔하게 보이고 싶다면 밑 처럼 함수를 하나 만들어서 사용하도록 한다.
        // 그리고 실제 실무에서는 이렇게 많이 사용한다.
        
        configureUI()
        
        
    }
    
    
    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
    }
    
  
    
    
    

//    @IBAction func sliderChanged(_ sender: UISlider) {
//        // 슬라이더가 움직일때마다 nameLabel 변경
//
//        // slider.value    // 슬라이더는  0.0 ~ 1.0만 인식 가능하다. 이것을 0~60으로 변경해야한다.
//                           // 방법은 60을 곱하면 된다.
//
//        let seconds = Int(slider.value * 60)
//
//        // print(seconds)
//        mainLabel.text = "\(seconds) 초"
//        number = seconds
//    }
    
    
    // 이렇게 하면 위 코드와 다르게 더 간편하게 할 수 있음.
    
    @IBAction func sliderChanged(_ sender: UISlider) {

        number = Int(sender.value * 60)  // 이 표현이 엄밀하게 더 정확한 표현이다. 이미 위에서 sender 파라미터에 값을 받고 있기 때문에 sender를 사용해도 무방하다.
        // print(seconds)
        mainLabel.text = "\(number) 초"
        
    }
   
    
    
//    @IBAction func startButtonTapped(_ sender: UIButton) {
//        // 초단위로 지나갈때 마다 무언가를 실행.
//
//        timer?.invalidate()
//
//
//        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
//            // 반복하고 싶은 코드를 이곳에 적으면 됨.
//
//
//
//
//            if number > 0 {
//                number -= 1
//
//                // 슬라이더도 줄여야함.
//                // 레이블표시도 다시 해줘야 함
//                slider.value =  Float(number) / Float(60)
//
//              /* 숫자 계산해서 넣어야함. 초를 만들때 60을 곱했었음. 그리고 그것을 정수형태로 만들었음. 먼저 슬라이더의 value는 0부터 1이라는 값만 들어 갈 수 있음. 따라서 0~60으로 만들었던 값을 다시 60으로 나눠서 0~1로 바꿔준 것임. */
//                mainLabel.text = "\(number) 초"
//
//            } else {
//                number = 0
//                mainLabel.text = "초를 선택하세요"
//
//                // 0초가 됐을때 소리를 나게 해야한다.
//                // 그리고 한번 타이머를 정지 시켜야한다. (안그럼 무한으로 함수가 실행되기 때문)
//
//                timer?.invalidate()
//                AudioServicesPlaySystemSound(systemSoundID)
//            }
//
//        }
//
//    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // 초단위로 지나갈때 마다 무언가를 실행.
        
        timer?.invalidate()

        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSomethingAfter1Second), userInfo: nil, repeats: true)
        
        // 1.timeInterval은 특정 값마다 실행한다는 의미다. 1.0이라면 1초마다 ~~ 한다 라고 생각하자.
        // 2. target - 말 그대로 타겟을 말한다. 1.0초 마다 ~~가 ~~를 한다. 중 ~~가를 담당한다. 본인이 작용해야 하므로 self를 사용한다.
        // 3. selector - 사용 방법은 #selector()를 쓰고 괄호안에 실행할 함수 이름을 넣으면 된다. 단, 이 방법은 오브젝트-C에서 부터 사용했던 방법이기 때문에 해당 함수에 @objc를 써야한다.
        // 4. 보통 userInfo는 없기 때문에 nil로 한다.
        // 5. repeats - 반복의 여부를 묻는 것이다.
        
        
//        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
//            // 반복하고 싶은 코드를 이곳에 적으면 됨.
//
//            if number > 0 {
//                number -= 1
//
//                // 슬라이더도 줄여야함.
//                // 레이블표시도 다시 해줘야 함
//                slider.value =  Float(number) / Float(60)
//
//              /* 숫자 계산해서 넣어야함. 초를 만들때 60을 곱했었음. 그리고 그것을 정수형태로 만들었음. 먼저 슬라이더의 value는 0부터 1이라는 값만 들어 갈 수 있음. 따라서 0~60으로 만들었던 값을 다시 60으로 나눠서 0~1로 바꿔준 것임. */
//                mainLabel.text = "\(number) 초"
//
//            } else {
//                number = 0
//                mainLabel.text = "초를 선택하세요"
//
//                // 0초가 됐을때 소리를 나게 해야한다.
//                // 그리고 한번 타이머를 정지 시켜야한다. (안그럼 무한으로 함수가 실행되기 때문)
//
//                timer?.invalidate()
//                AudioServicesPlaySystemSound(systemSoundID)
//            }
//
//        }
        
    }
   
    // selector를 사용하는 방법은 objc에서 했던 방법이기 때문에 이렇게 적어야 사용 가능하다.
    @objc func doSomethingAfter1Second() {
        
        if number > 0 {
            number -= 1
            slider.value =  Float(number) / Float(60)
            mainLabel.text = "\(number) 초"
            /* 숫자 계산해서 넣어야함. 초를 만들때 60을 곱했었음. 그리고 그것을 정수형태로 만들었음. 먼저 슬라이더의 value는 0부터 1이라는 값만 들어 갈 수 있음. 따라서 0~60으로 만들었던 값을 다시 60으로 나눠서 0~1로 바꿔준 것임. */
            
        } else {
            number = 0
            mainLabel.text = "초를 선택하세요"
            timer?.invalidate()
            AudioServicesPlaySystemSound(systemSoundID)
            // 0초가 됐을때 소리를 나게 해야한다.
            // 그리고 한번 타이머를 정지 시켜야한다. (안그럼 무한으로 함수가 실행되기 때문)
        }

    }

    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        // 초기화 세팅.
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
        number = 0
        timer?.invalidate()
        // timer = nil 위나 아래나 거의 같다.
        
    }
    
}

