<template>
    <div class="div-movie-cont" v-if="fetch_is_done" :style="{ backgroundImage: `url(${movie_session.poster_bg1})` }">
        <div class="div-info-cont" >

            <h2 class="title">{{ movie_session.title }}</h2>
            <p class="year">{{ movie_session.year }}</p>
            <p class="rating">{{ movie_session.rating }}</p>
            <p class="synopsis">{{ movie_session.synopsis }}</p>
            <p class="date">{{ movie_session.showing_date }}</p>
            <p class="genreId">{{ movie_session.genre_id }}</p>
        </div>
    </div>
</template>



<style>

.div-movie-cont {
    grid-area: div-movie-cont;
    display: flex;
    flex-direction: column;
    border-radius: 10px;
    max-width: 600px;
    background-color: #fff;
    align-items: center;
    text-align: center;

}

.title {
    font-size: 3em;
    margin: 10px;
}

.year {
    font-size: 1.5em;
    margin: 10px;
}

.rating {
    font-size: 1.5em;
    margin: 10px;
}

.synopsis {
    font-size: 1.5em;
    margin: 10px;
}

.date {
    font-size: 1.5em;
    margin: 10px;
}

.poster {
    border-radius: 16px;
    width: 400px;
    height: 600px;

}

</style>