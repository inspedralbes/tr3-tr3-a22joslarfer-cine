<template>
    <div class="container" v-if="!isLoading && isAdmin">
        <ButtonRedirectMovies />
        <ButtonRedirectSeats />
        <ButtonRedirectSessions />
    </div>
</template>

<script>

export default {
    data() {
        return {
            isAdmin: false,
            isLoading: true,
        }
    },
    beforeMount() {
        const store = useStore();
        if (typeof window !== 'undefined' && (store.return_isAdmin() === false || localStorage.getItem('priviledgeState') === 'user')) {
            navigateTo('/login');
        } else {
            this.isAdmin = true;
        }
        this.isLoading = false;
    },
    
}

</script>

<style scoped>
.container {
    height: 100vh;
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    text-align: center;
    grid-template-areas:
        "redirectMovies redirectSeats redirectSessions"

    ;


}

* {
    font-size: 8rem;
    font-family: "Antonio", sans-serif;
   
}
</style>