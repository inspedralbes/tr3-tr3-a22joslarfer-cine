<template>
    <div class="container">

        <NavBar />

        <div class="div-perfil-info-cont" v-if="user_logged">
            <div class="div-perfil-info-cont--userDetails">
                <h3>Detalls del teu compte</h3>
                <p>Nom d'usuari:{{ user_username }}</p>
                <p>Email: {{ user_email }}</p>
            </div>
            <div class="div-perfil-info-cont--checkouts">
                <h3>Les teves sessions</h3>
                <div v-if="fetchUserCheckoutsIsDone">
                    <div v-for="checkout in user_checkouts" :key="checkout.id">
                        <p>{{ checkout.id }}</p>
                        <p>{{ checkout.total }}</p>
                    </div>
                </div>
            </div>
        </div>


        <Footer />
    </div>
</template>

<script>
export default {
    data() {
        return {
            user_checkouts: [],
            fetchUserCheckoutsIsDone: false,
            user_id: null,
            user_username: null,
            user_email: null,
            user_logged: false,
        }
    },
    methods: {
        fetchUserCheckouts() {
            fetch(`http://localhost:8000/api/checkouts/${this.user_id}`)
                .then(response => response.json())
                .then(data => {
                    if (data) {
                        this.user_checkouts = data;
                        this.fetchUserCheckoutsIsDone = true;
                    } else {
                        console.log('ERROR FETCHING DATA');
                    }
                })
                .catch(error => {
                    console.error(error);
                });
        },
        getPiniaData() {
            const store = useStore();
            this.user_id = store.return_user_id();
            this.user_username = store.return_user_username();
            this.user_email = store.return_user_email();
        },

    },
    mounted() {
        this.getPiniaData();
        this.fetchUserCheckouts();
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
    display: grid;
    height: 100vh;
    background-color: #d1d8d2;
    grid-template-areas:
        "nav"
        "div-perfil-info-cont"
        "footer";
    ;
    grid-template-rows: auto 1fr auto;
    color: #1c1c1c;
}

nav {
    grid-area: nav;
}

footer {
    grid-area: footer;
}

.div-perfil-info-cont {
    grid-area: div-perfil-info-cont;
    display: flex;

    justify-content: center;
    align-items: center;
    margin: 40px;

}
</style>