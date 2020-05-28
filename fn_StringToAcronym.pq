let funct=

(SourceText as any) =>

let 

	TextClean = Text.Clean(SourceText), //remove non-printing chars
	TextTrim = Text.Trim(TextClean), //Clean off the white space at either end
	TextRemove1 = Text.Remove(TextTrim, {"'"}), //remove apostrophes
	TextProper = Text.Proper(TextRemove1), //Capitialise each word
	TextReplace1 = Text.Replace(TextProper, " And ", " "), //remove 'And'
	TextRemove2 = Text.Remove(TextReplace1, {"a".."z","0".."9","(",")",",",".","-","&","£"}), //remove l.c. and numerals etc
	TextReplace2 = Text.Replace(TextRemove2, "  ", " "), //remove double spaces: this step may need to be run multiple times

	Output = TextReplace2

in
    Output,

    documentation = [
        Documentation.Name = "String to Acronym",
        Documentation.Description = "Return a capitalised acronym for the text string in a colum, such as Company Name.",
        Documentation.LongDescription = "This function requires one parameter: the source text to be transformed",
        Documentation.Category = "Data Transformation",
        Documentation.Source = "https://eklarsolutions.co.uk/2020/02/14/more-on-m/",
        Documentation.Author = "Bettina Ellis-Klar",
        Documentation.Examples = {[Description = "Invoke this function as a new column on the table containing the data to be transformed & pass the column with the text to be transformed as the parameter. NOTE: consider using this functon in conjuncton with the 'Deep Clean Text' function.",
        Code = "Example: 'Sed, vitae & eleifend Ltd' returns 'S V E L'",
        Result = " "" -- www.eklar.co.uk -- www.linkedin.com/in/bettinaellisklar "" "]}
    ]
    
in
Value.ReplaceType(funct, Value.ReplaceMetadata(Value.Type(funct),documentation))