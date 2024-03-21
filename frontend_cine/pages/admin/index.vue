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
    mounted() {
    
    },
    beforeMount() {
        const store = useStore();
        this.isAdmin = store.return_isAdmin();
        localStorage.getItem('priviledgeState') === 'admin' ? this.isAdmin = true : this.isAdmin = false;
        if (this.isAdmin === false) navigateTo('/login');

        this.isLoading = false;
        this.isAdmin = true;
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