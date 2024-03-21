<template>


    <div class="container">

        <NavBar />


        <div class="container--movie" v-if="fetchMovieIsDone" :style="{
            backgroundImage: `url(${movie_session.poster_bg1})`,
            backgroundSize: 'cover',
            backgroundPosition: 'center',
            backgroundRepeat: 'no-repeat'
        }" @click="open_seats_panel()" @double-click="open_seats_panel()">
            <div class="movie--typedText title fade-in">
                <span id="typed-text">{{ textTyped }}</span><span class="cursor" id="cursor">|</span>
            </div>
        </div>

        <div class="container--seats" id="container--seats">
            <div class="seats--cont">
                <div v-for="seat in  seats" :key="seat.id" class="seat--cont" @click="seat_selected(seat)"
                    @double-click="seat_selected(seat)">

                    <svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 -960 960 960" width="24"
                        class="seat--icon available" :class="{ 'seat--clicked': isSelected(seat.id) }"
                        v-if="seat.status === 'available' && seat.vip === 'false'">
                        <path
                            d="M160-120v-240h640v240h-80v-160H240v160h-80Zm20-280q-25 0-42.5-17.5T120-460q0-25 17.5-42.5T180-520q25 0 42.5 17.5T240-460q0 25-17.5 42.5T180-400Zm100 0v-360q0-33 23.5-56.5T360-840h240q33 0 56.5 23.5T680-760v360H280Zm500 0q-25 0-42.5-17.5T720-460q0-25 17.5-42.5T780-520q25 0 42.5 17.5T840-460q0 25-17.5 42.5T780-400Zm-420-80h240v-280H360v280Zm0 0h240-240Z" />
                    </svg>

                    <svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 -960 960 960" width="24"
                        class="seat--icon booked" v-if="seat.status === 'booked' && seat.vip === 'false'">
                        <path
                            d="M160-120v-240h640v240h-80v-160H240v160h-80Zm20-280q-25 0-42.5-17.5T120-460q0-25 17.5-42.5T180-520q25 0 42.5 17.5T240-460q0 25-17.5 42.5T180-400Zm100 0v-360q0-33 23.5-56.5T360-840h240q33 0 56.5 23.5T680-760v360H280Zm500 0q-25 0-42.5-17.5T720-460q0-25 17.5-42.5T780-520q25 0 42.5 17.5T840-460q0 25-17.5 42.5T780-400Zm-420-80h240v-280H360v280Zm0 0h240-240Z" />
                    </svg>

                    <svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 -960 960 960" width="24"
                        v-if="seat.status === 'available' && seat.vip === 'true'" class="seat--icon available"
                        :class="{ 'seat--clicked': isSelected(seat.id) }">
                        <path
                            d="M200-120q-17 0-28.5-11.5T160-160v-40q-50 0-85-35t-35-85v-200q0-50 35-85t85-35v-80q0-50 35-85t85-35h400q50 0 85 35t35 85v80q50 0 85 35t35 85v200q0 50-35 85t-85 35v40q0 17-11.5 28.5T760-120q-17 0-28.5-11.5T720-160v-40H240v40q0 17-11.5 28.5T200-120Zm-40-160h640q17 0 28.5-11.5T840-320v-200q0-17-11.5-28.5T800-560q-17 0-28.5 11.5T760-520v160H200v-160q0-17-11.5-28.5T160-560q-17 0-28.5 11.5T120-520v200q0 17 11.5 28.5T160-280Zm120-160h400v-80q0-27 11-49t29-39v-112q0-17-11.5-28.5T680-760H280q-17 0-28.5 11.5T240-720v112q18 17 29 39t11 49v80Zm200 0Zm0 160Zm0-80Z" />
                    </svg>

                    <svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 -960 960 960" width="24"
                        v-if="seat.status === 'booked' && seat.vip === 'true'" class="seat--icon booked">
                        <path
                            d="M200-120q-17 0-28.5-11.5T160-160v-40q-50 0-85-35t-35-85v-200q0-50 35-85t85-35v-80q0-50 35-85t85-35h400q50 0 85 35t35 85v80q50 0 85 35t35 85v200q0 50-35 85t-85 35v40q0 17-11.5 28.5T760-120q-17 0-28.5-11.5T720-160v-40H240v40q0 17-11.5 28.5T200-120Zm-40-160h640q17 0 28.5-11.5T840-320v-200q0-17-11.5-28.5T800-560q-17 0-28.5 11.5T760-520v160H200v-160q0-17-11.5-28.5T160-560q-17 0-28.5 11.5T120-520v200q0 17 11.5 28.5T160-280Zm120-160h400v-80q0-27 11-49t29-39v-112q0-17-11.5-28.5T680-760H280q-17 0-28.5 11.5T240-720v112q18 17 29 39t11 49v80Zm200 0Zm0 160Zm0-80Z" />
                    </svg>

                </div>
            </div>

            <div class="container--movieInfoPanel" v-if="fetchMovieIsDone && seatPanelOpened">
                <h1 class="movieInfoPanel--title">{{ movie_session.title }} {{ movie_session.showing_date }}</h1>
                <img :src="`${movie_session.poster}`" alt="" class="poster">
            </div>

            <div class="container--buttonContainer">
                <button class="buttonContainer--button" id="buttonContainer--button" @click="purchase_seats()"
                    @double-click="purchase_seats()">
                    COMPRAR
                </button>
                <button id="cancel_purchase" class="buttonContainer--button-cancel">
                    <img src="/icons/cancel.svg" alt="">
                </button>
            </div>

        </div>


        <Loading :isLoading="!fetchSeatsOfMovieIsDone || !fetchMovieIsDone" />


        <Footer />




    </div>

