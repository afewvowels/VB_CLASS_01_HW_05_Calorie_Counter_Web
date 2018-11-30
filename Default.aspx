<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Homework #5</title>
    <link href="style.css" type="text/css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Quicksand:400,700" rel="stylesheet"> 
</head>
<body>
    <!-- Header, title, author, date information -->
    <header>
        <h1>Homework #5</h1>
        <h3>30 November 2018</h3>
        <p>|</p>
        <h3>Keith Smith</h3>
    </header>
    <!-- This is the main wrapper for the content of this page -->
    <section id="main_section">
        <!-- This form is divided into two fieldsets: 1. Inputs, 2. Results -->
        <form id="main_form" runat="server">
            <!-- 1. Inputs fieldset -->
            <fieldset>
                <legend>Calorie Counter Inputs</legend>
                <span class="input_span">
                    <label class="input_item">Fat</label>
                    <!-- These three items are wrapped together so they can be displayed inline as a flexbox -->
                    <!-- The validators are dynamic so they only appear when triggered -->
                    <span class="input_and_validator_wrapper">
                        <asp:TextBox ID="fat_input" CssClass="text_input_region input_item" runat="server" Placeholder="Enter your fat grams here."></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFatInput" class="input_validator" runat="server" ErrorMessage="Fat grams is a required field" ControlToValidate="fat_input" Display="Dynamic" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="rvFatInput" class="input_validator" runat="server" ErrorMessage="Use numbers between 0 and 1000 for grams of fat." ControlToValidate="fat_input" Display="Dynamic" ForeColor="#CC0000" MaximumValue="1000" MinimumValue="0" Type="Double">*</asp:RangeValidator>
                    </span>
                </span>
                <span class="input_span">
                    <label class="input_item">Carbs</label>
                    <span class="input_and_validator_wrapper">
                        <asp:TextBox ID="carbs_input" CssClass="text_input_region input_item" runat="server" Placeholder="Enter your carb grams here."></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCarbsInput" class="input_validator" runat="server" ErrorMessage="Carb grams is a required field" ControlToValidate="carbs_input" Display="Dynamic" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="rvCarbsInput" class="input_validator" runat="server" ErrorMessage="Use numbers between 0 and 1000 for grams of carbs." ControlToValidate="carbs_input" Display="Dynamic" ForeColor="#CC0000" MaximumValue="1000" MinimumValue="0" Type="Double">*</asp:RangeValidator>
                    </span>
                </span>
                <span class="input_span">
                    <label class="input_item">Protein</label>
                    <span class="input_and_validator_wrapper">
                        <asp:TextBox ID="protein_input" CssClass="text_input_region input_item" runat="server" Placeholder="Enter your protein grams here."></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvProteinInput" class="input_validator" runat="server" ErrorMessage="Protein grams is a required field" ControlToValidate="protein_input" Display="Dynamic" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="rvProteinInput" class="input_validator" runat="server" ErrorMessage="Use numbers between 0 and 1000 for grams of protein." ControlToValidate="protein_input" Display="Dynamic" ForeColor="#CC0000" MaximumValue="1000" MinimumValue="0" Type="Double">*</asp:RangeValidator>
                    </span>
                </span>
                <span id="button_holder" class="input_span">
                    <asp:Button ID="calculate_button" runat="server" Text="Calculate" CssClass="input_button" />
                    <asp:Button ID="clear_button" runat="server" Text="Clear" CssClass="input_button" CausesValidation="false" />
                    <asp:HiddenField ID="total_items_hidden" runat="server" Value="0" />
                    <asp:HiddenField ID="total_calories_hidden" runat="server" Value="0" />
                </span>
            </fieldset>
            <!-- 2. Results fieldset -->
            <fieldset>
                <legend>Calorie Counter Results</legend>
                <span class="input_span">
                    <label class="input_item">Calories of current item</label>
                    <asp:TextBox ID="item_calories" runat="server" Text="Your items calculated calorie value will display here." CssClass="text_input_region input_item"></asp:TextBox>
                </span>
                <!-- This div holds a validation summary -->
                <div id="errors_div">
                    <asp:ValidationSummary ID="vsFatInput" runat="server" DisplayMode="List" ForeColor="#CC0000" />
                </div>
                <span class="input_span">
                    <label class="input_item">Total # of Items</label>
                    <asp:TextBox ID="total_items" runat="server" Text="Running total of number of items will display here." CssClass="text_input_region input_item"></asp:TextBox>
                </span>
                <span class="input_span">
                    <label class="input_item">Total # of Calories</label>
                    <asp:TextBox ID="total_calories" runat="server" Text="Running total of all calories will display here." CssClass="text_input_region input_item"></asp:TextBox>
                </span>
            </fieldset>
        </form>
    </section>
</body>
</html>
