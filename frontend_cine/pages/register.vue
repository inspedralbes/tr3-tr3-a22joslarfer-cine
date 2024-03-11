<template>
    <div>
        <form @submit.prevent="formPost">

            <div>
                <label for="username">Nom Usuari</label>
                <input type="text" id="username" v-model="username">
            </div>

            <div>
                <label for="email">Email</label>
                <input type="email" id="email" v-model="email">
            </div>

            <div>
                <label for="password">Contrasenya</label>
                <input type="password" id="password" v-model="password">
            </div>

           
            <div>
                <nuxt-link to="/login">Tens compte? Inicia Sessió!</nuxt-link>
            </div>

            <button type="submit">Registrarse</button>


        </form>
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

<style lang="scss" scoped></style>