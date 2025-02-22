-- Gera números aleatórios e sempre diferentes
math.randomseed(os.time())

function LimparConsole()
        os.execute("cls")
end

function PegarNumero(mensagem)
    io.write(mensagem) 
    return tonumber(io.read()) 
end

print("|   Bem-Vindo ao Jogo da Adivinhacao!!  |")
print("|         Niveis de dificuldade         |")
print("|   1 - Fácil (1 a 50, 10 tentativas)   |")
print("|   2 - Médio (1 a 100, 7 tentativas)   |")
print("|   3 - Difícil (1 a 500, 5 tentativas) |")

local dificuldade = PegarNumero("Escolha a dificuldade: ")

-- Definição dos parametros por nivel de dificuldade
local maxTentativas, limite

if dificuldade == 1 then
    limite = 50
    maxTentativas = 10
elseif dificuldade == 2 then
    limite = 100
    maxTentativas = 7
elseif dificuldade == 3 then
    limite = 500
    maxTentativas = 5
else
    print("Dificuldade inválida! Usando nível médio.")
    limite = 100
    maxTentativas = 7
end

-- Modo de jogo: Singleplayer ou Multiplayer
print("\nEscolha o modo de jogo:")
print("1 - Singleplayer")
print("2 - Multiplayer (2 jogadores)")

local modo = PegarNumero("Digite o número do modo de jogo: ")

function Jogar(numeroSecreto, tentativasRestantes)
    while tentativasRestantes > 0 do
        local palpite = PegarNumero("Digite seu palpite: ")

        if not palpite then
            print("Digite um valor válido!")
        elseif palpite < numeroSecreto then
            print("Numero muito baixo, tentativas restantes: " .. (tentativasRestantes-1) )
            elseif palpite > numeroSecreto then
                print("Numero muito alto, tentativas restantes: " .. (tentativasRestantes -1))
            else
                print("Parabens você acertou o numero secreto!!")
                return true
        end
        tentativasRestantes = tentativasRestantes -1
    end
    print("\nVocê perdeu! O número era " .. numeroSecreto)
    return false
end
-- Lógica para singleplayer
if modo == 1 then
    local numeroSecreto = math.random(1, limite)
    print("\nO número foi escolhido entre 1 e " .. limite .. ". Boa sorte!")
    Jogar(numeroSecreto, maxTentativas)

-- Lógica para multiplayer
elseif modo == 2 then
    print("\nModo Multiplayer Ativado!")
    io.write("\nJogador 1, digite um número secreto para o Jogador 2 adivinhar: ")
    local numeroSecreto1 = tonumber(io.read())
    LimparConsole()
    print("\nAgora o Jogador 2 tenta adivinhar...")
    local jogador1Venceu = Jogar(numeroSecreto1, maxTentativas)

    io.write("\nJogador 2, digite um número secreto para o Jogador 1 adivinhar: ")
    local numeroSecreto2 = tonumber(io.read())
    LimparConsole()
    print("\nAgora o Jogador 1 tenta adivinhar...")
    local jogador2Venceu = Jogar(numeroSecreto2, maxTentativas)

    if jogador1Venceu and not jogador2Venceu then
        print("\nJogador 1 venceu!")
    elseif jogador2Venceu and not jogador1Venceu then
        print("\nJogador 2 venceu!")
    elseif jogador1Venceu and jogador2Venceu then
        print("\nEmpate! Ambos acertaram.")
    else
        print("\nNenhum jogador acertou. Jogo empatado!")
    end
else
    print("Modo inválido! Rodando singleplayer por padrão.")
    local numeroSecreto = math.random(1, limite)
    Jogar(numeroSecreto, maxTentativas)
end