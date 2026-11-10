set -e
cat > settings.gradle.kts <<'EOF'
pluginManagement { repositories { google(); mavenCentral(); gradlePluginPortal() } }
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories { google(); mavenCentral() }
}
rootProject.name = "GlassLauncher"
include(":app")
EOF
cat > build.gradle.kts <<'EOF'
plugins {
    id("com.android.application") version "8.5.2" apply false
    id("org.jetbrains.kotlin.android") version "1.9.24" apply false
}
EOF
cat > gradle.properties <<'EOF'
android.useAndroidX=true
org.gradle.jvmargs=-Xmx2g
EOF
mkdir -p app
cat > app/build.gradle.kts <<'EOF'
plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
}
android {
    namespace = "com.advance.glasslauncher"
    compileSdk = 34
    defaultConfig {
        applicationId = "com.advance.glasslauncher"
        minSdk = 21
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    kotlinOptions { jvmTarget = "17" }
}
dependencies {
    implementation("androidx.core:core-ktx:1.13.1")
    implementation("androidx.recyclerview:recyclerview:1.3.2")
}
EOF
mkdir -p app/src/main
cat > app/src/main/AndroidManifest.xml <<'EOF'
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-feature android:name="android.software.leanback" android:required="false" />
    <uses-feature android:name="android.hardware.touchscreen" android:required="false" />
    <uses-permission android:name="android.permission.QUERY_ALL_PACKAGES" />

    <application
        android:label="Glass Launcher"
        android:icon="@drawable/ic_launcher"
        android:banner="@drawable/ic_banner"
        android:theme="@style/AppTheme">
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTask"
            android:stateNotNeeded="true"
            android:resumeWhilePausing="true">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.HOME" />
                <category android:name="android.intent.category.DEFAULT" />
                <category android:name="android.intent.category.LEANBACK_LAUNCHER" />
            </intent-filter>
        </activity>
    </application>
</manifest>
EOF
mkdir -p app/src/main/res/values
cat > app/src/main/res/values/styles.xml <<'EOF'
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <style name="AppTheme" parent="android:Theme.Material.NoActionBar">
        <item name="android:windowBackground">@android:color/black</item>
        <item name="android:windowShowWallpaper">false</item>
        <item name="android:windowNoTitle">true</item>
    </style>
</resources>
EOF
mkdir -p app/src/main/res/drawable
cat > app/src/main/res/drawable/bg_main.xml <<'EOF'
<?xml version="1.0" encoding="utf-8"?>
<shape xmlns:android="http://schemas.android.com/apk/res/android" android:shape="rectangle">
    <gradient android:angle="315" android:startColor="#0B1020"
        android:centerColor="#1B1038" android:endColor="#0E2A3F" />
</shape>
EOF
mkdir -p app/src/main/res/drawable
cat > app/src/main/res/drawable/blob_purple.xml <<'EOF'
<?xml version="1.0" encoding="utf-8"?>
<shape xmlns:android="http://schemas.android.com/apk/res/android" android:shape="oval">
    <gradient android:type="radial" android:gradientRadius="260dp"
        android:startColor="#996C63FF" android:endColor="#006C63FF" />
</shape>
EOF
mkdir -p app/src/main/res/drawable
cat > app/src/main/res/drawable/blob_blue.xml <<'EOF'
<?xml version="1.0" encoding="utf-8"?>
<shape xmlns:android="http://schemas.android.com/apk/res/android" android:shape="oval">
    <gradient android:type="radial" android:gradientRadius="310dp"
        android:startColor="#8038BDF8" android:endColor="#0038BDF8" />
</shape>
EOF
mkdir -p app/src/main/res/drawable
cat > app/src/main/res/drawable/glass_card.xml <<'EOF'
<?xml version="1.0" encoding="utf-8"?>
<selector xmlns:android="http://schemas.android.com/apk/res/android">
    <item android:state_focused="true">
        <shape android:shape="rectangle">
            <solid android:color="#4DFFFFFF" />
            <stroke android:width="2dp" android:color="#CCFFFFFF" />
            <corners android:radius="22dp" />
        </shape>
    </item>
    <item>
        <shape android:shape="rectangle">
            <solid android:color="#26FFFFFF" />
            <stroke android:width="1dp" android:color="#33FFFFFF" />
            <corners android:radius="22dp" />
        </shape>
    </item>
</selector>
EOF
mkdir -p app/src/main/res/drawable
cat > app/src/main/res/drawable/ic_launcher.xml <<'EOF'
<?xml version="1.0" encoding="utf-8"?>
<vector xmlns:android="http://schemas.android.com/apk/res/android"
    android:width="96dp" android:height="96dp" android:viewportWidth="96" android:viewportHeight="96">
    <path android:fillColor="#1B1038" android:pathData="M16,0h64a16,16 0,0 1,16 16v64a16,16 0,0 1,-16 16h-64a16,16 0,0 1,-16 -16v-64a16,16 0,0 1,16 -16z" />
    <path android:fillColor="#996C63FF" android:pathData="M48,48m-26,0a26,26 0,1 1,52 0a26,26 0,1 1,-52 0" />
    <path android:fillColor="#66FFFFFF" android:pathData="M30,30h36v36h-36z" />
</vector>
EOF
mkdir -p app/src/main/res/drawable
cat > app/src/main/res/drawable/ic_banner.xml <<'EOF'
<?xml version="1.0" encoding="utf-8"?>
<vector xmlns:android="http://schemas.android.com/apk/res/android"
    android:width="320dp" android:height="180dp" android:viewportWidth="320" android:viewportHeight="180">
    <path android:fillColor="#1B1038" android:pathData="M0,0h320v180h-320z" />
    <path android:fillColor="#996C63FF" android:pathData="M160,90m-60,0a60,60 0,1 1,120 0a60,60 0,1 1,-120 0" />
    <path android:fillColor="#66FFFFFF" android:pathData="M120,60h80v60h-80z" />
</vector>
EOF
mkdir -p app/src/main/res/layout
cat > app/src/main/res/layout/item_app.xml <<'EOF'
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="200dp" android:layout_height="wrap_content"
    android:layout_marginEnd="20dp"
    android:orientation="vertical"
    android:background="@drawable/glass_card"
    android:focusable="true" android:clickable="true"
    android:padding="16dp">
    <ImageView
        android:id="@+id/icon"
        android:layout_width="match_parent" android:layout_height="90dp"
        android:scaleType="fitCenter" />
    <TextView
        android:id="@+id/label"
        android:layout_width="match_parent" android:layout_height="wrap_content"
        android:layout_marginTop="10dp"
        android:gravity="center" android:maxLines="1" android:ellipsize="end"
        android:textColor="#FFFFFF" android:textSize="16sp" />
</LinearLayout>
EOF
mkdir -p app/src/main/res/layout
cat > app/src/main/res/layout/activity_main.xml <<'EOF'
<?xml version="1.0" encoding="utf-8"?>
<FrameLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="@drawable/bg_main">

    <View
        android:layout_width="520dp" android:layout_height="520dp"
        android:layout_gravity="top|end"
        android:layout_marginTop="-160dp" android:layout_marginEnd="-120dp"
        android:background="@drawable/blob_purple" />
    <View
        android:layout_width="620dp" android:layout_height="620dp"
        android:layout_gravity="bottom|start"
        android:layout_marginBottom="-260dp" android:layout_marginStart="-160dp"
        android:background="@drawable/blob_blue" />

    <LinearLayout
        android:layout_width="match_parent" android:layout_height="match_parent"
        android:orientation="vertical"
        android:paddingStart="56dp" android:paddingEnd="56dp"
        android:paddingTop="40dp" android:paddingBottom="40dp">

        <LinearLayout
            android:layout_width="match_parent" android:layout_height="wrap_content"
            android:orientation="horizontal">

            <LinearLayout
                android:layout_width="0dp" android:layout_height="wrap_content"
                android:layout_weight="1" android:orientation="vertical">
                <TextClock
                    android:layout_width="wrap_content" android:layout_height="wrap_content"
                    android:format12Hour="hh:mm" android:format24Hour="HH:mm"
                    android:textColor="#FFFFFF" android:textSize="84sp"
                    android:fontFamily="sans-serif-thin" />
                <TextClock
                    android:layout_width="wrap_content" android:layout_height="wrap_content"
                    android:format12Hour="EEEE, d MMMM" android:format24Hour="EEEE, d MMMM"
                    android:textColor="#B3FFFFFF" android:textSize="20sp"
                    android:fontFamily="sans-serif-light" />
            </LinearLayout>

            <TextView
                android:id="@+id/btnWifi"
                android:layout_width="wrap_content" android:layout_height="wrap_content"
                android:background="@drawable/glass_card"
                android:focusable="true" android:clickable="true"
                android:paddingStart="28dp" android:paddingEnd="28dp"
                android:paddingTop="12dp" android:paddingBottom="12dp"
                android:text="Wi-Fi" android:textColor="#FFFFFF" android:textSize="18sp" />
            <TextView
                android:id="@+id/btnSettings"
                android:layout_width="wrap_content" android:layout_height="wrap_content"
                android:layout_marginStart="16dp"
                android:background="@drawable/glass_card"
                android:focusable="true" android:clickable="true"
                android:paddingStart="28dp" android:paddingEnd="28dp"
                android:paddingTop="12dp" android:paddingBottom="12dp"
                android:text="Settings" android:textColor="#FFFFFF" android:textSize="18sp" />
        </LinearLayout>

        <TextView
            android:id="@+id/greeting"
            android:layout_width="wrap_content" android:layout_height="0dp"
            android:layout_weight="1" android:gravity="center_vertical"
            android:textColor="#FFFFFF" android:textSize="40sp"
            android:fontFamily="sans-serif-light" />

        <TextView
            android:layout_width="wrap_content" android:layout_height="wrap_content"
            android:layout_marginBottom="12dp"
            android:text="Apps" android:textColor="#CCFFFFFF" android:textSize="18sp" />

        <androidx.recyclerview.widget.RecyclerView
            android:id="@+id/apps"
            android:layout_width="match_parent" android:layout_height="wrap_content"
            android:clipChildren="false" android:clipToPadding="false"
            android:paddingTop="16dp" android:paddingBottom="16dp" />
    </LinearLayout>

    <FrameLayout
        android:id="@+id/welcome"
        android:layout_width="match_parent" android:layout_height="match_parent"
        android:focusable="true" android:clickable="true">

        <com.advance.glasslauncher.NightSkyView
            android:layout_width="match_parent" android:layout_height="match_parent" />

        <LinearLayout
            android:layout_width="wrap_content" android:layout_height="wrap_content"
            android:layout_gravity="center" android:orientation="vertical"
            android:gravity="center_horizontal">
            <TextClock
                android:layout_width="wrap_content" android:layout_height="wrap_content"
                android:format12Hour="hh:mm" android:format24Hour="HH:mm"
                android:textColor="#D9FFFFFF" android:textSize="56sp"
                android:fontFamily="sans-serif-thin" />
            <TextView
                android:layout_width="wrap_content" android:layout_height="wrap_content"
                android:layout_marginTop="8dp"
                android:text="Welcome Sir" android:textColor="#FFFFFF" android:textSize="68sp"
                android:fontFamily="sans-serif-light" android:letterSpacing="0.06"
                android:shadowColor="#8038BDF8" android:shadowRadius="24" />
        </LinearLayout>

        <TextView
            android:id="@+id/clickHint"
            android:layout_width="wrap_content" android:layout_height="wrap_content"
            android:layout_gravity="bottom|center_horizontal"
            android:layout_marginBottom="36dp"
            android:text="Click to open" android:textColor="#B3FFFFFF" android:textSize="13sp"
            android:letterSpacing="0.25" android:fontFamily="sans-serif-light" />
    </FrameLayout>
</FrameLayout>
EOF
mkdir -p app/src/main/java/com/advance/glasslauncher
cat > app/src/main/java/com/advance/glasslauncher/NightSkyView.kt <<'EOF'
package com.advance.glasslauncher

import android.animation.ValueAnimator
import android.content.Context
import android.graphics.*
import android.util.AttributeSet
import android.view.View
import android.view.animation.LinearInterpolator
import kotlin.math.sin
import kotlin.random.Random

/** Night wallpaper drawn in code: gradient sky, twinkling stars, crescent moon, hills. */
class NightSkyView @JvmOverloads constructor(c: Context, a: AttributeSet? = null) : View(c, a) {
    private val paint = Paint(Paint.ANTI_ALIAS_FLAG)
    private val n = 200
    private val rnd = Random(7)
    private val sx = FloatArray(n) { rnd.nextFloat() }
    private val sy = FloatArray(n) { rnd.nextFloat() * 0.72f }
    private val sr = FloatArray(n) { 0.6f + rnd.nextFloat() * 1.9f }
    private val sp = FloatArray(n) { rnd.nextFloat() * 6.2832f }
    private var phase = 0f
    private var sky: Shader? = null
    private var glow: Shader? = null
    private val moon = Path()
    private val farHills = Path()
    private val nearHills = Path()
    private var mx = 0f
    private var my = 0f
    private var mr = 0f

    private val anim = ValueAnimator.ofFloat(0f, 6.2832f).apply {
        duration = 4500
        repeatCount = ValueAnimator.INFINITE
        interpolator = LinearInterpolator()
        addUpdateListener { phase = it.animatedValue as Float; invalidate() }
    }

    override fun onAttachedToWindow() { super.onAttachedToWindow(); anim.start() }
    override fun onDetachedFromWindow() { anim.cancel(); super.onDetachedFromWindow() }

    override fun onSizeChanged(w: Int, h: Int, ow: Int, oh: Int) {
        val wf = w.toFloat(); val hf = h.toFloat()
        sky = LinearGradient(0f, 0f, 0f, hf,
            intArrayOf(0xFF01020A.toInt(), 0xFF0A1030.toInt(), 0xFF1A2255.toInt()),
            floatArrayOf(0f, 0.6f, 1f), Shader.TileMode.CLAMP)
        mx = wf * 0.78f; my = hf * 0.22f; mr = hf * 0.07f
        glow = RadialGradient(mx, my, mr * 5, 0x55CFD8FF, 0x00CFD8FF, Shader.TileMode.CLAMP)
        moon.reset()
        moon.addCircle(mx, my, mr, Path.Direction.CW)
        val cut = Path().apply { addCircle(mx + mr * 0.5f, my - mr * 0.1f, mr * 0.88f, Path.Direction.CW) }
        moon.op(cut, Path.Op.DIFFERENCE)
        buildHills(farHills, wf, hf, hf * 0.80f, hf * 0.06f, 1.3f, 0.5f)
        buildHills(nearHills, wf, hf, hf * 0.90f, hf * 0.05f, 2.1f, 2.0f)
    }

    private fun buildHills(p: Path, w: Float, h: Float, base: Float, amp: Float, freq: Float, off: Float) {
        p.reset(); p.moveTo(0f, h)
        val steps = 48
        for (i in 0..steps) {
            val x = w * i / steps
            val y = base - amp * (0.6f * sin(i / steps.toFloat() * 6.2832f * freq + off) +
                0.4f * sin(i / steps.toFloat() * 6.2832f * freq * 2.3f + off * 1.7f))
            p.lineTo(x, y)
        }
        p.lineTo(w, h); p.close()
    }

    override fun onDraw(canvas: Canvas) {
        val w = width.toFloat(); val h = height.toFloat()
        paint.shader = sky; canvas.drawRect(0f, 0f, w, h, paint)
        paint.shader = null
        for (i in 0 until n) {
            val tw = 0.55f + 0.45f * sin(phase + sp[i])
            paint.color = Color.argb((255 * tw * (0.45f + sr[i] / 4f)).toInt().coerceIn(0, 255), 255, 255, 255)
            canvas.drawCircle(sx[i] * w, sy[i] * h, sr[i], paint)
        }
        paint.shader = glow; canvas.drawCircle(mx, my, mr * 5, paint)
        paint.shader = null
        paint.color = 0xFFF4F1E1.toInt(); canvas.drawPath(moon, paint)
        paint.color = 0xFF0C1030.toInt(); canvas.drawPath(farHills, paint)
        paint.color = 0xFF04060F.toInt(); canvas.drawPath(nearHills, paint)
    }
}
EOF
mkdir -p app/src/main/java/com/advance/glasslauncher
cat > app/src/main/java/com/advance/glasslauncher/MainActivity.kt <<'EOF'
package com.advance.glasslauncher

import android.app.Activity
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.graphics.drawable.Drawable
import android.os.Bundle
import android.provider.Settings
import android.view.KeyEvent
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import java.util.Calendar

data class AppItem(val label: String, val icon: Drawable, val launch: Intent)

class MainActivity : Activity() {
    private lateinit var rv: RecyclerView
    private lateinit var welcome: View
    private var welcomeShown = true

    private val screenOn = object : BroadcastReceiver() {
        override fun onReceive(c: Context?, i: Intent?) { showWelcome() }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        window.decorView.systemUiVisibility = View.SYSTEM_UI_FLAG_LAYOUT_STABLE or
            View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN or View.SYSTEM_UI_FLAG_HIDE_NAVIGATION or
            View.SYSTEM_UI_FLAG_FULLSCREEN or View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY

        rv = findViewById(R.id.apps)
        welcome = findViewById(R.id.welcome)
        welcome.setOnClickListener { hideWelcome() }
        welcome.requestFocus()
        val hint = findViewById<View>(R.id.clickHint)
        hint.animate().alpha(0.25f).setDuration(1400).withEndAction(object : Runnable {
            override fun run() {
                val next = if (hint.alpha < 0.5f) 1f else 0.25f
                hint.animate().alpha(next).setDuration(1400).withEndAction(this).start()
            }
        }).start()
        registerReceiver(screenOn, IntentFilter(Intent.ACTION_SCREEN_ON))
        rv.layoutManager = LinearLayoutManager(this, LinearLayoutManager.HORIZONTAL, false)

        findViewById<View>(R.id.btnSettings).setOnClickListener {
            startActivity(Intent(Settings.ACTION_SETTINGS).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK))
        }
        findViewById<View>(R.id.btnWifi).setOnClickListener {
            startActivity(Intent(Settings.ACTION_WIFI_SETTINGS).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK))
        }
    }

    override fun onResume() {
        super.onResume()
        val h = Calendar.getInstance().get(Calendar.HOUR_OF_DAY)
        findViewById<TextView>(R.id.greeting).text = when {
            h < 5 -> "Good night"
            h < 12 -> "Good morning"
            h < 17 -> "Good afternoon"
            else -> "Good evening"
        }
        rv.adapter = AppAdapter(loadApps()) { startActivity(it.launch) }
        if (!welcomeShown) rv.requestFocus()
    }

    private fun showWelcome() {
        welcomeShown = true
        welcome.animate().cancel()
        welcome.alpha = 1f
        welcome.visibility = View.VISIBLE
        welcome.requestFocus()
    }

    private fun hideWelcome() {
        if (!welcomeShown) return
        welcomeShown = false
        welcome.animate().alpha(0f).setDuration(450).withEndAction {
            welcome.visibility = View.GONE
            rv.requestFocus()
        }.start()
    }

    override fun dispatchKeyEvent(e: KeyEvent): Boolean {
        if (welcomeShown) {
            if (e.action == KeyEvent.ACTION_DOWN && (e.keyCode == KeyEvent.KEYCODE_DPAD_CENTER ||
                    e.keyCode == KeyEvent.KEYCODE_ENTER || e.keyCode == KeyEvent.KEYCODE_NUMPAD_ENTER)) {
                hideWelcome()
            }
            return true
        }
        return super.dispatchKeyEvent(e)
    }

    override fun onDestroy() {
        unregisterReceiver(screenOn)
        super.onDestroy()
    }

    @Suppress("OVERRIDE_DEPRECATION")
    override fun onBackPressed() { /* launcher stays on home */ }

    private fun loadApps(): List<AppItem> {
        val pm = packageManager
        val seen = HashSet<String>()
        val out = ArrayList<AppItem>()
        for (cat in listOf(Intent.CATEGORY_LEANBACK_LAUNCHER, Intent.CATEGORY_LAUNCHER)) {
            val q = Intent(Intent.ACTION_MAIN).addCategory(cat)
            for (ri in pm.queryIntentActivities(q, 0)) {
                val pkg = ri.activityInfo.packageName
                if (pkg == packageName || !seen.add(pkg)) continue
                val launch = Intent(Intent.ACTION_MAIN).addCategory(cat)
                    .setClassName(pkg, ri.activityInfo.name)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                val icon = ri.activityInfo.loadBanner(pm) ?: ri.loadIcon(pm)
                out.add(AppItem(ri.loadLabel(pm).toString(), icon, launch))
            }
        }
        return out.sortedBy { it.label.lowercase() }
    }
}

class AppAdapter(
    private val items: List<AppItem>,
    private val onClick: (AppItem) -> Unit
) : RecyclerView.Adapter<AppAdapter.VH>() {

    class VH(v: View) : RecyclerView.ViewHolder(v) {
        val icon: ImageView = v.findViewById(R.id.icon)
        val label: TextView = v.findViewById(R.id.label)
    }

    override fun onCreateViewHolder(p: ViewGroup, t: Int): VH =
        VH(LayoutInflater.from(p.context).inflate(R.layout.item_app, p, false))

    override fun onBindViewHolder(h: VH, i: Int) {
        val item = items[i]
        h.icon.setImageDrawable(item.icon)
        h.label.text = item.label
        h.itemView.setOnClickListener { onClick(item) }
        h.itemView.setOnFocusChangeListener { v, focused ->
            val s = if (focused) 1.12f else 1f
            v.animate().scaleX(s).scaleY(s).setDuration(150).start()
            v.elevation = if (focused) 24f else 0f
        }
    }

    override fun getItemCount() = items.size
}
EOF
