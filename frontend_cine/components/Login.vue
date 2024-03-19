<template>
    <form @submit.prevent="handleSubmit">
        <label for="email">Email</label>
        <input type="text" id="email" v-model="email" placeholder="example@gmail.com">

        <label for="password">Contraseña</label>
        <input type="password" id="password" v-model="password" placeholder="contrasenya actual">

        <button type="submit">Login</button>
    </form>
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
        handleSubmit() {
        
            if (this.login && typeof this.login === 'function') {
                this.login(this.email, this.password);
            } else {
                console.error('Login method not provided or invalid');
            }
        }
    },
    props: {
        login: {
            type: Function,
            required: true
        }
    }
}
</script>

<style scoped>
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
    cursor: pointer;
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