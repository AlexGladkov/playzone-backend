package ru.playzone.features.login

import io.ktor.http.*
import io.ktor.server.application.*
import io.ktor.server.request.*
import io.ktor.server.response.*
import io.ktor.server.routing.*
import ru.playzone.cache.InMemoryCache
import ru.playzone.cache.TokenCache
import ru.playzone.features.register.RegisterReceiveRemote
import java.util.*

fun Application.configureLoginRouting() {

    routing {
        post("/login") {
            val loginController = LoginController(call)
            loginController.performLogin()
        }
    }
}