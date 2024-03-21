<template>
    <div class="container">

        <NavBar />

        <div class="container--main">
            <h3>Les teves sessions</h3>

            <div class="container--checkout" v-if="fetchUserCheckoutsIsDone">
                <div class="checkout--details" v-for="checkout in user_checkouts" :key="checkout.id">
                    <h2>TICKET ID {{ checkout.id }}</h2>
                    <p>Total {{ checkout.total }}</p>
                    <p>Data {{ checkout.date }}</p>
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
            if (this.user_id === null) {
                store.save_is_navigating_to_profile(true);
                alert('Has de fer login per veure el teu perfil');
                navigateTo('/login');
            }
            this.user_username = store.return_user_username();
            this.user_email = store.return_user_email();

        },


    },
    mounted() {
        this.getPiniaData();
        this.fetchUserCheckouts();
    },
    created() {
        const store = useStore();
        if (typeof window !== 'undefined' && (store.return_isAdmin() === true || localStorage.getItem('priviledgeState') === 'admin')) {
            navigateTo('/admin');
        }
    }

}

</script>

<style scoped>
* {
    box-sizing: border-box;
    padding: 0px;
    margin: 0px;
    font-family: 'Antonio', sans-serif;
}


.container {
    display: grid;
    grid-template-areas:
        "nav"
        "main"
        "footer";
    ;
    height: auto;
    background-color: #d1d8d2;
}

.container--main {
    grid-area: main;
}


nav {
    grid-area: nav;

}

footer {
    grid-area: footer;
}

.clicked {
    background-color: #1c1c1c;
    color: #d1d8d2;

}

p{
    margin: 20px;
}

h3 {
    text-align: center;
    position: sticky;
    top: 0;
    left: 0;
    right: 0;
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
    transition: box-shadow 0.1s ease-in-out;
    cursor: pointer;
}

.checkout--details:hover {
    box-shadow: 0 1px 14px 0px #000000d2;
}



@media only screen and (min-device-width: 300px) and (max-device-width: 375px) {
    /* Styles for smartphones */

    * {
        font-size: 20px;
        margin: 0;
        padding: 0;

    }

    .container {
        height: auto;
        grid-template-columns: 1fr;

    }

    .container--checkout {
        grid-template-columns: 1fr;

    }


    .checkout--details {
        width: 100%;
        border-radius: 0px;

    }



}

@media only screen and (min-device-width: 375px) and (max-device-width: 768px) {



    .container {
        height: auto;
        grid-template-columns: 1fr;



    }

    .container--checkout {
        grid-template-columns: 1fr;

    }



}


@media only screen and (min-device-width: 768px) and (max-device-width: 1200px) {



    .container {
        height: auto;
        grid-template-columns: 1fr;



    }

    .container--checkout {
        grid-template-columns: 1fr 1fr;

    }



}
</style>