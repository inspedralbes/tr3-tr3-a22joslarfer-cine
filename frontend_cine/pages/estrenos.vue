<template>
    <div class="container">

        <div v-for="estreno in  estrenos " :key="estreno.id" class="div-movie-cont"
            @click="navigate_to_session(estreno.id)">
            <h2 class="title">{{ estreno.title }}</h2>
            <p class="year">{{ estreno.year }}</p>
            <p class="rating">{{ estreno.rating }}</p>
            <img :src="estreno.poster" alt="" class="poster">
            <p class="synopsis">{{ estreno.synopsis }}</p>
            <p class="date">{{ estreno.showing_date }}</p>
            <p class="genreId">{{ estreno.genre_id }}</p>
        </div>

    </div>
</template>

<script>
export default {
    data() {
        return {
            estrenos: []
        }
    },
    methods: {
        fetchData() {
            fetch('http://localhost:8000/api/estrenos')
                .then(response => response.json())
                .then(data => {
                    if (data) {
                        this.estrenos = data;
                        console.log('Estrenos', this.estrenos);
                        console.log('Data', data);
                    } else {
                        console.log('ERROR FETCHING DATA');
                    }
                })
                .catch(error => {
                    console.error(error);
                });
        },
        navigate_to_session(id) {
            console.log('yendo a la sesión', id)
            navigateTo(`/${id}`);
            
        },
    },
    mounted() {
        this.fetchData();
    },

}

</script>

<style lang="scss" scoped>
/* Custom Bootstrap-like CSS */

.container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;

}

.div-movie-cont {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin: 5px;
    padding: 20px;
    border: 2px solid black;
    border-radius: 10px;
    max-width: 600px;
    background-color: #fff;
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

nuxt-link {
    text-decoration: none;
    color: black;
}

a {
    text-decoration: none;
    color: black;
}
</style>