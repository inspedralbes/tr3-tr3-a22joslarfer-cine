<template>
    <div>

        <NavBar />

        <div class="container">

            <form @submit.prevent="formPost">

                <div>
                    <label for="email">Email</label>
                    <input type="text" id="email" v-model="email">
                </div>

                <div>
                    <label for="password">Contrasenya</label>
                    <input type="password" id="password" v-model="password">
                </div>



                <div>
                    <nuxt-link to="/register">No tens compte? Registra't</nuxt-link>
                </div>

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
.container {
    display: grid;
    background-color: #d1d8d2;
}
</style>