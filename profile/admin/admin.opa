type profilePlayer = string

/** Declaration UserContext **/
players_UserContext = UserContext.make(option(profilePlayer) none)


function init_pseudo(){
    //Resource.html("Change Pseudo",
    <fieldset>
        <legend>config player</legend>
            <input type="text" id="change_pseudo"/>
            <button type="button" onclick={function(_) { change_name() }}>Change pseudo</>
            <div id="test"></div>
    </fieldset>
    }

function change_name(){
    text = Dom.get_value(#change_pseudo)
    #{"test"}=text
    UserContext.change(function (st){some(text)},players_UserContext)
    /* redirection a mettre plus tard
    Client.goto("bomberman") 
    */
}

title = "toto"
Server.start(Server.http, {~title, page:init_pseudo} )

