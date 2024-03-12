<template>
  
    <div class="div-movie-cont" v-if="fetch_is_done">
        <h2 class="title">{{ movie_session.title }}</h2>
        <p class="year">{{ movie_session.year }}</p>
        <p class="rating">{{ movie_session.rating }}</p>
        <img :src="movie_session.poster" alt="" class="poster">
        <p class="synopsis">{{ movie_session.synopsis }}</p>
        <p class="date">{{ movie_session.showing_date }}</p>
        <p class="genreId">{{ movie_session.genre_id }}</p>

    </div>
</template>

<script>
export default {
    data() {
        return {
            movie_session_id: null,
            movie_session: null,
            fetch_is_done: false
        }
    },
    methods: {
        fetchData() {
            fetch(`http://localhost:8000/api/movies/${this.movie_session_id}`)
                .then(response => response.json())
                .then(data => {
                    if (data) {
                        this.movie_session = data;
                        console.log('SESSION', this.movie_session);
                        console.log('DATA', data);
                        console.log('ID', this.movie_session_id)
                        this.fetch_is_done = true;
                    } else {
                        console.log('ERROR FETCHING DATA');
                    }
                })
                .catch(error => {
                    console.error(error);
                });
        },
    },
    created() {
        this.movie_session_id = this.$route.params.id;
        this.fetchData();
    },

}

</script>

<style lang="scss" scoped>
/* Custom Bootstrap-like CSS */

.container{
    display: flex;
    flex-wrap: wrap;
    justify-content:center;

}

.div-movie-cont{
    display: flex;
    flex-direction: column;
    align-items: center;
    margin: 5px;
    padding: 20px;
    border: 2px solid black;
    border-radius: 10px;
    max-width: 600px;
    background-color: #fff;

}

.title{
    font-size: 3em;
    margin: 10px;
}

.year{
    font-size: 1.5em;
    margin: 10px;
}

.rating{
    font-size: 1.5em;
    margin: 10px;
}



.synopsis{
    font-size: 1.5em;
    margin: 10px;
}

.date{
    font-size: 1.5em;
    margin: 10px;
}

nuxt-link{
    text-decoration: none;
    color: black;
}

a{
    text-decoration: none;
    color: black;
}

    

</style>