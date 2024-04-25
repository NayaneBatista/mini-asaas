<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastre-se</title>
    <link rel="icon" type="image/png" href="${resource(dir: 'images', file: 'asiinha.png')}">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 400px;
            margin: 40px auto;
            padding: 20px;
            padding-top: 10px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 7px;
        }

        p {
            color: #999;
            font-size: 0.690em;
            text-align: center;
            margin-bottom: 21px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        input[type="text"], input[type="tel"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="text"]:focus, input[type="tel"]:focus {
            outline: none;
            border-color: #007bff;
        }

        input[type="text"]::placeholder, input[type="tel"]::placeholder {
            color: #999;
        }

        button {
            display: block;
            width: 40%;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.4s ease;
            margin: 0 auto;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
        function limpa_formulario_cep() {
            document.getElementById('rua').value = "";
            document.getElementById('bairro').value = "";
            document.getElementById('cidade').value = "";
        }

        function meu_callback(conteudo) {
            if (!("erro" in conteudo)) {
                document.getElementById('rua').value = conteudo.logradouro;
                document.getElementById('bairro').value = conteudo.bairro;
                document.getElementById('cidade').value = conteudo.localidade;
            } else {
                limpa_formulario_cep();
                alert("CEP não encontrado.");
            }
        }

        function pesquisar_cep(valor) {
            var cep = valor.replace(/\D/g, '');

            if (cep != "") {
                var validacep = /^[0-9]{8}$/;

                if (validacep.test(cep)) {
                    document.getElementById('rua').value = "...";
                    document.getElementById('bairro').value = "...";
                    document.getElementById('cidade').value = "...";

                    var script = document.createElement('script');
                    script.src = 'https://viacep.com.br/ws/' + cep + '/json/?callback=meu_callback';
                    document.body.appendChild(script);
                } else {
                    limpa_formulario_cep();
                    alert("Formato de CEP inválido.");
                }
            } else {
                limpa_formulario_cep();
            }
        };
    </script>
</head>

<body>
<div class="container">
    <h2>Cadastro de Cliente 📝</h2>
    <p>Todos os campos são obrigatórios!</p>
    <form class="formulario" method="post" action="${createLink(controller: 'cadastro', action:'enviar')}">
        <div class="form-group">
                <label for="nome">Nome Completo:</label>
                <input type="text" id="nome" name="nome" required placeholder="Digite seu nome completo">
            </div>
            <div class="form-group">
                <label for="cpf">CPF:</label>
                <input type="text" id="cpf" name="cpf" maxlength="11" required placeholder="Digite sem pontuações ou hífen">
            </div>
            <div class="form-group">
                <label for="telefone">Telefone:</label>
                <input type="tel" id="telefone" name="telefone" maxlength="15" required placeholder="Ex: 99 12345-6789">
            </div>
        <div class="form-group">
            <label for="cep">CEP:</label>
            <input name="cep" type="text" id="cep" value="" maxlength="9" required placeholder="Ex: 12345678" onblur="pesquisar_cep(this.value);">
        </div>
        <div class="form-group">
            <label for="rua">Logradouro:</label>
            <input name="rua" type="text" id="rua" size="60" required placeholder="Digite seu logradouro">
        </div>
        <div class="form-group">
                <label for="numero">Número:</label>
                <input type="text" id="numero" name="numero" required placeholder="Caso não tenha, digite S/N no campo">
            </div>
        <div class="form-group">
            <label for="bairro">Bairro:</label>
            <input name="bairro" type="text" id="bairro" size="40" required placeholder="Digite seu bairro">
        </div>
        <div class="form-group">
            <label for="cidade">Cidade:</label>
            <input name="cidade" type="text" id="cidade" size="40" required placeholder="Digite sua cidade">
        </div>
        <button type="submit">Enviar 🤍</button>
    </form>
</div>
</body>
</html>