using Microsoft.VisualStudio.TestTools.UnitTesting;
using DesafiosWpf;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DesafiosWpf.Tests
{
    [TestClass()]
    public class CaixaEletronicoTests
    {
        CaixaEletronico ceCaixaEletronico = new CaixaEletronico();

        [TestMethod()]
        public void SacarExceptionsTest()
        {
            try
            {
                ceCaixaEletronico.Sacar(1);
                Assert.Fail();
            }
            catch (Exception)
            {
                Assert.IsTrue(true);
            }

            try
            {
                ceCaixaEletronico.Sacar(3);
                Assert.Fail();
            }
            catch (Exception)
            {
                Assert.IsTrue(true);
            }

        }
        [TestMethod()]
        public void Sacar2Test()
        {
          Assert.AreEqual("2-1", RetornaString(ceCaixaEletronico.Sacar(2)));
        }
        [TestMethod()]
        public void Sacar8Test()
        {
            Assert.AreEqual("2-4", RetornaString(ceCaixaEletronico.Sacar(8)));
        }
        [TestMethod()]
        public void Sacar14Test()
        {
            Assert.AreEqual("10-1, 2-2", RetornaString(ceCaixaEletronico.Sacar(14)));
        }
        [TestMethod()]
        public void Sacar21Test()
        {
            Assert.AreEqual("10-1, 5-1, 2-3", RetornaString(ceCaixaEletronico.Sacar(21)));
        }
        [TestMethod()]
        public void Sacar23Test()
        {
            Assert.AreEqual("10-1, 5-1, 2-4", RetornaString(ceCaixaEletronico.Sacar(23)));
        }
        [TestMethod()]
        public void Sacar30Test()
        {
            Assert.AreEqual("20-1, 10-1", RetornaString(ceCaixaEletronico.Sacar(30)));
        }
        [TestMethod()]
        public void Sacar31Test()
        {
            Assert.AreEqual("20-1, 5-1, 2-3", RetornaString(ceCaixaEletronico.Sacar(31)));
        }
        [TestMethod()]
        public void Sacar33Test()
        {
            Assert.AreEqual("20-1, 5-1, 2-4", RetornaString(ceCaixaEletronico.Sacar(33)));
        }
        [TestMethod()]
        public void Sacar35Test()
        {
            Assert.AreEqual("20-1, 10-1, 5-1", RetornaString(ceCaixaEletronico.Sacar(35)));
        }
        [TestMethod()]
        public void Sacar37Test()
        {
            Assert.AreEqual("20-1, 10-1, 5-1, 2-1", RetornaString(ceCaixaEletronico.Sacar(37)));
        }
        [TestMethod()]
        public void Sacar40Test()
        {
            Assert.AreEqual("20-2", RetornaString(ceCaixaEletronico.Sacar(40)));
        }
        [TestMethod()]
        public void Sacar41Test()
        {
            Assert.AreEqual("20-1, 10-1, 5-1, 2-3", RetornaString(ceCaixaEletronico.Sacar(41)));
        }
        [TestMethod()]
        public void Sacar43Test()
        {
            Assert.AreEqual("20-1, 10-1, 5-1, 2-4", RetornaString(ceCaixaEletronico.Sacar(43)));
        }
        [TestMethod()]
        public void Sacar57Test()
        {
            Assert.AreEqual("50-1, 5-1, 2-1", RetornaString(ceCaixaEletronico.Sacar(57)));
        }
        [TestMethod()]
        public void Sacar58Test()
        {
            Assert.AreEqual("50-1, 2-4", RetornaString(ceCaixaEletronico.Sacar(58)));
        }
        [TestMethod()]
        public void Sacar59Test()
        {
            Assert.AreEqual("50-1, 5-1, 2-2", RetornaString(ceCaixaEletronico.Sacar(59)));
        }
        [TestMethod()]
        public void Sacar351Test()
        {
            Assert.AreEqual("100-3, 20-2, 5-1, 2-3", RetornaString(ceCaixaEletronico.Sacar(351)));
        }
        [TestMethod()]
        public void Sacar353Test()
        {
            Assert.AreEqual("100-3, 20-2, 5-1, 2-4", RetornaString(ceCaixaEletronico.Sacar(353)));
        }

        public string RetornaString(Dictionary<string, int> dinheiro)
        {
            StringBuilder sb = new StringBuilder();
            foreach (var pair in dinheiro)
            {
                if (pair.Value > 0)
                {
                    sb.AppendFormat("{0}-{1}, ", pair.Key, pair.Value);
                }
            }
            if (sb.Length > 3)
              sb.Remove(sb.Length - 2, 2);
            return sb.ToString();
        }

    }
}