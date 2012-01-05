
/** Declaration UserContext **/
players_UserContext = UserContext.make(option(profile_Player) none)
image = [1,2,3]

function init_pseudo(){
    //Resource.html("Change Pseudo",
    <fieldset>
        <legend>config player</legend>
            <input type="text" id="change_pseudo"/>
            <button type="button" onclick={function(_) { change_name() }}>Change pseudo</>
            <div id="test"></div>
    </fieldset>
    }

function get_image()
{
    2
}

function change_name(){
    name = Dom.get_value(#change_pseudo)
    //#{"test"}=text
    image = get_image()
    UserContext.change(function (st){some(name)},players_UserContext)
    /* redirection a mettre plus tard
    Client.goto("bomberman") 
    */
}

title = "toto"
Server.start(Server.http, {~title, page:init_pseudo} )

