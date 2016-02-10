using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace DesafiosWpf
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        Dictionary<RadioButton, Action> _rbMethods = new Dictionary<RadioButton, Action>();
        public MainWindow()
        {
            InitializeComponent();
            
            _rbMethods.Add(rbCaixaEletronico, CaixaEletronicoAction);
            
        }

        private void btExecute_Click(object sender, RoutedEventArgs e)
        {
            foreach (RadioButton key in _rbMethods.Keys.Where(rb => (bool) rb.IsChecked))
            {
                _rbMethods[key]();
            }
        }

        private void CaixaEletronicoAction()
        {
            CaixaEletronico ceCaixaEletronico =  new CaixaEletronico();
            var dinheiro = ceCaixaEletronico.Sacar(77);
            StringBuilder sb =  new StringBuilder();
            foreach (var pair in dinheiro)
            {
                if (pair.Value > 0)
                {
                    sb.AppendFormat(@"R${0}, {1}", pair.Key, pair.Value);
                    sb.AppendLine();
                }
            }

            MessageBox.Show(sb.ToString(), "Resultado:");
        }

    }
}
