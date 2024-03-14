<template>


    <div class="container">

        <NavBar />
       

        <div class="div-movie-cont" v-if="fetch_is_done" :style="{
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
                <div v-for="seat in  seats" :key="seat.id" class="div-seat"
                    :class="{ 'div-seat--clicked': isSelected(seat.id) }" @click="seat_selected(seat)"
                    @double-click="seat_selected(seat)">

                    <img src="/icons/white-seat.png" alt="" srcset="" class="seat-icon"
                        v-if="seat.status === 'available'">

                    <img src="/icons/seat_unavaliable.png" alt="" srcset="" class="seat-icon"
                        v-if="seat.status === 'unavailable'">

                </div>
            </div>

            <div class="div-movie-info-cont" v-if="fetch_is_done && seatPanelOpened">
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

        <Footer />
       



    </div>

</template>



<script>



export default {
    data() {
        return {
            movie_session_id: null,
            movie_session: null,
            fetch_is_done: false,
            seats: [],
            fetchSeats_is_done: false,
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
        fetchDataSeats() {
            fetch(`http://localhost:8000/api/seats/${this.movie_session_id}`)
                .then(response => response.json())
                .then(data => {
                    if (data) {
                        this.seats = data;
                        console.log('SESSION', this.seats);
                        console.log('DATA', data);
                        this.fetchSeats_is_done = true;
                    } else {
                        console.log('ERROR FETCHING DATA');
                    }
                })
                .catch(error => {
                    console.error(error);
                });
        },
        seat_selected(seat) {
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
            if(this.selected_seats.length === 0){
                alert('Selecciona alguna butaca')
                return;
            }
            const userStore = useStore();
            userStore.save_seats(this.selected_seats);
            
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
        ". btn btn ."
    ;
    grid-template-columns: 0.5fr 1fr 1fr 0.5fr;
    grid-template-rows: 1fr 0.1fr;

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
    text-shadow: 4px 2px 0px #89fd053d;

}







.div-seat-cont {
    grid-area: seats;
    grid-template-columns: repeat(10, 60px);
    grid-template-rows: repeat(12, 60px);
    height: auto;
    margin: 12px;
    animation: appear 0.5s ease-in-out;
    display: grid;

}

@keyframes appear {
    0% {
        opacity: 0;
    }

    100% {
        opacity: 1;
    }
}

.div-seat {
    display: flex;
    border-radius: 40px;
    justify-content: center;
}

.div-seat:hover {
    cursor: pointer;
}

.seat-icon {
    width: 40px;
    height: 40px;
    margin: auto;
}


.div-seat--clicked {
    background-color: #9ebd16c4;
}


.div-btn-buy-cont {
    display: flex;
    justify-content: space-evenly;
    align-items: center;
    margin: 10px;
    grid-area: btn;
}

.btn-buy {
    background-color: #2c2c2cd2;
    border-bottom: none;
    border-right: none;
    padding: 20px;
    border-radius: 10px;
    color: #fff;
    width: 50%;
    font-size: 1.9em;
    transition: color 0.1s ease;
    cursor: pointer;
}

.btn-buy-cancel {
    height: 60px;
    width: 60px;
    border: none;
    background-color: #191a19d2;
    border-radius: 50%;
    cursor: pointer;
    transition: color 0.1s ease;
    border-top: 2px solid rgb(80, 78, 78);


}

.btn-buy:hover {
    color: rgb(145, 194, 30);
}

.btn-buy-cancel:hover {
    background-color: #d1d8d257;
}
</style>
