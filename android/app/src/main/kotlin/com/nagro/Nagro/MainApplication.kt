package com.nagro.Nagro

import androidx.multidex.MultiDex
import io.flutter.app.FlutterApplication
import android.content.Context

class MainApplication : FlutterApplication() {
    override fun attachBaseContext(base: Context) {
        super.attachBaseContext(base)
        MultiDex.install(this)
    }
} 