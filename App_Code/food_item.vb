' Author: Keith Smith
' Date: 30 November 2018
' Description: This class file holds information about a food item
' and calculates its caloric value based on three inputs:
'   1. fat grams
'   2. carb grams
'   3. protein grams.

Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic

Public Class food_item
    Private varFatGramsDecimal As Decimal
    Private varCarbGramsDecimal As Decimal
    Private varProteinGramsDecimal As Decimal

    Private Const FAT_GRAMS_TO_CALORIES_Integer As Integer = 9
    Private Const CARB_AND_PROTEIN_GRAMS_TO_CALORIES_Integer As Integer = 4

    Public Sub New(ByVal _FatGrams As Decimal, ByVal _CarbGrams As Decimal, ByVal _ProteinGrams As Decimal)
        FatGrams = _FatGrams
        CarbGrams = _CarbGrams
        ProteinGrams = _ProteinGrams
    End Sub

    Private WriteOnly Property FatGrams As Decimal
        Set(inFat As Decimal)
            If (ValidateFoodInputs(inFat)) Then
                varFatGramsDecimal = inFat
            Else
                Throw New IndexOutOfRangeException("You must enter a value between 0 and 1000 for fat grams.")
            End If
        End Set
    End Property

    Private WriteOnly Property CarbGrams As Decimal
        Set(inCarbs As Decimal)
            If (ValidateFoodInputs(inCarbs)) Then
                varCarbGramsDecimal = inCarbs
            Else
                Throw New IndexOutOfRangeException("You must enter a value between 0 and 1000 for carb grams.")
            End If
        End Set
    End Property

    Private WriteOnly Property ProteinGrams As Decimal
        Set(inProtein As Decimal)
            If (ValidateFoodInputs(inProtein)) Then
                varProteinGramsDecimal = inProtein
            Else
                Throw New IndexOutOfRangeException("You must enter a value between 0 and 1000 for protein grams.")
            End If
        End Set
    End Property

    Private Function ValidateFoodInputs(ByVal inGrams As Decimal) As Boolean
        If (inGrams >= 0D And inGrams <= 1000D) Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function GetTotalCalories() As Decimal
        Dim returnVal As Decimal

        returnVal += varFatGramsDecimal * FAT_GRAMS_TO_CALORIES_Integer
        returnVal += varCarbGramsDecimal * CARB_AND_PROTEIN_GRAMS_TO_CALORIES_Integer
        returnVal += varProteinGramsDecimal * CARB_AND_PROTEIN_GRAMS_TO_CALORIES_Integer

        Return returnVal
    End Function
End Class
