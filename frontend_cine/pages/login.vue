<template>
    <div>

        <NavBar />

        <div class="container">

            <form @submit.prevent="fetchLogin">

                <label for="email">Email</label>
                <input type="text" id="email" v-model="email" placeholder="exemple@gmail.com">

                <label for="password">Contrasenya</label>
                <input type="password" id="password" v-model="password" placeholder="contrasenya actual">


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
            password: '',
            user_id: null,
            token: null,
        }
    },
    methods: {
        async fetchLogin() {
            try {
                let response = await fetch('http://localhost:8000/api/login', {

                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        email: this.email,
                        password: this.password
                    }),
                });

                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                let data = await response.json();

                localStorage.setItem('auth-token', data.token);
                this.token = data.token;
                alert('Has iniciat sessió correctament!');
                this.fetchUserId();
               



                // -------------- PROBLEMA -------------------------------------------------
                const store = useStore();
                if (store.return_selected_seats().length > 0) {
                    console.log('entrando en store.return_selected_seats().length > 0');
                    navigateTo('/checkout');
                    console.log('despues de /checkout');
                } else {
                    console.log('yendo a /estrenos');
                    navigateTo('/estrenos');
                }
                // -------------- PROBLEMA -------------------------------------------------




            } catch (error) {
                console.error('ERROR ERROR ERROR: ', error);
            }
        },
        async fetchUserId() {
          
            try {
                let response = await fetch(`http://localhost:8000/api/get-user-id?email=${encodeURIComponent(this.email)}`, {
                    headers: {
                        'Authorization': `Bearer ${this.token}`
                    }
                });

                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }

                let data = await response.json();

                this.user_id = data.user.id;
                if (this.user_id == null) {
                    alert('ERROR FETCHING DATA USER.ID');
                }
                const userStore = useStore();
                userStore.save_user_info(data.user.name, this.email, this.user_id);
                const usuarioId = userStore.return_user_id();
                console.log('tu id', usuarioId);
                const usuarioName = userStore.return_user_username();
                console.log('tu username', usuarioName);
                const usuarioEmail = userStore.return_user_email();
                console.log('tu email', usuarioEmail);
                const pinia_selected_seats = userStore.return_selected_seats();
                console.log('tus asientos', pinia_selected_seats);


            } catch (error) {
                console.error('There was a problem with the fetch operation: ', error);
            }
        },
    },
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
    gap: 50px;
    height: 620px;
    padding: 30px 100px;
    margin: 50px auto;
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
    font-size: 1.3rem;
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

input:-webkit-autofill,
input:-webkit-autofill:hover, 
input:-webkit-autofill:focus, 
input:-webkit-autofill:active{
    -webkit-box-shadow: 0 0 0 30px #d1d8d2 inset !important;
    -webkit-text-fill-color: #1c1c1c !important;
    -webkit-text-size-adjust: 2rem !important;
    transition: background-color 5000s ease-in-out 0s;
    font-family: "Antonio", sans-serif;
  

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