<template>

    <div v-if="!fetch_is_done || !fetchSeats_is_done" class="loading-container">
        <img src="/icons/loading.svg" alt="" srcset="" class="spinner-icon">
    </div>


</template>

<script>


const props = defineProps({
    fetch_is_done: Boolean,
    fetchSeats_is_done: Boolean
});
</script>

<style scoped>
.spinner-icon {
    height: 100px;
    animation: spin 1s linear infinite;
    border: 4px solid #81b3c0d7;
    border-radius: 50%;
    border-top: 4px solid transparent;
    position: absolute;
    top: 40%;
    left: 50%;
    transform: translate(-50%, -50%);
}

@keyframes spin {
    0% {
        transform: rotate(0deg);
    }

    100% {
        transform: rotate(360deg);
    }
}
</style>