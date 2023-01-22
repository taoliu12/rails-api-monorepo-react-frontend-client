import logo from './logo.svg';
import './App.css';


import { useState, useEffect } from 'react'




function App() {


  const [ loggedInUser , setLoggedInUser ] = useState( null )
  console.log( "STATE OF  loggedInUser: ", loggedInUser )  //
  //// const [ currentUser , setCurrentUser ] = useState( null )
  
    const [ loggedInUserWooblies , setLoggedInUserWooblies ] = useState( [] )
    console.log( "STATE OF  loggedInUserWooblies: ", loggedInUserWooblies )  //

    // const [ allOfTheWooblies , setAllOfTheWooblies ] = useState( [] )
    // console.log( "STATE OF  allOfTheWooblies: ", allOfTheWooblies )  //


  const [ allTheSnacksOnEarth , setAllTheSnacksOnEarth ] = useState( [] )
  console.log( "STATE OF  allTheSnacksOnEarth: ", allTheSnacksOnEarth )  //




  useEffect(  
    ()=>{

      // console.log("👀 BYEBUG!!!!")  //

      fetch( "/userInSession" )
      .then( r => r.json() )
      .then( userAlreadyLoggedIn => { 
        
        setLoggedInUser(userAlreadyLoggedIn) 
        setLoggedInUserWooblies(userAlreadyLoggedIn.my_wooblies)
      
      })
      // .then( setLoggedInUser )
      // .then( console.log )



      fetch( "/snacks" )
      .then( r => r.json() )
      .then( setAllTheSnacksOnEarth )




      // fetch( "/wooblies" )
      // .then( r => r.json() )
      // .then( setAllOfTheWooblies )



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
        body: JSON.stringify( userToLogin )

      } 
    )
    .then( r => r.json() )
    .then( hopefullyAUser => { 
      
      console.log(hopefullyAUser)  //


      setLoggedInUser( hopefullyAUser )
      setLoggedInUserWooblies(hopefullyAUser.my_wooblies)
    
    
    })
    // .then( console.log )  //


  }

  const handleLogout =()=>{

    fetch(  "/logout" , { method: "DELETE" }  )
    .then( r => r.json() )
    .then( deleteResponse =>{

      //// Pesimistic Rendering 
        setLoggedInUser( null )

        setLoggedInUserWooblies( [] )
      //// Pesimistic Rendering 


    })

    // //// Optimistic Rendering 
    //   setLoggedInUser( null )

    //   setLoggedInUserWooblies( [] )
    // //// Optimistic Rendering 

  }



  // const userWoobliesToRender = allOfTheWooblies.filter( ( eachWoobly )=>{

  //   if(eachWoobly.user_id == loggedInUser.id){

  //     return eachWoobly

  //   }

  // })




  const [ newWoobly , upDateNewWooblyInfo ] = useState( 
    {

      name: ""

    } 
  )
  console.log( "STATE OF  newWoobly: ", newWoobly )  //



  const changeHandlerNewWooblyName =( sythEvent )=>{

    upDateNewWooblyInfo( { ...newWoobly, name: sythEvent.target.value } )

  }

  const submitHandlerForNewWoobly =( sythEvent )=>{

    sythEvent.preventDefault()

    console.log("!!!! BYEBUG !!!!")

    console.log(loggedInUser)  //

    fetch( "/wooblies" , 
      {
        method: "POST",
        headers: { "Content-Type": "Application/json" },
        body: JSON.stringify( newWoobly )

        //// Frontend Approach
        // body: JSON.stringify( {...newWoobly , user_id: loggedInUser.id } )

      } 
    )
    .then( r => r.json() )
    .then( newWooblyFromTheBackend =>{

      ////////  Fetching a Fresh Batch of Data
      ////////  Whatever's From the Backend/Database
      ////////  Is Always Most Up-To-Date 

        fetch( "/fresh_batch_of_user_wooblies" )
        .then( r => r.json() )
        .then( freshBatchOfWooblies => setLoggedInUserWooblies( freshBatchOfWooblies ) )

      ////////  Fetching a Fresh Batch of Data

        upDateNewWooblyInfo(
          {
      
            name: ""
      
          } 
        )

    } )
    // .then( newWooblyFromTheBackend =>{


    //   ////////  Using our Response From the Backend

    //     //// Adding our New Woobly to the Frontend
    //     setLoggedInUserWooblies( [ ...loggedInUserWooblies , newWooblyFromTheBackend ] )
    //     //// Clearing Our Form
    //     upDateNewWooblyInfo(
    //       {
      
    //         name: ""
      
    //       } 
    //     )

    //   ////////  Using our Response From the Backend


    // } )
    // .then( console.log )


  }






  ////////  Dropdown Join Model POST Request Methods


    const [ newWooblySnack , upDateNewWooblySnackInfo ] = useState(

      {

        price: 0,


        woobly_id: 0,

        snack_id: 0

      }

    )
    console.log( "STATE OF  newWooblySnack: ", newWooblySnack )  //



    const handleSubmitForWooblySnacksCREATE =( sythEvent )=>{

      sythEvent.preventDefault()

      console.log("!!!! BYEBUG !!!!")  //

      fetch( "/woobly_snacks" , 
        {

          method: "POST",
          headers: { "Content-Type": "Application/json" },
          body: JSON.stringify( newWooblySnack )

        } 
      )
      .then( r => r.json() )
      .then( console.log )


    }

    const changeHandlerForNewWooblySnackInputs =( sythEvent )=>{

      upDateNewWooblySnackInfo( { ...newWooblySnack , [sythEvent.target.name]: sythEvent.target.value }  )

    }


  ////////  Dropdown Join Model POST Request Methods




  //////////////////// js




  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />




        {

          loggedInUser ?

          // True Case
          (<>
                    
            <h2>Welcome { loggedInUser.name }! :)</h2> 
            
            <button onClick={ handleLogout }>LogOut</button>


            {

              loggedInUserWooblies.map( ( eachWoobly )=>{

                return(<h4>{eachWoobly.name}</h4>)

              })

            }
              {/* {

                userWoobliesToRender.map( ( eachWoobly )=>{

                    return(<h4>{eachWoobly.name}</h4>)

                })
                

              } */}

              <form onSubmit={ handleSubmitForWooblySnacksCREATE } >


                <select onChange={ changeHandlerForNewWooblySnackInputs } name="woobly_id" >

                  <option value={0}> Select a Woobly </option>
                  {

                    loggedInUserWooblies.map( ( eachWoobly )=>{

                      return(<option value={ eachWoobly.id }>{ eachWoobly.name }</option>)

                    })

                  }

                </select>


                  <input onChange={ changeHandlerForNewWooblySnackInputs } 
                  
                    value={ newWooblySnack.price }
                    name="price"
                    type="number"

                  />


                <select onChange={ changeHandlerForNewWooblySnackInputs } name="snack_id" >

                  <option value={0}> Select a Snack </option>
                  {

                    allTheSnacksOnEarth.map( ( eachSnack )=>{

                      return(<option value={ eachSnack.id }>{ eachSnack.name }</option>)

                    })

                  }

                </select>

                <br></br>

                <input type="submit" />


              </form>
            
            
          </>)


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


        <br/><br/><br/><br/>



        <form onSubmit={ submitHandlerForNewWoobly } >

          <input onChange={ changeHandlerNewWooblyName }  name="name"  value={newWoobly.name} />
          <input type="submit"  />

        </form>




        <br/><br/><br/><br/><br/><br/><br/><br/>
        <br/><br/><br/><br/><br/><br/><br/><br/>
        <br/><br/><br/><br/><br/><br/><br/><br/>
        <br/><br/><br/><br/><br/><br/><br/><br/>


        <h1>Or SignUp?</h1>






      </header>
    </div>
  );
}

export default App;
