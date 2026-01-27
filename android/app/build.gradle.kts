plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.farming_motor_app"
    compileSdk = flutter.compileSdkVersion

    defaultConfig {
        applicationId = "com.example.farming_motor_app"
        minSdk = flutter.minSdkVersion
        targetSdk = 36
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    compileOptions {
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }


    kotlinOptions {
        jvmTarget = "17"   // ✅ string, not char
    }

    sourceSets {
        getByName("main") {
            java.srcDir("src/main/kotlin")
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
dependencies {
    // Agar manually add karna ho (waise Flutter automatically handle karta hai)
    implementation("androidx.work:work-runtime-ktx:2.9.0")
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.5")
}
