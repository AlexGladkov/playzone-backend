package ru.playzone.database.games

import org.jetbrains.exposed.sql.Table
import org.jetbrains.exposed.sql.insert
import org.jetbrains.exposed.sql.selectAll
import org.jetbrains.exposed.sql.transactions.transaction
import ru.playzone.database.tokens.TokenDTO
import ru.playzone.database.tokens.Tokens

object Games : Table() {
    private val gameId = Games.varchar(name = "gameId", length = 100)
    private val title = Games.varchar(name = "title", length = 150)
    private val description = Games.varchar(name = "description", length = 500)
    private var version = Games.varchar(name = "version", length = 20)
    private var size = Games.double(name = "size")

    fun insert(gameDTO: GameDTO) {
        transaction {
            Games.insert {
                it[gameId] = gameDTO.gameID
                it[title] = gameDTO.title
                it[description] = gameDTO.description
                it[version] = gameDTO.version
                it[size] = gameDTO.size
            }
        }
    }

    fun fetchAll(): List<GameDTO> {
        return try {
            transaction {
                Games.selectAll().toList()
                    .map {
                        GameDTO(
                            gameID = it[gameId],
                            title = it[title],
                            description = it[description],
                            version = it[version],
                            size = it[size]
                        )
                    }
            }
        } catch (e: Exception) {
            emptyList()
        }
    }
}