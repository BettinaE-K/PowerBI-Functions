let funct=

(ParticipationTypeMask as number) =>

let 
    ParticipationTypeValues = {
        {1, "Sender"},
        {2, "To Recipient"},
        {3, "CC Recipient"},
        {4, "BCC Recipient"},
        {5, "Required Attendee"},
        {6, "Optional Attendee"},
        {7, "Organiser"},
        {8, "Regarding"},
        {9, "Owner"},
        {10, "Resource"},
        {11, "Customer"},
        {ParticipationTypeMask, "ERROR: value does not match an output"}
    },

    ParticipationType = List.First(List.Select(ParticipationTypeValues, each _ {0} = ParticipationTypeMask)) {1},    //simple case statement
    
    
    Output = ParticipationType

in
    Output,

    documentation = [
        Documentation.Name = "Party List Participation Type",
        Documentation.Description = "Determine Participation Type",
        Documentation.LongDescription = "This function needs only one parameter: the column containing the ParticipationTypeMask. The function will return the corresponding string value using a simple Case Statement (function).",
        Documentation.Category = "Data transformation",
        Documentation.Source = "TBC",
        Documentation.Author = "Bettina Ellis-Klar, for Infinity Group",
        Documentation.Examples = {[Description = "Invoke this function as a new column on the table containing the source column",
        Code = "Example: ' Lorem ipsum (dolor) , sit amet , consectetur  adipiscing elit . ' returns 'Lorem Ipsum (Dolor), Sit Amet, Consectetur Adipiscing Elit.'",
        Result = " ""-- www.eklar.co.uk -- www.linkedin.com/in/bettinaellisklar "" "]}
    ]
    
in
Value.ReplaceType(funct, Value.ReplaceMetadata(Value.Type(funct),documentation))
