![](https://i.imgur.com/xG74tOh.png)

# Desafio | Módulo 2

O objetivo deste desafio e aplicar todo o conhecimento adquirido ao longo do módulo, para desenvolver uma aplicação que realiza a cotação de moedas.


### Sua missão será:
- Consumir a API: https://docs.awesomeapi.com.br/api-de-moedas
- Seguir a proposta de layout do Figma: https://www.figma.com/file/BagX31a8VTHzCldH9vsEvF/Cotador?node-id=0%3A1;
- Fornecer as opções de moedas a serem cotadas, sendo elas: Real, Libra Esterlina, Dólar Americano, Peso Argentino e Iene;
- Exibir as telas em uma PageView com indicador de página ativa;
    - Bloquear o avanço nas páginas através de scroll;
- No resultado, alterar a cor do valor de compra da moeda seguindo a regra:
    - Valor menor que 1 sendo exibido como verde;
    - Valor maior ou igual a 1, e menor que 5, sendo exibido como amarelo;
    - Valor maior ou igual a 5, sendo exibido como vermelho;
- O botão de avanço deve conter uma variação de "loading", que será exibida enquanto a chamada para a API ocorre, entre a página de cotação e a de resultado;

### Importante
- Só utilizar packages para requisições http e para gerência de estado. **Não** utilizar packages para o layout;
- Utilizar repository/datasource ou qualquer abstração para o consumo da API;
- Fazer gestão de estado com um método diferente do setState, escolha qualquer package de acordo com seu gosto;
- Tokenizar as cores do Figma num arquivo separado;
- Utilizar Enums para simbolizar as moedas;

### Atenção
**Todo código que não for refletido na execução do aplicativo será desconsiderado**. Exemplos: 
- criar uma classe de gerencimanento de estado que não está sendo utiliza 
- realizar uma requisição em que o resultado não tá sendo utilizado.

> Feito é melhor que perfeito, mas mal feito não é feito.


---

Preencha a checklist para fazer o desafio:

-   [ ] Fazer o fork do repositório para sua conta
-   [ ] Executar `git clone` do seu fork no terminal para clonar o repositório, ou clonar de outra maneira
-   [ ] Após fazer e commitar todos os exercícios fazer o `git push` para seu fork
-   [ ] Após fazer o `git push`, será necessário fazer o `pull request` do seu repositório
-   [ ] Copiar a url do seu fork e enviar na plataforma

###### tags: `módulo 2` `flutter` `desafio` `API`
