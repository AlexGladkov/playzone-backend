import io.ktor.plugin.features.*

plugins {
    application
    alias(libs.plugins.kotlin.jvm)
    alias(libs.plugins.kotlin.serialization)
    id("io.ktor.plugin") version "2.3.8"
}

group = "ru.playzone"
version = "0.0.1"

application {
    mainClass.set("ru.playzone.ApplicationKt")
}

ktor {
    docker {
        jreVersion.set(JavaVersion.VERSION_21)
        localImageName.set("playzone-docker-image")
        imageTag.set("0.0.1-preview")

        portMappings.set(
            listOf(
                DockerPortMapping(outsideDocker = 80, insideDocker = 8080, DockerPortMappingProtocol.TCP)
            )
        )
    }

    fatJar {
        archiveFileName.set("fat.jar")
    }
}

repositories {
    mavenCentral()
    maven { url = uri("https://maven.pkg.jetbrains.space/public/p/ktor/eap") }
}

dependencies {
    implementation(libs.ktor.server.core)
    implementation(libs.ktor.server.cio)
    implementation(libs.ktor.server.content)
    implementation(libs.ktor.server.kotlinx)
    implementation(libs.ktor.server.netty)

    implementation(libs.exposed.core)
    implementation(libs.exposed.dao)
    implementation(libs.exposed.jdbc)

    implementation(libs.postgress)
    implementation(libs.hikari)

    implementation(libs.logback)
    testImplementation(libs.ktor.server.tests)
    testImplementation(libs.kotlin.tests)
}

tasks.create("stage") {
    dependsOn("installDist")
}