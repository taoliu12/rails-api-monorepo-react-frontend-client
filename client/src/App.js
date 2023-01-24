import logo from './logo.svg';
import './App.css';
import { useState, useEffect } from 'react'

function App() {
  const [ loggedInUser , setLoggedInUser ] = useState( null )
  console.log( "STATE OF  loggedInUser: ", loggedInUser )  
  
  useEffect(  
    ()=>{

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

  const handleOnChangeForUserToLogin =( sythEvent )=>{
    updateUserToLoginInfo(  { ...userToLogin , [sythEvent.target.name]: sythEvent.target.value }  )
  }

  const handleLoginSubmit =( sythEvent )=>{ 
    sythEvent.preventDefault()
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
        { loggedInUser ?
            <h2>Welcome { loggedInUser.name }! :)</h2> 
            :
            <>
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
              </form>
            </>
        }
      </header>
    </div>
  );
}

export default App;
