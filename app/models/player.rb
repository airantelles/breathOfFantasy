class Player < ApplicationRecord
    def self.limpar_personagens
        Player.destroy_all
        return "Personagens excluidos com sucesso!"
    end
end
