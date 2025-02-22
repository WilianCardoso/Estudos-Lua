-- Gera números aleatórios e sempre diferentes
math.randomseed(os.time())

local numeroSecreto = math.random(1, 100)
local tentativas = 0 
local acertou = false

print("Bem-Vindo ao jogo da Advinhação!")
print("Tente advinhar o número entre 1 e 100.")

while not acertou do
io.write("Digite seu palpite: ")
local palpite = tonumber(io.read()) -- Lê a entrada e converte para número
tentativas = tentativas + 1

if not palpite then
    print("Por favor, digite um número válido!")
elseif palpite < numeroSecreto  then
    print("Muito baixo, tente novamente!")
elseif palpite > numeroSecreto then
    print("Muito alto, tente novamente!")
else
    acertou = true
    print("Parabéns você acertou o número em " .. tentativas .. " tentativas.")
end
end