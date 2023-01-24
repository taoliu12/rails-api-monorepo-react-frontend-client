import logo from './logo.svg';
import './App.css';


import { useState, useEffect } from 'react'




function App() {


  const [ loggedInUser , setLoggedInUser ] = useState( null )
  console.log( "STATE OF  loggedInUser: ", loggedInUser )  //
  //// const [ currentUser , setCurrentUser ] = useState( null )
  
  useEffect(  
    ()=>{

      // console.log("👀 BYEBUG!!!!")  //

      fetch( "/userInSession" )
      .then( r => r.json() )
      .then( userAlreadyLoggedIn => { 
        
        setLoggedInUser(userAlreadyLoggedIn) 
    
      
      })
      // .then( setLoggedInUser )
      // .then( console.log )

    }
    , []
  )


  



  const [ userToLogin , updateUserToLoginInfo ] = useState(

    {

      username: "",
      password: ""

    }

  )
  console.log( "STATE OF  userToLogin: ", userToLogin )  //





  const handleOnChangeForUserToLogin =( sythEvent )=>{

    console.log( sythEvent ) //

    updateUserToLoginInfo(  { ...userToLogin , [sythEvent.target.name]: sythEvent.target.value }  )

    //// sythEvent.target.name == the name property of the input field being typed in
    //// sythEvent.target.value == what is being typed in that input field

  }

  const handleLoginSubmit =( sythEvent )=>{ 
    sythEvent.preventDefault()

      console.log("👀 BYEBUG!!!!")  //

    fetch( "/login", 
      {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify( {user: userToLogin} )

      } 
    )
    .then( r => r.json() )
    .then( hopefullyAUser => { 
      
      console.log(hopefullyAUser)  //


      setLoggedInUser( hopefullyAUser )
    
  
    })
  }

  const handleLogout =()=>{
    fetch(  "/logout" , { method: "DELETE" }  )
    .then( r => r.json() )
    .then( deleteResponse =>{

      //// Pesimistic Rendering 
        setLoggedInUser( null )
      //// Pesimistic Rendering 


    })
  }

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        {

          loggedInUser ?
                    
            <h2>Welcome { loggedInUser.name }! :)</h2> 

          :
          (<>
          
            <h1>Welcome! Login?</h1>

            <form onSubmit={ handleLoginSubmit } >

                <label>username</label>
                <input 
                
                  onChange={ handleOnChangeForUserToLogin } 
                  name="username"
                
                />
      
                <label>password</label>
                <input type="password"

                  onChange={ handleOnChangeForUserToLogin } 
                  name="password"

                />


              <input type="submit" />
              {/* <button type="submit" /> */}


            </form>
          
          </>)  
          // False Case

        }
      </header>
    </div>
  );
}

export default App;
