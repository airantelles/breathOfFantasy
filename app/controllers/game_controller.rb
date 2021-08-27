class GameController < ApplicationController

    def self.criar_personagem(player)
        if Player.all.size < 2
            player_array = player.split(" ")
            Player.create(name: player_array[0], energy: player_array[1], power: player_array[2])
            puts "#{player_array[0]} com #{player_array[1]} pontos de energia e #{player_array[2]} pontos de poder foi criado!"
            return "Criação de personagem bem sucedida!"
        else
            puts "Número máximo de personagens atingido!"
            return "Para apagar personagens, digite ´Player.limpar_personagens´ e pressione Enter!"
        end
    end

    def self.iniciar
        return "Insira os personagens para iniciar!" if Player.all.size < 2
        player_1 = Player.first
        player_2 = Player.second
        puts "Started!"
        return "Fim!"
    end

end
