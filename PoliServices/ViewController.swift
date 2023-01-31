//
//  ViewController.swift
//  PoliServices
//
//  Created by Rodrigo Policante Martins on 30/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var lastServiceView: UIView!
    @IBOutlet weak var serviceNameLabel: UILabel!
    @IBOutlet weak var serviceDateLabel: UILabel!
    @IBOutlet weak var novoBtn: UIButton!

    private var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        lastServiceView.alpha = 0
        novoBtn.alpha = 0
        descriptionLabel.text = "A DevServices é o melhor aplicativo para reservar seu agendamento com serviços. Aqui é um espaço que você consegue reservar um espaço na minha agenda e vamos resolver suas dúvidas.\nSelecione o tipo de atendimento e vamos pra cima!\n\n*Ilustrativo"
        initTimer()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupService()
    }

      

    @IBAction func onRequestNewServiceDidTap(_ sender: Any) {
        performSegue(withIdentifier: "showNewService", sender: nil)
    }

    private func initTimer(){
        let now: Date = Date()
        let calendar: Calendar = Calendar.current
        let currentSeconds: Int = calendar.component(.second, from: now)
        let timer = Timer(
            fire: now.addingTimeInterval(Double(60 - currentSeconds + 1)),
            interval: 60,
            repeats: true,
            block: { (t: Timer) in
                self.setupService()
            })
        RunLoop.main.add(timer, forMode: .default)
        self.timer = timer
    }

}
