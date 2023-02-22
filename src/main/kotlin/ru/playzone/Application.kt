package ru.playzone

import io.ktor.server.application.*
import io.ktor.server.engine.*
import io.ktor.server.netty.*
import org.jetbrains.exposed.sql.Database
import ru.playzone.features.games.configureGameRouting
import ru.playzone.features.login.configureLoginRouting
import ru.playzone.features.register.configureRegisterRouting
import ru.playzone.plugins.configureRouting
import ru.playzone.plugins.configureSerialization

fun main() {
    Database.connect(
        url = System.getenv("DATABASE_CONNECTION_STRING"),
        driver = "org.postgresql.Driver",
        user = System.getenv("POSTGRES_USER"),
        password = System.getenv("POSTGRES_PASSWORD")
    )

    embeddedServer(
        Netty,
        port = System.getenv("SERVER_PORT").toInt(),
        module = Application::playzoneModule
    ).start(wait = true)
}

fun Application.playzoneModule() {
    configureRouting()
    configureLoginRouting()
    configureRegisterRouting()
    configureGameRouting()
    configureSerialization()
}
