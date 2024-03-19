<template>
    <div>
        <NavBar />

        <div class="container">

           <Register :register="fetchRegister" />

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

</style>