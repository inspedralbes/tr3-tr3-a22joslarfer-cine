<template>
    <div class="container">
        <ButtonRedirectMovies />
        <ButtonRedirectSessions />
    </div>
</template>

<script>


</script>

<style scoped>
.container {
    height: 100vh;
    display: grid;
    grid-template-columns: 1fr 1fr;
    text-align: center;
    grid-template-areas:
        "redirectMovies redirectSessions"

    ;
    align-items: center;
    justify-items: center;

}

* {
    font-size: 8rem;
    font-family: "Antonio", sans-serif;
    color: #d2d2d2;
}
</style>