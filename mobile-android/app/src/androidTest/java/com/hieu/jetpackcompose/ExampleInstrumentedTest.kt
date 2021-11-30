package com.hieu.jetpackcompose

import androidx.compose.material.MaterialTheme
import androidx.compose.material.Surface
import androidx.compose.ui.test.hasText
import androidx.compose.ui.test.junit4.createComposeRule
import androidx.compose.ui.test.onNodeWithText
import androidx.compose.ui.test.performClick
import androidx.test.ext.junit.runners.AndroidJUnit4
import androidx.test.platform.app.InstrumentationRegistry
import com.hieu.jetpackcompose.ui.theme.JetpackcomposeTheme
import org.junit.Assert.assertEquals
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith

/**
 * Instrumented test, which will execute on an Android device.
 *
 * See [testing documentation](http://d.android.com/tools/testing).
 */
@RunWith(AndroidJUnit4::class)
class ExampleInstrumentedTest {
    @get:Rule
    val composeTestRule = createComposeRule()

    @Test
    fun useAppContext() {
        // Context of the app under test.
        val appContext = InstrumentationRegistry.getInstrumentation().targetContext
        assertEquals("com.hieu.jetpackcompose", appContext.packageName)
    }

    @Test
    fun exampleTest() {

    }

    @Test
    fun test_renderSuccess () {
        // Given

        // When
        composeTestRule.setContent {
            JetpackcomposeTheme {
                // A surface container using the 'background' color from the theme
                Surface(color = MaterialTheme.colors.background) {
                    Greeting()
                }
            }
        }

        // Then
        composeTestRule
            .onNode(hasText("Hello"))
            .assertExists()
        composeTestRule
            .onNode(hasText("World"))
            .assertDoesNotExist()
    }

    @Test
    fun test_Click () {
        // Given
        composeTestRule.setContent {
            JetpackcomposeTheme {
                // A surface container using the 'background' color from the theme
                Surface(color = MaterialTheme.colors.background) {
                    Greeting()
                }
            }
        }
        composeTestRule.onNodeWithText("Click").performClick()
        composeTestRule
            .onNode(hasText("World"))
            .assertExists()
    }
}