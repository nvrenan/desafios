class CaixaEletronico
    def sacar(valor)
      cedulas = [100,50,20,10,2]
      @saque = []
      if (valor > 1) && (valor != 3)
        @saldo = valor
        if valor % 2 == 1
          @saldo = valor - 5
          @saque << 5
        end
        cedulas.each {|cedula| selecionar_cedulas(cedula)}
        @saque.sort!
      end
    end
    def selecionar_cedulas(cedula)
      qtd_cedulas = @saldo.div cedula
      @saque.concat(Array.new(qtd_cedulas,cedula))
      @saldo -= (cedula*qtd_cedulas)
    end
end