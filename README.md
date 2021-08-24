
<div align='center'>

## Universidade Federal de Ouro Preto
## Departamento de Computação
### **Engenharia de Software II**</br></br>
### Sistema de *Votação*
### Grupo: *Votop*
</div>
</br></br></br></br></br></br></br>

Alunos:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Camillo Rinaldi Barbosa </br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Gustavo Presoti Sales Brito</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pedro Igor de Souza Malaquias</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rodrigo Juliano da Silva</br>
Professor:&nbsp;Msc prof. Johnatan Oliveira </br>

</div>
</br>

# Conteúdo

1. [Histórico de Revisões](#histórico-de-revisões)
1. [Processo e Software](#processo-e-software)
1. [Cronograma](#cronograma)
1. Levantamento de Requisitos
1. Especificação de Requisitos
    1. Requisitos Funcionais
    1. Requisitos não fucionais
1. Plano VVT
    1. Requisitos a serem testados
    1. Estratégia e ferramentas de teste
    1. Equipe e infra-estrutura
    1. Exeecução do Plano de Teste 
1. Mediação e Qualidade de Software
1. Observações
1. Referências

------------------------

## Histórico de Revisões

| Data      | Versão | Descrição                         | Autor |
|-----------|--------|-----------------------------------| ----- |
|18/06/2022 |1.0     |Início da escrita do documento     |Todos|
|18/06/2022 |1.0     |Início do repositório              |Todos|
|18/06/2022 |1.0     |Definição de Processo e Software   |Todos|
|18/06/2022 |1.0     |Definição do Cronograma            |Todos|


## Processo e Software
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;O modelo escolhido para o desenvolvimento do software foi o Scrum. A escolha teve como base as ferramentas colaborativas que o método oferece, facilitando a integração da equipe e o melhor desenvolvimento do software. Além disso, o modelo foca na colaboração e comunicação rápida, o que atende exatamente o nosso caso (curto período para a entrega final). Dessa forma, o intervalo de acompanhamento das tarefas desenvolvidas seguem um fluxo constante, sendo definido o tempo de uma semana para cada sprint.

## Cronograma
   |Nome             |Tarefa                      |Prazo    |
   |-----------------|----------------------------|---------|
   |Todos            |Definição do modelo de processo de software,detalhes para implementação</br>(linguagem,plataforma e responsáveis) e cronograma|14/06 a 20/06|
   |                 |Especificação de requisitos (casos de uso e descrição dos cenários)|21/06 a 27/06|
   |                 |Justificativa da escolha do processo de software|14/06 a 11/07|
   |Camillo          |Levantamento dos Requisitos do software|12/07 a 18/07|
   |Todos            |Plano de verificação, validação e testes|19/07 a 25/07|
   |Todos            |Implementação das classes e métodos|26/06 a 28/07|
   |                 |Aplicação de técnicas e uso de ferramentas para medição de qualidade de software|26/07 a 01/08|

## Leventamento de Requisitos

|Criar eleição |                                                |
|:-------------:|-------------------------------------------------|
|Objetivo| Permitir que o administrador crie uma nova eleição    |
|Requisitos| Estar na funcionalidade de Administrator|
|Atores| Administrador |
|Pré-Condições| Estar no menu de Administrador |
|Fluxo Pricipal| 
|Pós-Condições| Eleição Cadastrada |

|Apurar Votação|                                                |
|:-------------:|-------------------------------------------------|
|Objetivo| Permitir que o administrador crie uma nova eleição    |
|Requisitos| Estar na funcionalidade de Administrator|
|Atores| Administrador |
|Pré-Condições| Estar no menu de Administrador |
|Fluxo Pricipal| 
|Pós-Condições| Eleição Cadastrada |

|Criar Item de Votação |                                                |
|:-------------:|-------------------------------------------------|
|Objetivo| Permitir que o administrador crie uma nova eleição    |
|Requisitos| Estar na funcionalidade de Administrator|
|Atores| Administrador |
|Pré-Condições| Estar no menu de Administrador |
|Fluxo Pricipal| 
|Pós-Condições| Item Cadastrado |

|Iniciar votação |                                                |
|:-------------:|-------------------------------------------------|
|Objetivo| Permitir que o administrador crie uma nova eleição    |
|Requisitos| Estar na funcionalidade de Administrator|
|Atores| Administrador |
|Pré-Condições| Estar no menu de Administrador |
|Fluxo Pricipal| 
|Pós-Condições| Eleição Cadastrada |


### Diagrama de casos de uso

![Diagrama de contexto](assets\images\readme\img1.jpeg)
![Diagrama de hierarquia dos atores](assets\images\readme\img2.jpeg)

## Medição e Qualidade de Software
Para o cálculo de métricas de código utilizamos o pacote Dart Code
Metrics[^2]. Ele fornece as seguintes métricas:

-   Complexidade Ciclomática: Número de caminhos linearmente
    independentes por meio de um bloco de código (Cada fluxo de controle
    aumenta a complexidade em 1).

-   Índice de manutenibilidade: Escala entre 0 e 100 calculado por

    MAX(0,(171 - 5.2 * ln(Halstead Volume) - 0.23 * (Cyclomatic Complexity) - 16.2 * ln(Lines of Code))*100 / 171)

-   Linhas de Código (Incluindo comentários e linhas em branco)

-   Aninhamento Máximo: Nível máximo de aninhamento de blocos em um
    método.

-   Número de métodos: Número total de métodos em uma classe.

-   Número de parâmetros: Número de parâmetros recebidos por um método

-   Linhas de código-fonte (Não inclui comentários e linhas em branco)

-   Peso de uma classe: Número de métodos públicos funcionais (exclui
    getters e setters) dividido pelo número total de métodos públicos.

Ele também permite verificar padrões de uso da linguagem e formatação,
que ajudam na legibilidade e confiabilidade do código. Exemplos:

-   avoid-non-null-assertion

-   avoid-late-keyword

-   no-empty-block

Comando para executar:
```
dart run dart_code_metrics:metrics analyze lib
```

[^2]: https://dartcodemetrics.dev/docs/getting-started/introduction