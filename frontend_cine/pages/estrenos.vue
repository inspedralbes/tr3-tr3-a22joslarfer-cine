<template>
    <div class="container">
        <NavBar />


        <div class="container--moviesContainer">
            <div class="moviesContainer--item" v-for="estreno in  estrenos " :key="estreno.id"
                @click="navigate_to_session(estreno.id)">


                <nuxt-img :src="`${estreno.poster}`" alt="Description of image" class="item--poster" width="500"
                    sizes="(max-width: 640px) 100vw, (max-width: 768px) 50vw, 500px" placeholder fit="contain"
                    preload
                    layout="responsive" height="750" format="'webp'" quality="85"  />


                <div class="item--infoContainer">
                    <p class="infoContainer--synopsis">{{ estreno.synopsis }}</p>
                    <p class="infoContainer--date">{{ estreno.showing_date }}</p>
                    <p class="infoContainer--year">{{ estreno.year }}</p>
                    <p class="infoContainer--rating">{{ estreno.rating }}</p>
                    <h2 class="infoContainer--title">{{ estreno.title }}</h2>
                </div>

            </div>


        </div>
        
        <Loading :isLoading="!fetchSessionsIsDone" /> 
        

        <Footer />


    </div>
</template>



<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Antonio:wght@100..700&family=Germania+One&display=swap');



* {
    box-sizing: border-box;
    font-family: "Antonio", sans-serif;
    margin: 0;
    padding: 0px;
    overflow: hidden;

}


.container {
    height: auto;
    background-color: #d1d8d2;
  
 
}
nav{
    grid-area: nav;
}
footer{
    grid-area: footer;
}

.container--moviesContainer {
    display: grid;
    grid-template-rows: auto;
    grid-template-columns: auto auto auto;
    grid-gap: 20px;
    grid-area: moviesPanel;

}

.moviesContainer--item {
    margin: 30px;
    padding: 20px;
    display: grid;
    height: auto;
    color: #eeeeee;
    text-align: center;
    border-radius: 20px;
    grid-template-rows: auto;
    background-color: black;
    grid-gap: 20px;
    position: relative;
    cursor: pointer;
    transition: transform 0.3s ease;


}

.item--infoContainer {
    opacity: 0;
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    background-color: rgba(0, 0, 0, 0.836);
    transform: translateY(-100%);
    transition: opacity 0.3s ease, transform 0.3s ease;

}

.moviesContainer--item:hover .item--infoContainer {
    opacity: 1;
    transform: translateY(0px);
    border-radius: 12px;
    height: 400px;
}


.infoContainer--title {
    font-size: 3.5em;
    overflow: visible;
    font-weight: 900;
    margin: 10px;
}

.infoContainer--year,
.infoContainer--rating,
.infoContainer--synopsis,
.infoContainer--date {
    font-size: 1.5em;
    margin-top: 20px;
    color: #eeeeee;
}



.item--poster {

    margin: auto;
    border-radius: 30px;
}



.infoContainer--synopsis {
    margin-top: 50px;
    margin-left: 100px;
    margin-right: 100px;
    font-variant: small-caps;
    font-size: 25px;

}


/* media querys */
@media only screen and (min-device-width: 320px) and (max-device-width: 500px) {
    /* Styles for smartphones */
    .container--moviesContainer {
        grid-template-columns: 1fr;

        
    }
    .moviesContainer--item{
        margin: 10px;
       
    }
    .item--poster{
        width: 100%;
        height: 100%;
    }


}
@media only screen and (min-device-width: 500px) and (max-device-width: 1250px) {
    .container--moviesContainer {
        grid-template-columns: 1fr 1fr;
        gap: 0px;
    }
    .moviesContainer--item{
        margin: 10px;
       
    }
    .item--poster{
        width: 100%;
        height: 100%;
    }
}
@media only screen and (min-device-width: 1250px) and (max-device-width: 1880px) {
    /* Styles for smartphones */
    .container--moviesContainer {
        grid-template-columns: 1fr 1fr 1fr;
        
    }
    .item--poster{
        width: 100%;
        height: 100%;
    }


}
</style>

<script>
export default {
    data() {
        return {
            estrenos: [],
            user_id: null,
            fetchSessionsIsDone: false,
            url_sessions: 'http://localhost:8000/api/estrenos',

        }
    },
    methods: {
        fetchDataSessions() {
            fetch(this.url_sessions)
                .then(response => response.json())
                .then(data => {
                    if (data) {
                        this.estrenos = data;
                        this.fetchSessionsIsDone = true;
                    } else {
                        console.log('ERROR FETCHING DATA');
                    }
                })
                .catch(error => {
                    console.error(error);
                });
        },
        navigate_to_session(id) {
            navigateTo(`/${id}`);
        },
    },
    mounted() {
        this.fetchDataSessions();
    },
    created(){
        const store = useStore();
        if (typeof window !== 'undefined' && (store.return_isAdmin() === true || localStorage.getItem('priviledgeState') === 'admin')) {
            navigateTo('/admin');
        }
    }

}

</script>