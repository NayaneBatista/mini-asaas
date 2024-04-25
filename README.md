# 💻 Sobre o Mini Asaas

O "Mini Asaas" se trata de uma aplicação de cadastro de clientes desenvolvida com a tecnologia Grails 5, que utiliza da API ViaCEP ([https://viacep.com.br/](https://viacep.com.br/)) para localizar o endereço o usuário de acordo com o CEP informado por ele.

O repositório será melhorado conforme o andamento do treinamento dos estagiários do time de Engenharia do Asaas!

## 🚧 Principais Funcionalidades

- A página do formulário está responsiva e os campos solicitam a inserção de informações como: nome, CPF, telefone, CEP, logradouro, número, bairro e cidade;
- Preenchimento automático do endereço (logradouro, bairro e cidade) após inserção correta do CEP a partir da integração feita com o ViaCEP;
- Ao pressionar o botão de envio, as informações fornecidas são retornadas e exibidas no console com uma mensagem de confirmação.

## 🛠️ Clonando e executando o repositório

```bash
git clone https://github.com/NayaneBatista/mini-asaas.git

cd path-miniasaas

grails run-app
```
