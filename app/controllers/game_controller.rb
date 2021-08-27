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
        game_in_progress = true
        play_round = 1
        begin
            if play_round.odd?
                self.atacar(player_1, player_2)
            else
                self.atacar(player_2, player_1)
            end
            game_in_progress = false if player_1.energy <= 0 or player_2.energy <= 0
            # puts game_in_progress
            player_winner = player_1 if player_1.energy > 0
            player_winner = player_2 if player_2.energy > 0
            play_round += 1
        end while game_in_progress
        return "O jogo acabou, o vencedor foi #{player_winner.name} com HP restante de #{player_winner.energy}"
    end

    def self.atacar(attacker, defender)
        sort = rand(100)
        puts ""
        if sort >= 0 and sort <= 15
            puts "#{attacker.name} atacou #{defender.name}"
            puts "** Errou - 0 HP **"
        elsif sort >= 16 and sort <= 70
            damage = attacker.power/3
            defender.energy = defender.energy - damage
            puts "#{attacker.name} atacou #{defender.name}"
            puts "** Normal - #{damage} HP **"
        elsif sort >= 71 and sort <= 96
            damage = attacker.power + (attacker.power * 0.2)
            defender.energy = defender.energy - damage
            puts "#{attacker.name} atacou #{defender.name}"
            puts "** Sorte - #{damage} HP **"
        elsif sort >= 97 and sort <= 100
            damage = attacker.power * 2
            defender.energy = defender.energy - damage
            puts "#{attacker.name} atacou #{defender.name}"
            puts "** Crítico - #{damage} HP **"
        end
        puts ""
    end

end
