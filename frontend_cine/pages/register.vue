<template>
    <div>
        <NavBar />

        <div class="container">

            <form @submit.prevent="formPost">

                <label for="username">Nom Usuari</label>
                <input type="text" id="username" v-model="username">

                <label for="email">Email</label>
                <input type="email" id="email" v-model="email">

                <label for="password">Contrasenya</label>
                <input type="password" id="password" v-model="password">

                <nuxt-link to="/login" class="nuxt-link">Tens compte? Inicia Sessió!</nuxt-link>


                <button type="submit">Registrarse</button>


            </form>

        </div>



        <Footer />

    </div>
</template>

<script>
export default {
    data() {
        return {
            username: '',
            email: '',
            password: ''
        }
    },
    methods: {
        formPost() {
            fetch('http://localhost:8000/api/register', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    name: this.username,
                    email: this.email,
                    password: this.password
                })
            })
                .then(response => response.json())
                .then(data => {
                    if (data && data.success) {
                        alert('Has iniciat sessió correctament!');
                        navigateTo('/login')
                    } else {
                        alert('Has iniciat sessió INCORRECTAMENT!');
                    }
                })
                .catch(error => {
                    alert('Has iniciat sessió INCORRECTAMENT!');
                    console.log(error)
                });
        }
    }
}
</script>

<style scoped>
* {
    box-sizing: border-box;
    font-family: "Antonio", sans-serif;
    margin: 0;
    padding: 0px;
    overflow: hidden;

}


.container {
    height: auto;
    background-color: #d1d8d2;
    display: grid;
    grid-template-rows: auto auto auto;
    grid-template-areas:
        "nav"
        "form"
        "footer"
    ;
    height: 90vh;
    

}

nav {
    grid-area: nav;
    
}

footer {
    grid-area: footer;
}

form {
    grid-area: form;
    display: grid;
    flex-direction: column;
    justify-content: center;
    align-content: center;
    gap: 50px;
    height: auto;
    padding: 0 100px;
    margin: 0 auto;
    border-radius: 25px;
    text-align: center;
    background-color: #c93d3d;
    font-weight: 900;
    box-shadow: 0 0 4px 0px #1c1c1c;
  
}

input {
    display: flex;
    width: 100%;
    height: 50px;
    font-size: 2rem;
    border-radius: 10px;
    border: none;
    color: #1c1c1c;
    background-color: #d1d8d2;
    ;
    text-align: center;
    transition: border-bottom 0.05s ease-in-out;
}

input:focus {
    outline: none;
    border-bottom: 3px solid #1c1c1c;
}

button {
    width: 100%;
    height: 70px;
    font-size: 2rem;
    border-radius: 10px;
    border: none;
    color: #1c1c1c;
    background-color: #d1d8d2;
    transition: background-color 0.1s ease-in-out;
   
}
button:hover{
    background: #e2e7e3;
    
}
label {
    font-size: 35px;
    color: #d1d8d2;
    
}

.nuxt-link {
    text-decoration: none;
    color: #1c1c1c;
    overflow: visible;
    font-family: "Antonio", sans-serif;
    font-size: 2.1em;
}

.nuxt-link:hover {
    color: #d1d8d2;
    transition: color 0.1s ease-in-out;

}
</style>