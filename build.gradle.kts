plugins {
    // kotlin("jvm") version "1.3.31" // automatically applied
    // idea // automatically applied
    id("voodoo") version "0.4.8-SNAPSHOT"
}

voodoo {
    addTask(name = "build", parameters = listOf("build"))
    addTask(name = "pack_sk", parameters = listOf("pack sk"))
    addTask(name = "pack_mmc", parameters = listOf("pack mmc"))
    addTask(name = "pack_mmc-static", parameters = listOf("pack mmc-static"))
    addTask(name = "pack_mmc-fat", parameters = listOf("pack mmc-fat"))
    addTask(name = "pack_server", parameters = listOf("pack server"))
    addTask(name = "pack_curse", parameters = listOf("pack curse"))
    addTask(name = "test_mmc", parameters = listOf("test mmc"))
    addTask(name = "buildAndPackAll", parameters = listOf("build", "pack sk", "pack server", "pack mmc"))
}

repositories {
    maven(url = "http://maven.modmuss50.me/") {
        name = "modmuss50"
    }
    maven(url = "https://kotlin.bintray.com/kotlinx") {
        name = "kotlinx"
    }
    mavenCentral()
    jcenter()
}

dependencies {
    implementation(group = "moe.nikky.voodoo", name = "voodoo", version = "0.4.8+")
    implementation(group = "moe.nikky.voodoo", name = "dsl", version = "0.4.8+")
}