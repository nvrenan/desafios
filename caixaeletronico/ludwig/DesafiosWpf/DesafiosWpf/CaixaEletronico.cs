using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Windows.Documents;

namespace DesafiosWpf
{
    public class CaixaEletronico
    {
        private Dictionary<string, int> _dinheiro = new Dictionary<string, int>()
            {
                {"100", 0},
                {"50", 0},
                {"20", 0},
                {"10", 0},
                {"5", 0},
                {"2", 0}
            };
        public Dictionary<string, int> Sacar(int valor)
        {
            if ((valor < 2) || (valor == 3))
                throw new Exception("Valor Invalido!");

            if (valor % 2 != 0)
            {
                _dinheiro["5"] = 1;
                valor -= 5;
            }

            foreach (string key in _dinheiro.Keys.ToList())
            {
                if (key == "5") continue;
                int valorAtual = int.Parse(key);
                _dinheiro[key] = (valor / valorAtual);
                valor = (valor % valorAtual);
                if (valor == 0) break;
            }
            return _dinheiro;
        }
    }
}
