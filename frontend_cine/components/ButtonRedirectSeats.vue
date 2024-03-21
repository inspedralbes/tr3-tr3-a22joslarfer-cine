<template>
    <div>
        <button class="redirect--seats" @click="navigateToSeatsControlPanel()">SEATS</button>
    </div>


</template>

<script>
export default {
    methods: {
        navigateToSeatsControlPanel() {
            navigateTo('/admin/seats');
        }
    }
}
</script>

<style scoped>
div {
    display: flex;

    width: 100%;
    height: 100%;
    grid-area: redirectSeats;

}

.redirect--seats:hover {
    background-color: #473d3d;
    color: #d1d8d2;
}

.redirect--seats {
    transition: background-color 0.3s ease-in-out, color 0.1s ease-in-out;
    width: 100%;
    height: 100%;
    background-color: #312929;
    border: 4px solid #1c1c1c;
    color: #1c1c1c;
    cursor: pointer;

}
</style>