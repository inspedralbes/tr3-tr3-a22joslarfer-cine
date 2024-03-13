<template>


    <div class="container">

        <div class="div-movie-cont" v-if="fetch_is_done && fetchSeats_is_done">
            <h2 class="title">{{ movie_session.title }}</h2>
            <img :src="movie_session.poster" alt="" class="poster">
            
        </div>

        <div class="div-seats-cont" id="div-seats-cont" v-if="fetch_is_done && fetchSeats_is_done">
            <div v-for="seat in  seats" :key="seat.id" class="div-seat-cont"
                :class="{ 'div-seat-cont--clicked': isSelected(seat.id) }" @click="seat_selected(seat.id)"
                @double-click="seat_selected(seat.id)">

                <img src="../public/seat.svg" alt="" srcset="" class="seat-icon" v-if="seat.status === 'available'">

                <img src="../public/seat_unavaliable.png" alt="" srcset="" class="seat-icon"
                    v-if="seat.status === 'unavailable'">

            </div>
            <!-- <button class="btn-buy" id="btn-buy" @click="purchase_seats()" @double-click="purchase_seats()">
                COMPRAR
            </button> -->
        </div>

        <div v-if="!fetch_is_done || !fetchSeats_is_done" class="loading-container">
            <img src="../public/loading.svg" alt="" srcset="" class="spinner-icon">
        </div>

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
        seat_selected(id) {
            const index = this.selected_seats.indexOf(id);

            if (index === -1) {
                this.selected_seats.push(id);
            } else {
                this.selected_seats.splice(index, 1);
            }
        },
        isSelected(id) {
            return this.selected_seats.includes(id);
        },
        fetchPurchaseSeats() {
            fetch('http://localhost:8000/api/purchase-seats', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    movie_session_id: this.movie_session_id,
                    selected_seats: this.selected_seats,
                }),
            })
                .then(response => {
                    if (response.ok) {

                        document.getElementById('btn-buy').disabled = false;
                        document.getElementById('div-seats-cont').style.pointerEvents = 'auto';


                    } else {


                    }
                })
                .catch(error => {
                    console.error('Error purchasing seats:', error);
                });

            document.getElementById('btn-buy').disabled = true;
            document.getElementById('div-seats-cont').style.pointerEvents = 'none';
        },
        purchase_seats() {
            if (this.selected_seats.length === 0) {
                alert('No has seleccionat cap seient');
                return;
            }

            //this.fetchPurchaseSeats();

            console.log('Selected seats:', this.selected_seats);



        }
    },
    created() {
        this.movie_session_id = this.$route.params.id;
        this.fetchData();
        this.fetchDataSeats();
    },

}

</script>

<style scoped>
.spinner-icon {
    height: 100px;
    border-top: 4px solid transparent;
    animation: spin 1s linear infinite;
    border: 4px solid #81b3c0d7;
    border-radius: 50%;
    border-top: 4px solid transparent;
    /* Create a circular shape */
    position: absolute;
    top: 40%;
    left: 50%;
    transform: translate(-50%, -50%);
}

@keyframes spin {
    0% {
        transform: rotate(0deg);
    }

    100% {
        transform: rotate(360deg);
    }
}


.container {
    display: grid;
    justify-content: center;
    grid-template-columns: 0.5fr 1fr 3fr;
    grid-template-areas: "div-movie-cont div-movie-cont div-seats-cont";
    height: 50vh;
    margin: 10vh;
}

.btn-buy {
    border: 2px solid black;
    border-radius: 12px;
    background-color: #dddddd62;
    font-size: 2.5em;
    cursor: pointer;

}

.btn-buy:hover {
    box-shadow: 0 0 4px 0 #000000d7;
}

.div-movie-cont {
    grid-area: div-movie-cont;
    display: flex;
    flex-direction: column;
    border-radius: 10px;
    max-height: 700px;
    background-color: #fff;
    align-items: center;
    text-align: center;

}



.div-seats-cont {
    grid-area: div-seats-cont;
    display: grid;
    grid-template-columns: repeat(10, 55px);
    grid-template-rows: repeat(12, 55px);
    padding: 30px;

    border-radius: 10px;
    max-height: 700px;
    background-color: #ffffffbe;
    text-align: center;
}

.div-seat-cont {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin: 5px;
    border-radius: 20px;
    background-color: #fff;
   
}

.div-seat-cont:hover {
    box-shadow: 0 0 2px 0 #000000d7;
    cursor: pointer;
}



.seat-icon {
    width: 40px;
    height: 40px;

}

.div-seat-cont--clicked {
    background-color: #81b3c0d7;

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

nuxt-link {
    text-decoration: none;
    color: black;
}

a {
    text-decoration: none;
    color: black;
}
</style>