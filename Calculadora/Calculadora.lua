print("Bem-vindo à Calculadora!!")

-- Função para capturar a entrada do usuário e converter para número
function PegarNumero(mensagem)
    io.write(mensagem) -- Exibe a mensagem sem pular linha
    return tonumber(io.read()) -- Lê a entrada do usuário e converte para número
end

-- Função para realizar operações
function Operacoes()
    local continuar = 1  -- Variável para controle do loop

    while continuar == 1 do
        -- Captura os números do usuário
        local Num1 = PegarNumero("Digite o primeiro número: ")
        local Num2 = PegarNumero("Digite o segundo número: ")

        -- Exibe as opções de operação
        print("\nEscolha a operação:")
        print("1 - Somar")
        print("2 - Subtrair")
        print("3 - Multiplicar")
        print("4 - Divisão")

        local Opcao = PegarNumero("Digite o número da operação: ")

        -- Realiza o cálculo baseado na escolha do usuário
        local Resultado
        if Opcao == 1 then
            Resultado = Num1 + Num2
            print("Resultado: " .. Resultado)
        elseif Opcao == 2 then
            Resultado = Num1 - Num2
            print("Resultado: " .. Resultado)
        elseif Opcao == 3 then
            Resultado = Num1 * Num2
            print("Resultado: " .. Resultado)
        elseif Opcao == 4 then
            if Num2 ~= 0 then
                Resultado = Num1 / Num2
                print("Resultado: " .. Resultado)
            else
                print("Erro: Divisão por zero!")
            end
        else
            print("Opção inválida!")
        end

        -- Pergunta se deseja continuar
        continuar = PegarNumero("Deseja continuar? (1-Sim / 0-Não): ")
    end

    print("Saindo da calculadora...")
end

-- Chama a função principal para iniciar a calculadora
Operacoes()