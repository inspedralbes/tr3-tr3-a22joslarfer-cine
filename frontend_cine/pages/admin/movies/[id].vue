<template>
    <div v-if="isAdmin && !isLoading">
        <button class="button--turnBack" @click="turnBackToCRUD()">BACK</button>
        <form @submit.prevent="fetchEditMovie" ref="form">
            <input type="text" v-model="title" :placeholder="movie.title" required>
            <input type="number" v-model="year" :placeholder="movie.year" required>
            <input type="number" v-model="rating" :placeholder="movie.rating" required step="0.1">
            <input type="text" v-model="poster" :placeholder="movie.poster" required>
            <input type="text" v-model="poster_bg1" :placeholder="movie.poster_bg1" required>
            <input type="text" v-model="poster_bg2" :placeholder="movie.poster_bg2" required>

            <textarea v-model="synopsis" :placeholder="movie.synopsis" required></textarea>
            <input type="number" v-model="genre_id" :placeholder="movie.genre_id" required>
            <input type="date" v-model="showing_date" required :placeholder="movie.showing_date">
            <button type="submit" style="display: none;"></button>
        </form>
        <button type="submit" class="button--edit" @click="submit_form()">EDIT</button>

    </div>
</template>

<script>
export default {
    data() {
        return {
            movie: [],
            url_movie: `http://localhost:8000/api/movies/${this.$route.params.id}`,
            url_movie_update: `http://localhost:8000/api/movies/${this.$route.params.id}`,
            isAdmin: false,
            isLoading: true,
        }
    },
    methods: {
        fetchShowMovie() {
            fetch(this.url_movie)
                .then(response => response.json())
                .then(data => {
                    if (data) {
                        this.movie = data;
                        console.log('data movies', this.movie);
                        this.fetchMoviesIsDone = true;
                    } else {
                        console.log('ERROR FETCHING DATA');
                    }
                })
                .catch(error => {
                    console.error(error);
                });
        },
        fetchEditMovie() {
            // Route::put('movies/{id}', [App\Http\Controllers\MovieController::class, 'update']);
            fetch(this.url_movie_update, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    title: this.title,
                    year: this.year,
                    rating: this.rating,
                    poster: this.poster,
                    poster_bg1: this.poster_bg1,
                    poster_bg2: this.poster_bg2,
                    synopsis: this.synopsis,
                    genre_id: this.genre_id,
                    showing_date: this.showing_date,
                }),
            })
                .then(response => response.json())
                .then(data => {
                    if (data) {
                        console.log('data movies', data);
                        navigateTo('/admin');
                    } else {
                        console.log('ERROR FETCHING DATA');
                    }
                })
                .catch(error => {
                    console.error(error);
                });
        },
        turnBackToCRUD(){
            navigateTo('/admin/movies');
        },
        submit_form(){
            this.fetchEditMovie();
        }

    },
    mounted() {
        this.fetchShowMovie();
    },
    beforeMount() {
        const store = useStore();
        if (typeof window !== 'undefined' && (store.return_isAdmin() === false || localStorage.getItem('priviledgeState') === 'user')) {
            navigateTo('/login');
        } else {
            this.isAdmin = true;
        }
        this.isLoading = false;
    },
    
}
</script>

<style scoped>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Antonio', sans-serif;

    font-weight: 900;
}

div {
    height: auto;
    background-color: #d1d8d2;
    display: grid;
    grid-template-rows: auto auto;
    grid-template-areas:
        "edit"
        "form"
        "turnBack"
    ;



}

form {
    grid-area: form;
    display: grid;
    flex-direction: column;
    
    align-content: center;
    width: 50%;
    gap: 30px;
    height: auto;
    padding: 30px 30px;
    margin: 50px auto;
    border-radius: 25px;
    text-align: center;
    background-color: #1c1c1c;
    font-weight: 900;
    box-shadow: 0 0 4px 0px #1c1c1c;
}

button {
    height: 100px;
    padding: 10px;
    border: none;
    font-size: 2.5rem;
    background-color: #292626;
    cursor: pointer;
    color: #d2d2d2;

    width: 100%;
}

input,
textarea {
    display: flex;
    justify-content: center;
    width: 100%;
    font-size: 2rem;
    border-radius: 10px;
    border: none;
    color: #1c1c1c;
    background-color: #d1d8d2;
    ;
    text-align: center;
    transition: border-bottom 0.05s ease-in-out;
}

input:nth-child(odd),
textarea {
    background-color: #473d3de5;

}

input:nth-child(even) {
    background-color: #643737d8;

}

input:focus,
textarea:focus {
    outline: none;
    border-bottom: 3px solid #888484;
}

input::placeholder,
textarea::placeholder {
    color: #888484;
}

input[type="date"] {
    color: #888484;
}

textarea {
    resize: none;
    
}
::-webkit-scrollbar {
    grid-area: scroll;
    background-color: #bdbaba;
    width: 10px;
    border-radius: 10px;
}

::-webkit-scrollbar-thumb {
    background: #3604047a;
    border-radius: 10px;
}




.button--turnBack {
    grid-area: turnBack;
    transition: color 0.2s ease-in-out;
}

.button--turnBack:hover {
    color: #ffffff;

}


.button--edit {
    grid-area: edit;

    position: sticky;
    top: 0;
    color: rgb(74, 107, 71);
    transition: color 0.2s ease-in-out;
}

.button--edit:hover {
    color: rgb(113, 202, 105);

}

input[type=number]::-webkit-inner-spin-button {
    -webkit-appearance: none;
}
</style>