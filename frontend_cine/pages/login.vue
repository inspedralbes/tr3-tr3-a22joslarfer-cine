<template>
    <div>

        <NavBar />

        <div class="container">

            <form @submit.prevent="formPost">

                <label for="email">Email</label>
                <input type="text" id="email" v-model="email">

                <label for="password">Contrasenya</label>
                <input type="password" id="password" v-model="password">


                <nuxt-link to="/register" class="nuxt-link">No tens compte? Registra't</nuxt-link>


                <button type="submit">Login</button>


            </form>

        </div>


        <Footer />

    </div>
</template>


<script>
export default {
    data() {
        return {
            email: '',
            password: ''
        }
    },
    methods: {
        formPost() {
            fetch('http://localhost:8000/api/login', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    email: this.email,
                    password: this.password
                })
            })
                .then(response => response.json())
                .then(data => {
                    if (data && data.token) {
                        alert('Has iniciat sessió correctament!');
                        // guardar el token que es rep a data a localStorage
                        localStorage.setItem('token', data.token);
                        navigateTo('perfil')

                    } else {
                        alert('Has iniciat sessió INCORRECTAMENT!');
                    }
                })
                .catch(error => {
                    console.error(error);
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
    grid-template-rows: auto auto;
    grid-template-areas:
        "nav"
        "form"
        "footer"
    ;
    height: 100vh;

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
    height: 620px;
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

button:hover {
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