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
.div-selected_seats_to_purchase:hover{
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
    border-bottom: 2px solid #d1d8d2;
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
        }
    },
    methods: {
        return_selected_seats_to_purchase() {
            const userStore = useStore();
            this.selected_seats_to_purchase = userStore.return_selected_seats();
            console.log('pinia data', this.selected_seats_to_purchase);
        },
        confirm_purchase() {
            const userStore = useStore();
            this.checkout_data.user_id = userStore.return_user_id();
            this.checkout_data.movie_id = userStore.return_movie_id();
            this.checkout_data.seat_unit_price = selected_seats_to_purchase[this.index].vip ? 8 : 6;
            this.checkout_data.total = this.total;
            this.fetchSavePurchase(this.checkoutData);

            userStore.reset_booking_info();
            navigateTo('/');

        },
        calcTotal() {
            this.total = this.selected_seats_to_purchase.reduce((acc, seat) => {
                return acc + (seat.vip ? 8 : 6);
            }, 0);
        },
        fetchSavePurchase(checkoutData) {
            fetch(URL, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(checkoutData)
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    console.log('POST 201', data);
                })
                .catch(error => {
                    console.error('POST ERROR', error);
                });
        },

    },
    mounted() {
        this.return_selected_seats_to_purchase();
        this.calcTotal();
    }
};

</script>
