//
//  ProdutosVC.swift
//  LojaVirtual
//
//  Created by Rodrigo de Sousa Santos on 02/10/20.
//  Copyright © 2020 Rodrigo de Sousa Santos. All rights reserved.
//

import UIKit

class ProdutosVC: UIViewController {
    
    @IBOutlet weak var produtosTableView: UITableView!
    
    var categorias: [String] = ["Eletrônicos", "Lazer", "Eletrodomésticos"]
    
    var produtos: [Produto] = [
        Produto(nome: "Bicicleta", preco: "R$ 400,00"),
        Produto(nome: "Bola de Futebol", preco: "R$ 10,00"),
        Produto(nome: "Macbook", preco: "R$ 5.000,00")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        produtosTableView.dataSource = self
        produtosTableView.delegate = self
        
        self.produtosTableView.tableFooterView = UIView(frame: .zero)
    }
}

// MARK: - Table view data source
extension ProdutosVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return categorias.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var qtdeLinhas = 0
        
        if section == 0 {
            qtdeLinhas = 3
        }
        if section == 1 {
            qtdeLinhas = 2
        }
        
        if section == 2 {
            qtdeLinhas = 1
        }
        return qtdeLinhas
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = produtosTableView.dequeueReusableCell(withIdentifier: "ProdutoCell", for: indexPath)
        cell.textLabel?.text = produtos[indexPath.row].nome
        cell.detailTextLabel?.text = produtos[indexPath.row].preco
        print(indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categorias[section]
    }
}

extension ProdutosVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
