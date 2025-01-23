//
//  ViewController.swift
//  act3y4
//
//  Created by Mariana Almaguer Gonzalez on 11/02/24.
//

import UIKit

class ViewController: UIViewController {
    
        @IBOutlet weak var switchTurno: UISwitch!
        @IBOutlet var botones: [UIButton]!
        @IBOutlet weak var estatusLabel: UILabel!
        @IBOutlet weak var botonNuevaPartida: UIButton!
        @IBOutlet weak var jugadorLabel: UILabel!
    
    
        enum Jugador: String {
            case X = "X"
            case O = "O"
        }
        
        var jugadorActual: Jugador = .O
        var tablero: [Jugador?] = Array(repeating: nil, count: 9)
        var terminoJuego: Bool = false
        
        override func viewDidLoad() {
            super.viewDidLoad()
            resetJuego()
        }

        @IBAction func switchCambioValor(_ sender: UISwitch) {
            jugadorActual = sender.isOn ? .O : .X
            jugadorLabel.text = sender.isOn ? "Jugador 1" : "Jugador 2"
            if jugadorActual == .O {
                estatusLabel.text = "Tu Turno"
            } else {
                estatusLabel.text = "Turno máquina"
                turnoMaquina()
            }
        }
        
        @IBAction func botonClic(_ sender: UIButton) {
            guard !terminoJuego else { return }
            guard let index = botones.firstIndex(of: sender) else { return }
            guard tablero[index] == nil else { return }
            
            sender.setTitle(jugadorActual.rawValue, for: .normal)
            tablero[index] = jugadorActual
            
            if checarGanador() {
                if jugadorActual == .O {
                    estatusLabel.text = "¡Has ganado!"
                } else {
                    estatusLabel.text = "\(jugadorActual.rawValue) ha ganado"
                    }
                    terminoJuego = true
            } else if tablero.allSatisfy({ $0 != nil }) {
                estatusLabel.text = "¡Empate!"
                terminoJuego = true
            } else {
                estatusLabel.text = "Turno máquina"
                jugadorActual = .X
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
                    self?.turnoMaquina()
                }
            }
        }
        
        @IBAction func nuevaPartida(_ sender: UIButton) {
            resetJuego()
        }
        
        func turnoMaquina() {
            guard !terminoJuego else { return }
            guard let index = tablero.firstIndex(where: { $0 == nil }) else { return }
            botones[index].setTitle(jugadorActual.rawValue, for: .normal)
            tablero[index] = jugadorActual
            
            if checarGanador() {
                if jugadorActual == .O {
                    estatusLabel.text = "¡Has ganado!"
                } else {
                    estatusLabel.text = "\(jugadorActual.rawValue) ha ganado"
                    }
                    terminoJuego = true
            } else if tablero.allSatisfy({ $0 != nil }) {
                estatusLabel.text = "¡Empate!"
                terminoJuego = true
            } else {
                jugadorActual = .O
                estatusLabel.text = "Tu turno"
            }
        }
        
        func checarGanador() -> Bool {
            let combinacionesGanadoras: [[Int]] = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                                                [0, 3, 6], [1, 4, 7], [2, 5, 8],
                                                [0, 4, 8], [2, 4, 6]]
            for combinacion in combinacionesGanadoras {
                let posiciones = combinacion.map { tablero[$0] }
                if posiciones == [.X, .X, .X] || posiciones == [.O, .O, .O] {
                    return true
                }
            }
            return false
        }
        
        func resetJuego() {
            terminoJuego = false
            jugadorActual = .O
            tablero = Array(repeating: nil, count: 9)
            for boton in botones{
                boton.setTitle("", for: .normal)
            }
            switchTurno.isOn = true
            estatusLabel.text = "Tu turno" 
            jugadorLabel.text = "Jugador 1"
        }
    }

    