</template>



<script>

export default {
    data() {
        return {
            movie_session: null,
            fetchMovieIsDone: false,
            seats: [],
            fetchSeatsOfMovieIsDone: false,
            selected_seats: [],
            index: 0,
            text: "Click i compra!",
            textTyped: "",
            isDeleting: false,
            seatPanelOpened: false,
            url_movies: `http://localhost:8000/api/movies/${this.$route.params.id}`,
            url_seats: `http://localhost:8000/api/seats/${this.$route.params.id}`,
        }

    },
    methods: {
        fetchDataMovies() {
            fetch(this.url_movies)
                .then(response => response.json())
                .then(data => {
                    if (data) {
                        this.movie_session = data;
                        this.fetchMovieIsDone = true;
                    } else {
                        console.log('ERROR FETCHING DATA');
                    }
                })
                .catch(error => {
                    console.error(error);
                });
        },
        fetchDataSeats() {
            fetch(this.url_seats)
                .then(response => response.json())
                .then(data => {
                    if (data) {
                        this.seats = data;
                        this.fetchSeatsOfMovieIsDone = true;
                    } else {
                        console.log('ERROR FETCHING DATA');
                    }
                })
                .catch(error => {
                    console.error(error);
                });
        },
        seat_selected(seat) {
            if (seat.status === 'booked') {
                return
            }
            const index = this.selected_seats.findIndex(s => s.id === seat.id);

            if (index === -1) {
                this.selected_seats.push(seat);
            } else {
                this.selected_seats.splice(index, 1);
            }
        },
        isSelected(id) {
            return this.selected_seats.some(seat => seat.id === id);
        },
        typeText() {
            if (!this.isDeleting && this.index < this.text.length) {
                this.textTyped += this.text.charAt(this.index);
                this.index++;
            } else if (this.index > 0) {
                this.isDeleting = true;
                this.textTyped = this.text.substring(0, this.index - 1);
                this.index--;
            } else {
                this.isDeleting = false;
            }
        },
        open_seats_panel() {
            this.seatPanelOpened = true;
            document.getElementById('container--seats').style.display = 'grid';
            document.getElementById('typed-text').style.display = 'none';
            document.getElementById('cursor').style.display = 'none';


        },
        purchase_seats() {
            if (this.selected_seats.length === 0) {
                alert('Selecciona alguna butaca')
                return;
            }
            const userStore = useStore();
            userStore.save_seats(this.selected_seats);
            userStore.save_movie_id(this.$route.params.id);
            userStore.save_movie_date(this.movie_session.showing_date);
            navigateTo('/checkout');

        },
    },
    created() {
        const store = useStore();
        if (store.return_isAdmin() === true) {
            navigateTo('/admin');
        }


    },
    mounted() {
        this.fetchDataMovies();
        this.fetchDataSeats();
        setInterval(() => {
            this.typeText();
        }, 130);
    },

}

