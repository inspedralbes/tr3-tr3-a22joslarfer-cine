<template>
    <div v-if="!isLoading && isAdmin" class="container">
        <NavBarAdmin />
        <div class="container--main">
            <section class="main--delete">
                <form submit.prevent="">
                    <p>Introdueix un id de peli i elimina els seients associats (12F 10C)</p>
                    <input type="text" placeholder="ID de la peli" />
                    <button>Eliminar Seients</button>
                </form>

            </section>

            <section class="main--create">
                <form submit.prevent="">
                    <p>Introdueix un id de peli i crea els seients associats (12F 10C)</p>
                    <input type="text" placeholder="ID de la peli" />
                    <button>Crear Seients</button>
                </form>

            </section>

            <section class="main--vip">
                <form submit.prevent="">
                    <p>Introdueix un id de peli i una fila per crear seients vip associats</p>
                    <input type="text" placeholder="ID de la peli" />
                    <input type="number" name="" id="" placeholder="Filera a fer Vip">
                    <button>Crear Seients VIP</button>
                </form>

            </section>
        </div>
        <FooterAdmin />
    </div>
</template>

<script>
export default {
    data() {
        return {

            isAdmin: false,
            isLoading: true,
        }
    },
    methods: {

    },
    mounted() {

    },
    beforeMount() {
        const store = useStore();
        this.isAdmin = store.return_isAdmin();
        localStorage.getItem('priviledgeState') === 'admin' ? this.isAdmin = true : this.isAdmin = false;
        if (this.isAdmin === false) navigateTo('/login');

        this.isLoading = false;
        this.isAdmin = true;
    },
}
</script>


<style scoped>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Antonio', sans-serif;
    overflow: hidden;

}

.container {
    background-color: #d1d8d2;
    display: grid;
    height: auto;
    height: 100vh;


}

.container--main {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;

  
}



form {
    grid-area: form;
    display: flex;
    flex-direction: column;
    justify-content: space-evenly;
    height: 500px;
    margin: 0 auto;
    width: 500px;
    border-radius: 25px;
    text-align: center;
    background-color: #1c1c1c;
    font-weight: 900;
    box-shadow: 0 0 4px 0px #1c1c1c;

}

p,
input,
button {
    width: 70%;
    margin: 0 auto;
    font-size: 2rem;
    color: #888484;
}

input {
    display: flex;
    height: 50px;
    border-radius: 10px;
    border: none;
    color: #1c1c1c;
    background-color: #473d3de5;
    ;
    text-align: center;
    transition: border-bottom 0.05s ease-in-out;
}

input:focus {
    outline: none;
    border-bottom: 3px solid #888484;
}

input[type=number]::-webkit-inner-spin-button {
    -webkit-appearance: none;
}


button {
    height: 90px;
    
    border-radius: 10px;
    border: none;
    color: #1c1c1c;
    background-color: #473d3de5;
    transition: background-color 0.1s ease-in-out;
    cursor: pointer;
}

button:hover {
    background: #888484;
  
}
</style>