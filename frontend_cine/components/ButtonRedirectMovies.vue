<template>
    <div>
        <button class="redirect--movies" @click="goToMoviesControlPanel()">Movies</button>
    </div>


</template>

<script>
export default {
    methods: {
        goToMoviesControlPanel() {
            navigateTo('/admin/movies');
        }
    }
}
</script>

<style scoped>
div {
    display: flex;

    width: 100%;
    height: 100%;
    grid-area: redirectMovies;

}

.redirect--movies:hover {
    background-color: #473d3d;
    color: #d1d8d2;
}

.redirect--movies {
    transition: background-color 0.3s ease-in-out, color 0.1s ease-in-out;
    width: 100%;
    height: 100%;
    background-color: #312929;
    border: 4px solid #1c1c1c;
    color: #1c1c1c;
    cursor: pointer;

}
</style>