</script>





<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Antonio:wght@100..700&family=Germania+One&display=swap');

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0px;
    overflow: hidden;

}

@keyframes slideIn {
    0% {
        transform: translateX(-100%);
    }

    100% {
        transform: translateX(0);
        opacity: 1;
    }
}

.title {
    font-family: "Germania One", system-ui;
    font-weight: 00;
    font-style: normal;
    font-size: 200px;
    color: #86c01bad;
    text-shadow: 1px 1px 0px #e7eb13e8;
    animation: slideIn 0.5s forwards;
    opacity: 0;
    margin: 300px;

}

.container {
    display: grid;
    grid-template-areas:
        "nav"
        "movie";
    grid-template-rows: 1fr;
    height: auto;
    background-color: #0e0d0d;

}


.container--movie {
    background-color: #0e0d0d;
    height: 80vh;
    align-items: center;
    text-align: center;
    justify-content: center;
    display: inline-block;
    cursor: pointer;
    z-index: 99;
    grid-area: movie;
}

.container--movie::after {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
}


.poster {
    width: 350px;
    height: auto;
    margin: 10px;
}

.movieInfoPanel--title {
    font-size: 3.5em;
    font-family: "Germania One", system-ui;
    font-style: normal;
    color: #9ebd16;
    margin: 10px;
}

.container--seats {
    display: none;
    width: 100%;
    background-color: #000000cc;
    z-index: 101;
    align-items: center;
    justify-content: center;
    align-items: center;
    grid-area: movie;
    grid-template-areas:
        ". seats movie-info ."
        ". btn . ."
    ;

    grid-template-columns: 0.5fr 1fr 1fr 0.5fr;
    grid-template-rows: 1fr 0.3fr;

}

.container--movieInfoPanel {
    grid-area: movie-info;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    text-align: center;
    font-family: "Antonio", sans-serif;
    font-weight: 900;
    font-style: normal;
    color: #adbd22ad;


}







.seats--cont {
    grid-area: seats;
    grid-template-columns: repeat(10, 60px);
    grid-template-rows: repeat(12, 60px);
    height: auto;
    animation: appear 0.5s ease-in-out;
    display: grid;
    align-items: end;
    height: 500px;

    overflow-y: scroll;

}

/* css for scrollbars */

::-webkit-scrollbar {
    grid-area: scroll;
    background-color: #272626;
    width: 10px;
    border-radius: 10px;
}

::-webkit-scrollbar-thumb {
    background: #eb0000cb;
    border-radius: 10px;
}




@keyframes appear {
    0% {
        opacity: 0;
    }

    100% {
        opacity: 1;
    }
}


.seat--cont:hover {
    cursor: pointer;
}

.seat--icon {
    width: 50px;
    height: 50px;
    background-color: #4440408f;
    border-radius: 50%;
    padding: 6px;

}

.booked {
    fill: #eb0000cb;
}

.available {
    fill: #eeeeeec7;
}




.seat--clicked {
    background-color: #7dd38f93;
    transition: background-color 0.3s ease-out;
}





.container--buttonContainer {
    display: flex;
    justify-content: space-evenly;
    align-items: center;
    margin: 10px;
    grid-area: btn;
}


.buttonContainer--button {
    border: none;
    border-color: #000000;
    padding: 15px 40px;
    border-radius: 10px;
    background-color: #e06a6a9a;
    color: #d1d8d2;
    font-size: 3rem;
    font-weight: 900;
    cursor: pointer;
    transition: color 0.2s ease-in-out;


}

.buttonContainer--button-cancel {
    display: flex;
    width: auto;
    height: auto;

    background-color: transparent;
    border: none;
    background-color: #e06a6a9a;
    border-radius: 50%;
    padding: 4px;
}

.buttonContainer--button-cancel img {
    width: 70px;
}

button:hover {
    color: rgb(0, 0, 0);


}
</style>
