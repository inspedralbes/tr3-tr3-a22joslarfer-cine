<template>

    <div class="container">

        <NavBar />

        <div class="seat-info-cont">

            <div v-for="(selected_seat) in selected_seats_to_purchase" class="div-selected_seats_to_purchase">
                <div class="div-selected-seat-to-purchase">
                    <img src="/icons/seat.svg" alt="" srcset="">
                    <p>Fila {{ selected_seat.row }}</p>
                    <p>Columna {{ selected_seat.column }}</p>
                    <div v-if="!selected_seat.vip">
                        <p>Seient VIP</p>
                    </div>
                    <p v-if="selected_seat.vip">Preu {{ vip_seat_price }}€</p>
                </div>

            </div>

        </div>

        <div class="btn-confirm-cont">
            <button @click="confirm_purchase()">CONFIRMAR ({{ total }}€)</button>
        </div>

        <Footer />

    </div>

</template>



<style scoped>
img {
    width: 150px;
    height: 150px;
    margin: 5px;
    background-position: center;
    background-size: cover;
    background-repeat: no-repeat;
    border-radius: 50%;
    background-color: #d1d8d2;
    padding: 10px;


}


.container {
    display: grid;
    height: auto;
    background-color: #d1d8d2;
    grid-template-areas:
        "nav"
        "checkout-info"
        "btn-confirm"
        "footer";
    ;
    color: #d1d8d2;

}


nav {
    grid-area: nav;
    margin-bottom: 50px;
}

footer {
    grid-area: footer;
    margin-top: 50px;
}

.seat-info-cont {
    grid-area: checkout-info;
    display: flex;
    flex-wrap: wrap;
    margin: auto;
    justify-content: center;

}

.div-selected_seats_to_purchase {
    display: grid;
    justify-items: center;
    margin: 10px;
    padding: 20px 60px;
    transition: color 0.1s ease-in-out, box-shadow 0.1s ease-in-out, border 0.1s ease-in-out;
    border-radius: 16px;
    background-color: #1c1c1c;
    text-align: center;
}

.div-selected_seats_to_purchase:hover {
    color: #ffffff;
    box-shadow: 0 1px 7px 0px #000000d2;

}



.btn-confirm-cont {
    grid-area: btn-confirm;
    margin: auto;
}

button {
    padding: 15px 40px;
    border-radius: 10px;
    background-color: #000000;
    color: #d1d8d2;
    font-size: 3rem;
    font-weight: 900;
    cursor: pointer;
    margin: 40px;
    transition: color 0.3s ease-in-out, box-shadow 0.3s ease-in-out, border 0.3s ease-in-out;
}

button:hover {
    color: white;
    box-shadow: 0 9px 1px 1px #000000;
    border-bottom: 4px solid #d1d8d2;
    border-left: 2px solid #d1d8d2;
    border-right: 2px solid #d1d8d2;

}

p {
    font-size: 1.5rem;
    font-weight: 400;
    margin-top: 10px;
}
</style>

<script>


export default {
    data() {
        return {
            selected_seats_to_purchase: [],
            checkout_data: [],
            index: 0,
            vip_seat_price: 8,
            non_vip_seat_price: 6,
            total: null,
            movie_id: null,
            user_id: null,
            date: null,
            url: 'http://localhost:8000/api/checkout'
        }
    },
    methods: {
        return_pinia_data() {
            const userStore = useStore();
            this.selected_seats_to_purchase = userStore.return_selected_seats();
            this.movie_id = userStore.return_movie_id();
            this.calcTotal();
            this.date = userStore.return_movie_date();
            //this.checkout_data.user_id = userStore.return_user_id();
            this.user_id = 1;


            console.log('asientos a comprar', this.selected_seats_to_purchase);
            console.log('movie_id', this.movie_id);
            console.log('user_id', this.user_id);
            console.log('date', this.date);
            console.log('total', this.total);
        },
        confirm_purchase() {
            // transaction en el laravel
            let checkout_data = this.selected_seats_to_purchase.map(seat => ({
                seat_id: seat.id,
                unit_seat_price: seat.vip ? 8 : 6,
                total: this.total,
                movie_id: this.movie_id,
                user_id: this.user_id,
                date: this.date
            }));
            console.log('enviado post de compra', checkout_data);
            this.fetchSavePurchase(checkout_data);

            const userStore = useStore();
            userStore.reset_booking_info();

            navigateTo('/')
        },
        calcTotal() {
            this.total = this.selected_seats_to_purchase.reduce((acc, seat) => {
                return acc + (seat.vip ? 8 : 6);
            }, 0);
        },
        async fetchSavePurchase(checkoutData) {
            try {
                let response = await fetch('http://localhost:8000/api/checkout', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(checkoutData),
                });

                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }

                let data = await response.json();
                console.log(data);
            } catch (error) {
                console.error('There was a problem with the fetch operation: ', error);
            }
        },
    },
    mounted() {
        this.return_pinia_data();
        if (this.selected_seats_to_purchase.length === 0) {
            navigateTo('/estrenos')
        }
    },
    
};

</script>
