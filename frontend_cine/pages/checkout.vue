<template>
    <div v-for="(selected_seat, index) in selected_seats_to_purchase" class="div-selected_seats_to_purchase">
        <h2>Seient {{ index }}</h2>
        <p>Fila {{ selected_seat.row }}</p>
        <p>Columna {{ selected_seat.column }}</p>
       
    </div>
</template>

<script>


export default {
    data() {
        return {
            selected_seats_to_purchase: [],
        }

    },
    methods: {
        purchase_seats() {
            const userStore = useStore();
            this.selected_seats_to_purchase = userStore.return_selected_seats();
        }
    },
    mounted() {
        this.purchase_seats();
    }
}
</script>

<style scoped></style>