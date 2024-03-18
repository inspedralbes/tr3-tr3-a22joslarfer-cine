<template>
    <div v-if="isLoading">
        <img src="/icons/loading.svg" alt="" srcset="" class="spinner">
    </div>
</template>

<script lang="ts" setup>
const props = defineProps({
    isLoading: {
        type: Boolean,
        required: true,
    },
  
});
</script>

<style scoped>

div{
    display: flex;
    justify-content: center;
    align-items: center;
    height: 90vh;
    background-color: #d1d8d2;
   
}

.spinner {  
    border-radius: 50%;
    opacity: 0.9;
    width: 400px;
    height: 400px;
    animation: spin 1s linear infinite;
    margin: 0 auto;
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