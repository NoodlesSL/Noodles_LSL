// Sript responds to a phrase if said within a certain distance.
// In the Example it responds to "Hello There" with "General DISPLAYNAME-obi"
// Selphie Wirefly

integer listen_handle;
// Phrase to listen for  should be all lower case.
string trigger_word = "hello there";
// Distance to respond, otherwise ignore it
float respond_distance = 3;

default
{
    state_entry()
    {  
        listen_handle = llListen(0, "", llGetOwner(), "");
    }
 
    listen( integer channel, string name, key id, string message )
    {
        // See if the trigger word was said
        if(llSubStringIndex(llToLower(message), trigger_word) > -1)
        {
        // Get Positions of Speaker and Listerner Object
        vector speaker_pos = llList2Vector(llGetObjectDetails(id,[OBJECT_POS]),0);
        vector listener_pos = llGetPos();
        
        // If Distance between the two is less than the desired distance, respond some way
        if(llVecDist(listener_pos, speaker_pos) < respond_distance)
        {        
            string display_name=llGetDisplayName(id);
            llSay(0, "General "+display_name+"Obi");
            // The response here is a dumb Star Wars meme.  "Hello There" .... "General Kenobi"
        }
        }

    }
}
