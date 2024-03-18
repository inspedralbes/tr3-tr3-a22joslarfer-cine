<template>


    <div class="container">

        <NavBar />


        <div class="div-movie-cont" v-if="fetchMovieIsDone" :style="{
            backgroundImage: `url(${movie_session.poster_bg1})`,
            backgroundSize: 'cover',
            backgroundPosition: 'center',
            backgroundRepeat: 'no-repeat'
        }" @click="open_seats_panel()" @double-click="open_seats_panel()">
            <div class="div-typedText-cont title fade-in">
                <span id="typed-text">{{ textTyped }}</span><span class="cursor" id="cursor">|</span>
            </div>
        </div>

        <div class="div-seats-movie-cont" id="div-seats-movie-cont">
            <div class="div-seat-cont">
                <div v-for="seat in  seats" :key="seat.id" class="div-seat" @click="seat_selected(seat)"
                    @double-click="seat_selected(seat)">

                    <img src="/icons/white-seat.png" alt="" srcset="" class="seat-icon"
                        :class="{ 'seat--clicked': isSelected(seat.id) }" v-if="seat.status === 'available'">


                    <img src="/icons/seat_unavaliable.png" alt="" srcset="" class="booked"
                     v-if="seat.status === 'booked'">

                </div>
            </div>

            <div class="div-movie-info-cont" v-if="fetchMovieIsDone && seatPanelOpened">
                <h1 class="title-minor">{{ movie_session.title }} {{ movie_session.showing_date }}</h1>
                <img :src="`${movie_session.poster}`" alt="" class="poster">
            </div>

            <div class="div-btn-buy-cont">
                <button class="btn-buy" id="btn-buy" @click="purchase_seats()" @double-click="purchase_seats()">
                    COMPRAR
                </button>
                <button id="cancel_purchase" class="btn-buy-cancel">
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
            movie_session_id: null,
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
        }

    },
    head() {
        return {

            link: [

            ]
        }
    },
    methods: {
        fetchData() {
            fetch(`http://localhost:8000/api/movies/${this.movie_session_id}`)
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
            fetch(`http://localhost:8000/api/seats/${this.movie_session_id}`)
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
            document.getElementById('div-seats-movie-cont').style.display = 'grid';
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
        this.movie_session_id = this.$route.params.id;
        this.fetchData();
        this.fetchDataSeats();

    },
    mounted() {

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
    font-family: "Antonio", sans-serif;
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


.div-movie-cont {
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

.div-movie-cont::after {
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

.title-minor {
    font-size: 3.5em;
    font-family: "Germania One", system-ui;
    font-style: normal;
    color: #9ebd16;
    margin: 10px;
}

.div-seats-movie-cont {
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

.div-movie-info-cont {
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







.div-seat-cont {
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


.div-seat:hover {
    cursor: pointer;
}

.seat-icon, .booked {
    width: 50px;
    height: 50px;
    background-color: #4440408f;
    border-radius: 50%;
    padding: 6px;
}



.seat--clicked {
    background-color: #c9c9c996;
    transition: background-color 0.3s ease;
}





.div-btn-buy-cont {
    display: flex;
    justify-content: space-evenly;
    align-items: center;
    margin: 10px;
    grid-area: btn;
}


.btn-buy {
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

.btn-buy-cancel {
    display: flex;
    width: auto;
    height: auto;
    
    background-color: transparent;
    border: none;
    background-color: #e06a6a9a;
    border-radius: 50%;
    padding: 4px;
}

.btn-buy-cancel img {
    width: 70px;
}

button:hover {
    color: rgb(0, 0, 0);


}
</style>
