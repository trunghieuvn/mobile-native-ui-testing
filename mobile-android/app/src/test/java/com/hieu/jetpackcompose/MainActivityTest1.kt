package com.hieu.jetpackcompose

import androidx.compose.material.MaterialTheme
import androidx.compose.material.Surface
import androidx.compose.ui.test.hasText
import androidx.compose.ui.test.junit4.createComposeRule
import androidx.compose.ui.test.onNodeWithText
import androidx.compose.ui.test.performClick
import com.hieu.jetpackcompose.ui.theme.JetpackcomposeTheme
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner

@RunWith(RobolectricTestRunner::class)
class MainActivityTest1 {
    @get:Rule
    val composeTestRule = createComposeRule()

    @Before
    fun setUp() {
        composeTestRule.setContent {
            JetpackcomposeTheme {
                // A surface container using the 'background' color from the theme
                Surface(color = MaterialTheme.colors.background) {
                    Greeting()
                }
            }
        }
    }

    @Test
    fun test_renderSuccess () {
        // Given
        // When

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

        composeTestRule.onNodeWithText("Click").performClick()
        composeTestRule
            .onNode(hasText("World"))
            .assertExists()
    }
}