import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

/**
 * Simulação de um saque via caixa eletrônico. Saque de qualquer valor inteiro a partir de 2, exceto o valor 3 (2, 4, 5, 6, ..., n)
 * Cédula disponíveis: 2, 5, 10, 20, 50, 100.
 * Obs.: A lógica é baseada em somatória de valores em Array; adição e busca em HashMap.
 * Obs2: Não foi realizado nenhum atalho ou cálculo matemático em especial, somente somatórios e condicionais.
 * 
 * @author Paulo Weverton - p.wevertonlm@gmail.com
 */
public class CaixaEletronico {
    
    public static void main(String[] args) {
        try {
            System.out.println("Informe o valor do saque: ");
            Scanner s = new Scanner(System.in);
            Integer valorEntrada = s.nextInt(); // Valor solicitado pelo usuário.
            
            if (valorEntrada != 3) {
                Integer[] cedulas = {100, 50, 20, 10, 5, 2}; // Cédulas disponíveis.
                HashMap<Integer, Integer> contagemFinalCedulas = new HashMap<>(); // A <key> é o valor da cédula e o <value> é a quantidade necessárias de cada uma.

                for (Integer cedula: cedulas) { // Inicializando o hash que possui a contagem das cédulas
                    contagemFinalCedulas.put(cedula, 0);
                }

                Integer somaCedulasTemp = 0; // Somatório das cédulas percorridas.
                Integer[] indicesPenultimaEultima = {-1, -1}; // Indice 0 e 1: indices da penúltima e última cédula adicionada respectivamente.

                // Percorre as cédulas da maior para a menor até que o valor solicitado seja alcançado.
                for (int indiceCedulasDisp = 0; indiceCedulasDisp < cedulas.length && !somaCedulasTemp.equals(valorEntrada); indiceCedulasDisp++) {
                    Integer cedulaAtual = cedulas[indiceCedulasDisp]; // Cada cédula disponível.
                    Integer qtdAdicionadaAteAgora;

                    // Percorre as cédulas atribuindo-as e removendo-as à estrutura de dados <hash> que contém a quantidade de cada cédula para o saque.
                    do {
                        somaCedulasTemp += cedulaAtual; // Acumulando o valor das cédúlas para verificar se o valor solicitado foi alcançado.
                        if (somaCedulasTemp > valorEntrada) {
                            somaCedulasTemp -= cedulaAtual; // Desconsidera a última atribuição temporária por ter estourado o valor solicitado.

                            /*
                            Se chegar na última cédula (final do array) e o valor do somatório não for igual ao solicitado 
                            deve-se remover uma cédula anteriormente adicionada para trocar por uma de menor valor. 
                            Caso a última cédula adcionada não tenha sido a de menor valor disponível remove-se a 
                            última adicionada. Caso a última cédula adicionada tenha sido a de menor valor disponível remove-se 
                            a penúltima adicionada e troca-se por outra de menor valor.
                            */
                            if (indiceCedulasDisp == cedulas.length - 1) {
                                Integer penultimaAdd = indicesPenultimaEultima[0]; // Pegando referência do índice (do array de cédulas disponível) da penúltima adicionada.
                                Integer ultimaAdd = indicesPenultimaEultima[1]; // Pegando referência do índice (do array de cédulas disponível) da última adicionada.

                                /*
                                Se a última cédula adicionada for a menor disponível, remove-se a penúltima cédula adicionada. 
                                Se não, remove-se a última adicionada.
                                */
                                if (cedulaAtual.equals(cedulas[ultimaAdd])) {
                                    Integer qtdAdicionadaAteAgora2 = contagemFinalCedulas.get(cedulas[penultimaAdd]); // Pega a quantidade de vezes que a cédula foi adicionada.
                                    contagemFinalCedulas.put(cedulas[penultimaAdd], qtdAdicionadaAteAgora2-=1); // Diminui uma adição desta cédula.
                                    indiceCedulasDisp = indicesPenultimaEultima[0]; // Volta a percorrer as cédulas a partir da próxima menor (o laço for irá incrementar em 1)

                                } else {
                                    qtdAdicionadaAteAgora = contagemFinalCedulas.get(cedulas[ultimaAdd]); // Pega a quantidade de adições da última cédula para cancelar a adição.
                                    contagemFinalCedulas.put(cedulas[ultimaAdd], qtdAdicionadaAteAgora-=1); // Diminui uma adição da última cédula.
                                    indiceCedulasDisp = indicesPenultimaEultima[1]; // Retorna a percorrer a partir da última cédula adicionada, 
                                }
                                somaCedulasTemp -= cedulas[indiceCedulasDisp]; // Desconsidera a última atribuição por ter estourado o valor solicitado.
                            }
                            break;

                        } else { // Se o valor ainda não foi alcançado
                            qtdAdicionadaAteAgora = contagemFinalCedulas.get(cedulaAtual); // Pega a quantidade de adições de uma cédula.
                            contagemFinalCedulas.put(cedulaAtual, qtdAdicionadaAteAgora+=1); // Acumula mais uma adição da cédula.

                            /* 
                            Trecho que atualiza a 'fila' que contém a última e a penúltima cédula adicionada.
                            Usei essa lógica por precisar em algum momento remover a última e penúltima cédula
                            para adicionar uma de menor valor.
                            */
                            indicesPenultimaEultima[0] = indicesPenultimaEultima[1];
                            indicesPenultimaEultima[1] = indiceCedulasDisp;
                        }

                    } while (!somaCedulasTemp.equals(valorEntrada));
                }

                // Imprime o <hash> resultante.
                for (Map.Entry<Integer,Integer> pair : contagemFinalCedulas.entrySet()) {
                    System.out.println(pair.getValue() + " cédulas de : R$ " + pair.getKey());
                }
            } else {
                throw new Exception("O VALOR 3 NÃO ESTÁ DISPONÍVEL");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
