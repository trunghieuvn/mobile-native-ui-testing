package com.hieu.jetpackcompose

import androidx.compose.material.MaterialTheme
import androidx.compose.material.Surface
import androidx.compose.ui.test.hasText
import androidx.compose.ui.test.junit4.createAndroidComposeRule
import androidx.compose.ui.test.junit4.createComposeRule
import androidx.compose.ui.test.onNodeWithText
import androidx.compose.ui.test.performClick
import androidx.test.ext.junit.runners.AndroidJUnit4
import com.hieu.jetpackcompose.ui.theme.JetpackcomposeTheme
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith


@RunWith(AndroidJUnit4::class)
class MainActivityTest {
    @get:Rule
    val composeTestRule = createAndroidComposeRule<MainActivity>()

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
        // When
        composeTestRule.onNodeWithText("Click").performClick()

        // When
        composeTestRule
            .onNode(hasText("World"))
            .assertExists()
    }
}