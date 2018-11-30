' Author: Keith
' Date: 30 November 2018
' Description: This file holds the logic for the main web form
Partial Class _Default
    Inherits System.Web.UI.Page

    ' Aggregator variables
    Private TotalItemsInteger As Integer
    Private TotalCaloriesDecimal As Decimal

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        ' If the page has been reloaded, pull the aggregator values and place
        ' them into variables for use by the program
        If Page.IsPostBack Then
            TotalItemsInteger = Convert.ToInt32(total_items_hidden.Value)
            TotalCaloriesDecimal = Convert.ToDecimal(total_calories_hidden.Value)
        End If
    End Sub

    Protected Sub calculate_button_Click(sender As Object, e As EventArgs) Handles calculate_button.Click
        ' Create temporary variables to hold converted textbox contents
        ' No need for try/catch block since we have range validators
        ' to make sure we're getting good data
        Dim TempFatGrams As Decimal = Convert.ToDecimal(fat_input.Text)
        Dim TempCarbGrams As Decimal = Convert.ToDecimal(carbs_input.Text)
        Dim TempProteinGrams As Decimal = Convert.ToDecimal(protein_input.Text)

        ' Create a new food item using the temporary variables created above for clarity in this statement
        Dim FoodItem As New food_item(TempFatGrams, TempCarbGrams, TempProteinGrams)

        ' Increment the total items aggregator...
        TotalItemsInteger += 1
        ' ...and add this food items total calories to the calorie aggregator
        TotalCaloriesDecimal += FoodItem.GetTotalCalories

        ' Update the aggregator values in their respective hidden fields
        total_items_hidden.Value = TotalItemsInteger.ToString
        total_calories_hidden.Value = TotalCaloriesDecimal.ToString

        ' Finally display these calculated values to the user
        item_calories.Text = FoodItem.GetTotalCalories.ToString
        total_items.Text = TotalItemsInteger.ToString
        total_calories.Text = TotalCaloriesDecimal.ToString

        ' Once everything is calculated and the results fields are populated,
        ' clear the entry textbox fields so entry of next food item values
        ' is simplified
        ResetFields()
    End Sub

    Private Sub clear_button_Click(sender As Object, e As EventArgs) Handles clear_button.Click
        ' Clear the fat/carb/protein gram textbox entry fields
        ResetFields()

        ' Also clear out last calculated food item's caloric value
        item_calories.Text = ""
    End Sub

    Private Sub ResetFields()
        ' Clears the input textboxes, used on both button click events (calculate & clear)
        fat_input.Text = ""
        carbs_input.Text = ""
        protein_input.Text = ""
    End Sub
End Class
