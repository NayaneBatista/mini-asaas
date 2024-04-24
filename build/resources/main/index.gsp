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
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
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
            width: 100%;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Cadastro de Cliente 📝</h2>
        <form id="cadastroForm">
            <div class="form-group">
                <label for="nome">Nome Completo:</label>
                <input type="text" id="nome" name="nome" required placeholder="Digite seu nome completo">
            </div>
            <div class="form-group">
                <label for="cpf">CPF:</label>
                <input type="text" id="cpf" name="cpf" required pattern="\d{3}\.\d{3}\.\d{3}-\d{2}" maxlength="14" placeholder="Ex: 123.456.789-00">
            </div>
            <div class="form-group">
                <label for="endereco">Endereço:</label>
                <input type="text" id="endereco" name="endereco" required placeholder="Digite seu endereço">
            </div>
            <div class="form-group">
                <label for="telefone">Telefone:</label>
                <input type="tel" id="telefone" name="telefone" required pattern="\(\d{2}\)\s\d{5}-\d{4}" maxlength="15" placeholder="Ex: (99) 12345-6789">
            </div>
            <div class="form-group">
                <label for="cep">CEP:</label>
                <input type="text" id="cep" name="cep" required pattern="\d{5}-\d{3}" maxlength="9" placeholder="Ex: 12345-678">
            </div>
            <button type="submit">Enviar</button>
        </form>
    </div>
    <script>
        document.getElementById('cadastroForm').addEventListener('submit', function(event) {
            event.preventDefault(); // Prevent form submission

            // Retrieve form data
            const formData = new FormData(event.target);
            const formObject = {};
            formData.forEach((value, key) => {
                formObject[key] = value;
            });

            // Print form data to console
            console.log('Formulário enviado com sucesso:');
            console.log(formObject);

            // Display success message
            alert('Formulário enviado com sucesso!');
        });

        // Function to fetch address data from ViaCEP API
        function fetchAddressData(cep) {
            fetch(`https://viacep.com.br/ws/${cep}/json/`)
                .then(response => response.json())
                .then(data => {
                    document.getElementById('endereco').value = data.logradouro;
                })
                .catch(error => console.error('Erro ao obter dados do endereço:', error));
        }

        // Event listener for CEP input
document.getElementById('cep').addEventListener('change', function(event) {
    const cep = event.target.value.replace(/\D/g, ''); // Remove non-numeric characters
    if (cep.length === 8) {
        fetch(`http://localhost:8080/cepController/buscarEnderecoPorCep?cep=${cep}`)
            .then(response => response.json())
            .then(data => {
                document.getElementById('endereco').value = data.logradouro || '';
            })
            .catch(error => console.error('Erro ao obter dados do endereço:', error));
    } else {
        console.error('CEP inválido');
    }
});
     
    </script>
</body>
</html>