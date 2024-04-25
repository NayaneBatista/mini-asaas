package miniasaas

class CadastroController {

    def index() { }

    def enviar() {
        def nome = params.nome;
        def cpf = params.cpf;
        def telefone = params.telefone;
        def cep = params.cep;
        def rua = params.rua;
        def numero = params.numero;
        def bairro = params.bairro;
        def cidade = params.cidade;

        println "Nome: $nome";
        println "CPF: $cpf";
        println "Telefone: $telefone";
        println "CEP: $cep";
        println "Logradouro: $rua";
        println "Número: $numero";
        println "Bairro: $bairro";
        println "Cidade: $cidade";
        println "Formulário enviado com sucesso!";
        
        redirect(action: "index")
    }
}