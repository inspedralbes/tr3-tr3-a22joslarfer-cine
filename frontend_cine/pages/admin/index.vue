<template>


        <div class="container">
            <NavBar />

            <h2>{{ movie.title }}</h2>
            <p>{{ movie.synopsis }}</p>
            <p>{{ movie.rating }}</p>
            <p>{{ movie.genre_id }}</p>
            <p>{{ movie.showing_date }}</p>
            <p>{{ movie.year }}</p>

            
            <Footer />
        </div>
</template>

<script>
export default {
    data() {
        return {
            movies: [],
            fetchMoviesIsDone: false,
        }
    },
    methods: {
        fetchMovies() {
            fetch('http://localhost:8000/api/movies')
                .then(response => response.json())
                .then(data => {
                    if (data) {
                        this.movies = data;
                        this.fetchMoviesIsDone = true;
                    } else {
                        console.log('ERROR FETCHING DATA');
                    }
                })
                .catch(error => {
                    console.error(error);
                });
        },
    },
    mounted() {
        this.fetchMovies();
    },
}
</script>

<style lang="scss" scoped></style>