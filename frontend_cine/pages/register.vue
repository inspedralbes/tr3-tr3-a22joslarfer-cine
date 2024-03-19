<template>
    <div>
        <NavBar />

        <div class="container">

            <form @submit.prevent="fetchRegister"> 

                <label for="name">Nom Usuari</label>
                <input type="text" id="name" v-model="name" placeholder="John">

                <label for="email">Email</label>
                <input type="email" id="email" v-model="email" placeholder="john@gmail.com">

                <label for="password">Contrasenya</label>
                <input type="password" id="password" v-model="password" placeholder="contrasenya actual">

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
            name: '',
            email: '',
            password: '',
            user_id: null,
            token: null,
        }
    },
    methods: {
        fetchRegister() {
            fetch('http://localhost:8000/api/register', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    name: this.name,
                    email: this.email,
                    password: this.password,
                })
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    if (data.token) {
                        localStorage.setItem('auth-token', data.token);
                        this.token = data.token;
                        this.fetchUserId();
                        alert('Has iniciat sessió correctament!');
                        navigateTo('/estrenos');
                    } else {
                        alert('Has iniciat sessió INCORRECTAMENT!');

                    }
                })
                .catch(error => {
                    alert('Has iniciat sessió INCORRECTAMENT!');
                    console.log(error)
                });
        },
        fetchUserId() {
            const userStore = useStore();

            fetch(`http://localhost:8000/api/get-user-id?email=${encodeURIComponent(this.email)}`, {
                headers: {
                    'Authorization': `Bearer ${this.token}`
                }
            })
                .then(response => response.json())
                .then(data => {
                    if (data) {
                        this.user_id = data.user.id;
                        console.log('data', data)
                        console.log('data.user.id', data.user.id)
                        if (this.user_id == null) {
                            alert('ERROR FETCHING DATA');
                        }
                        // COMPROBAR QUE SE GUARDA BIEN LA INFO EN EL PINIA ---------------
                        userStore.save_user_info(this.name, this.email, this.user_id);
                        const usuarioId = userStore.return_user_id();
                        console.log('tu id', usuarioId);
                        const usuarioName = userStore.return_user_username();
                        console.log('tu username', usuarioName);
                        const usuarioEmail = userStore.return_user_email();
                        console.log('tu email', usuarioEmail);
                        // COMPROBAR QUE SE GUARDA BIEN LA INFO EN EL PINIA ---------------

                    } else {
                        console.log('ERROR FETCHING DATA');
                    }
                })
                .catch(error => {
                    console.error(error);
                });
        },

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
    height: auto;


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
    gap: 40px;
    height: auto;
    padding: 30px 80px;
    margin: 40px auto;
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
    cursor: pointer;

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