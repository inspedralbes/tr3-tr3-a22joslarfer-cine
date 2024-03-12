<template>
    <div class="container">

        <nav>
            <ul>
                <li><nuxt-link to="/" class="nav-link">HOME</nuxt-link></li>
                <li><nuxt-link to="/estrenos" class="nav-link">ESTRENOS</nuxt-link></li>
                <li><a href="" class="nav-link">ABOUT</a></li>
                <li><nuxt-link to="/login" class="nav-link">LOGIN</nuxt-link></li>
                <li><nuxt-link to="/register" class="nav-link">SIGN UP</nuxt-link></li>
            </ul>
        </nav>

        <div v-for="estreno in  estrenos " :key="estreno.id" class="div-movie-cont"
            @click="navigate_to_session(estreno.id)">
            <h2 class="title">{{ estreno.title }}</h2>
            <p class="year">{{ estreno.year }}</p>
            <p class="rating">{{ estreno.rating }}</p>

            <img :src="`${estreno.poster}`" alt="" class="poster">
            <div class="div-summary-date-genre-cont">
                <p class="synopsis">{{ estreno.synopsis }}</p>
                <p class="date">{{ estreno.showing_date }}</p>
                <p class="genreId">{{ estreno.genre_id }}</p>
            </div>
        
       
        </div>
      
       
        <footer></footer>

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

<style scoped>
/* CSS GLOBAL */
* {
    box-sizing: border-box;
    font-family: "Roboto", sans-serif;
    margin: 0;  
    padding: 0px;
    overflow: hidden;
    overflow-y: hidden;
}

nav,
footer {
    background-color: #FAFAFA;
    padding: 50px;
    font-weight: 900;
    justify-content: space-evenly;
    width: 100%;
    display: flex;
}

.searchbar {
    display: block;
    padding: 15px 30px;
    font-size: 25px;
    line-height: 1.5;
    color: #110101c0;
    background-color: #fff;
    border: 2px solid #110101c0;
    border-radius: .25rem;

}

.searchbar::placeholder {
    color: #110101c0;
    font-size: 25px;
}

nav ul {
    list-style-type: none;
    display: flex;
    font-size: 50px

}
nav ul li {
    margin-left: 50px;
}


.nav-link {
    text-decoration: none;
    color: #110101c0;
}

.nav-link:hover {
    color: #579E60;
    transition: color 0.1s ease-in-out;
}

/* EMPIEZA EL CSS PROPIO DE ESTRENOS */

.container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    background-color: #FAFAFA;
    overflow: hidden;
    
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
    color: #eeeeee;
    text-align: center;
    position: relative;
    background-color: black;
  

}
.div-summary-date-genre-cont{
    opacity: 0;
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    background-color: rgba(0, 0, 0, 0.836);
    padding: 10px;
    transform: translateY(100%);
    transition: opacity 0.3s ease, transform 0.3s ease;

}
.div-movie-cont:hover .div-summary-date-genre-cont{
    opacity: 1;
    transform: translateY(0px);
    height: 300px;
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


.poster {
    width: 100%;
    max-height: 850px;
    margin: 10px;
    border-radius: 8px;
}

.synopsis {
    font-size: 1.5em;
    margin: 40px;
    white-space: normal;
    font-variant: small-caps;
    overflow: hidden;

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