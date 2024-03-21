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

                this.fetchUserId();


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
                const store = useStore();


                this.user_id = data.user.id;
                if (this.user_id == null) {
                    alert('ERROR FETCHING DATA USER.ID');
                }
                if(this.user.rol = 'admin'){
                    store.save_isAdmin(true);
                }



               

                console.log('abans dels ifs');
                if (store.return_is_navigating_to_profile() === false && store.return_selected_seats().length === 0) {
                    console.log('estrenos amb profile false i seients buits');
                    navigateTo('/estrenos');

                } else if (store.return_is_navigating_to_profile() === true && store.return_selected_seats().length > 0) {
                    console.log('perfil amb profile true i seients plens');
                    navigateTo('/perfil');

                } else if (store.return_is_navigating_to_profile() === true && store.return_selected_seats().length === 0) {
                    console.log('perfil amb profile true i seients buits');
                    navigateTo('/perfil');
                } else if (store.return_is_navigating_to_profile() === false && store.return_selected_seats().length > 0) {
                    console.log('chekout amb profile false i seients plens');
                    navigateTo('/checkout');
                }
                console.log('despres dels ifs');


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


                alert('Has iniciat sessió correctament!');


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
  
    grid-template-areas:
        "nav"
        "form"
        "footer"
    ;
 

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

input:-webkit-autofill,
input:-webkit-autofill:hover,
input:-webkit-autofill:focus,
input:-webkit-autofill:active {
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