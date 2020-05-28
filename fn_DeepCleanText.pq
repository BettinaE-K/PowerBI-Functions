let funct=

(TextToClean as text) =>

let 
    TxtClean = Text.Clean(TextToClean),    //remove non-printing chars
    TxtTrim = Text.Trim(TxtClean),    //Clean off the white space at either end
    TxtReplace0 = Text.Replace(TxtTrim,") ,","),"),    //Clean up the extra space after closing parentheses ptI
	TxtReplace1 = Text.Replace(TxtReplace0,") .",")."),    //Clean up the extra space after closing parentheses ptII
	TxtReplace2 = Text.Replace(TxtReplace1," .","."),    //Clean up the extra space before full stops
	TxtReplace3 = Text.Replace(TxtReplace2," ,",","),    //Clean up the extra space before commas
    TxtReplace4 = Text.Replace(TxtReplace3,"  "," "),    //Clean up the white space within the source text
    TxtReplace5 = Text.Replace(TxtReplace4,"  "," "),    //run through it twice to catch triple spaces
    //TxtRemoveChars = Text.Remove(TxtReplace5,{"*","."}),//remove unwanted character
	//TxtProper = Text.Proper(TxtRemoveChars),    //return the whole lot formatted with initial caps
    TxtProper = Text.Proper(TxtReplace5),    //return the whole lot formatted with initial caps
    
    Output = TxtProper
    //If you want to omit the last step, simply redefine output to be TxtReplace5
	//lines 14 & 15 are exemplars for removing an unwanted characters

in
    Output,

    documentation = [
        Documentation.Name = "Deep Clean Text",
        Documentation.Description = "Clean data by removing unwanted characters from the source text, and then tidying the result",
        Documentation.LongDescription = "This function needs only one parameter: the text to clean. The function will remove non-printing characters, clean up white space and return the results in Proper Case.",
        Documentation.Category = "Data Cleansing",
        Documentation.Source = "https://eklarsolutions.co.uk/2020/05/28/github-as-storage/",
        Documentation.Author = "Bettina Ellis-Klar",
        Documentation.Examples = {[Description = "Invoke this function as a new column on the table containing the data to be cleaned & pass the column with the text to be cleaned as the parameter. NOTE: consider using this functon in conjuncton with the 'Bulk Text Replace' function.",
        Code = "Example: ' Lorem ipsum (dolor) , sit amet , consectetur  adipiscing elit . ' returns 'Lorem Ipsum (Dolor), Sit Amet, Consectetur Adipiscing Elit.'",
        Result = " ""-- www.eklar.co.uk -- www.linkedin.com/in/bettinaellisklar "" "]}
    ]
    
in
Value.ReplaceType(funct, Value.ReplaceMetadata(Value.Type(funct),documentation))