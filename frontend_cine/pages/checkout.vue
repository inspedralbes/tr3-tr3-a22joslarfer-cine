<template>

    <div class="container">

        <div class="seat-info-cont">
            <h1>Checkout</h1>
            <div v-for="(selected_seat, index) in selected_seats_to_purchase" class="div-selected_seats_to_purchase">
                <h2>Seient {{ index }}</h2>
                <p>Fila {{ selected_seat.row }}</p>
                <p>Columna {{ selected_seat.column }}</p>
                <div v-if="!selected_seat.vip">
                    <p>Seient VIP</p>
                </div>
            </div>
            <div class="btn-confirm-cont" @click="comfirm_purchase()">
                <button>CONFIRMAR</button>
            </div>
        </div>

    </div>

</template>

<script>


export default {
    data() {
        return {
            selected_seats_to_purchase: [],
            checkout_data: [],
            index = 0,
        }
    },
    methods: {
        purchase_seats() {
            const userStore = useStore();
            this.selected_seats_to_purchase = userStore.return_selected_seats();
        },
        comfirm_purchase() {
            const userStore = useStore();
            this.checkout_data.user_id = userStore.return_user_id();
            this.checkout_data.movie_id = userStore.return_movie_id();
            this.checkout_data.seat_unit_price: selected_seats_to_purchase[this.index].vip ? 8 : 6,
             
            };

        // Guardar el checkout en la base de datos
        this.fetchSavePurchase(checkoutData);
        // reset this.checkout_data
        this.checkout_data = {
            "seat_id": null,
            "user_id": null,
            "movie_id": null,
            "seat_unit_price": null,
            "date": null
        };
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
    mounted() {
        this.purchase_seats();
    }
}
</script>

<style scoped></style>
