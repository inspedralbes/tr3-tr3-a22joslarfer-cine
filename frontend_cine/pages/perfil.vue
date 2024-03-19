<template>
    <div class="container">

        <NavBar />


        <h3>Les teves sessions</h3>

        <div class="container--checkout" v-if="fetchUserCheckoutsIsDone">
            <div class="checkout--details" v-for="checkout in user_checkouts" :key="checkout.id">
                <p>Id {{ checkout.id }}</p>
                <p>Total {{ checkout.total }}</p>
                <p>Data {{ checkout.date }}</p>
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
            if (this.user_id) {
                this.user_logged = true;
            }
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
    padding: 0px;
    overflow: hidden;
    overflow-y: hidden;
    text-align: center;
    font-family: "Antonio", system-ui;
}

.container {
    height: auto;
    background-color: #d1d8d2;
}


nav {
    grid-area: nav;
}

footer {
    grid-area: footer;
}



h3{
    margin: 0px;
    margin-bottom: 50px;
    font-size: 4rem;
    font-family: "Germania One", system-ui;
    background-color: #1c1c1c;
    color: #d1d8d2;
    padding: 30px;
    letter-spacing: 5px;
}



.container--checkout {
    display: grid;
    grid-template-rows: auto;
    grid-template-columns: 1fr 1fr 1fr 1fr;
    justify-items: center;
    color: #1c1c1c;
    font-size: 1.5rem;
    text-align: center;
   
}

.checkout--details {
    padding: 40px;
    margin: 18px;
    width: 300px;
    border-radius: 16px;
    background-color: #1c1c1c1c;
    color: #1c1c1c;
    box-shadow: 0 1px 7px 0px #000000d2;
}
</style>