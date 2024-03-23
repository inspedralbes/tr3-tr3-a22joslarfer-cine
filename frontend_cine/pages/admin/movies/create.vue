<template>
    <div v-if="!isLoading && isAdmin">
        <button class="button--turnBack" @click="navigateToDisplayMoviesAdmin()">BACK</button>
        <form @submit.prevent="fetchCreateMovie" ref="form">
            <input type="text" v-model="title" placeholder="Title" required>
            <input type="number" v-model="year" placeholder="Year" required>
            <input type="number" v-model="rating" placeholder="Rating" required step="0.1">
            <input type="text" v-model="poster" placeholder="Poster URL" required>
            <input type="text" v-model="poster_bg1" placeholder="Poster Bg1" required>
            <input type="text" v-model="poster_bg2" placeholder="Poster Bg2" required>

            <textarea v-model="synopsis" placeholder="Synopsis" required></textarea>
            <input type="number" v-model="genre_id" placeholder="Genre ID" required>
            <input type="date" v-model="showing_date" required>
            <button type="submit" style="display: none;"></button>
        </form>
        <button type="submit" class="button--create" @click="submitFormCreateMovie()">CREATE</button>

    </div>
</template>

<script>
export default {
    data() {
        return {
            title: '',
            year: null,
            rating: null,
            poster: '',
            synopsis: '',
            genre_id: null,
            showing_date: '',
            poster_bg1: '',
            poster_bg2: '',
            url_create: `http://localhost:8000/api/movie`,
            isAdmin: false,
            isLoading: true,
        }
    },
    methods: {
        submitFormCreateMovie() {
            this.fetchCreateMovie();

        },
        fetchCreateMovie() {
            console.log('fetching create movie');
            console.log('poster 1', this.poster_bg1);
            console.log('poster 2', this.poster_bg2);
            console.log('poster', this.poster);
            fetch(this.url_create, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                  
                },
                
                body: JSON.stringify({
                    title: this.title,
                    year: this.year,
                    rating: this.rating,
                    poster_bg1: this.poster_bg1,
                    poster_bg2: this.poster_bg2,
                    poster: this.poster,
                    synopsis: this.synopsis,
                    genre_id: this.genre_id,
                    showing_date: this.showing_date,

                })
            })
                .then(response => response.json())
                .then(data => {
                    console.log(data);
                    
                    navigateTo('/admin');



                })
                .catch(error => {
                    console.error('Error:', error);
                });
        },
        navigateToDisplayMoviesAdmin(){
            navigateTo('/admin/movies');
        },
    },
    beforeMount() {
        const store = useStore();
        this.isAdmin = store.return_isAdmin();
        localStorage.getItem('priviledgeState') === 'admin' ? this.isAdmin = true : this.isAdmin = false;
        if (this.isAdmin === false) navigateTo('/login');

        this.isLoading = false;
        this.isAdmin = true;
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
        "create"
        "form"
        "turnBack"
    ;



}

form {
    grid-area: form;
    display: grid;
    flex-direction: column;
    justify-content: center;
    align-content: center;
    gap: 30px;
    height: auto;
    padding: 30px 100px;
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
    width: 100%;
    height: 50px;
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




.button--turnBack {
    grid-area: turnBack;
    transition: color 0.2s ease-in-out;
}

.button--turnBack:hover {
    color: #ffffff;

}


.button--create {
    grid-area: create;

    position: sticky;
    top: 0;
    color: rgb(74, 107, 71);
    transition: color 0.2s ease-in-out;
}

.button--create:hover {
    color: rgb(113, 202, 105);

}

input[type=number]::-webkit-inner-spin-button {
    -webkit-appearance: none;
}
</style>