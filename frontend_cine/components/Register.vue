<template>
    <form @submit.prevent="handleSubmit">
      <label for="name">Nom Usuari</label>
      <input type="text" id="name" v-model="name" placeholder="John">
  
      <label for="email">Email</label>
      <input type="email" id="email" v-model="email" placeholder="john@gmail.com">
  
      <label for="password">Contrasenya</label>
      <input type="password" id="password" v-model="password" placeholder="************">
  
      <button type="submit">Registrarse</button>
      <nuxt-link to="/login" class="nuxt-link">Tens compte? Inicia Sessió!</nuxt-link>
    </form>
  </template>
  
  <script>
  export default {
    data() {
      return {
        name: '',
        email: '',
        password: ''
      }
    },
    methods: {
      handleSubmit() {
        // Call the register method passed down as a prop
        if (this.register && typeof this.register === 'function') {
          this.register(this.name, this.email, this.password);
        } else {
          console.error('Register method not provided or invalid');
        }
      }
    },
    props: {
      register: {
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