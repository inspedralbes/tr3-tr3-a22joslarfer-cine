<template>


    <div class="container" v-if="isAdmin">
        <NavBar />

        <div class="container--table">
            <table>
                <thead>
                    <tr>
                        <th>Genre ID</th>
                        <th>ID</th>
                        <th>Poster</th>
                        <th>Poster Background 1</th>
                        <th>Poster Background 2</th>
                        <th>Rating</th>
                        <th>Showing Date</th>
                        <th>Synopsis</th>
                        <th>Title</th>
                        <th>Year</th>
                        <th>Delete</th>
                        <th>Create</th>
                        <th>Show</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="item in movies" :key="item.id">
                        <td>{{ item.genre_id }}</td>
                        <td>{{ item.id }}</td>
                        <td>

                            <nuxt-img :src="item.poster" alt="Description of image" class="table--poster"
                                layout="responsive" format="'webp'" quality="85" />

                        </td>
                        <td>

                            <img :src="item.poster_bg1" alt="" class="table--poster">

                        </td>
                        <td>

                            <img :src="item.poster_bg2" alt="" class="table--poster">


                        </td>
                        <td>{{ item.rating }}</td>
                        <td>{{ item.showing_date }}</td>
                        <td class="table--synopsis">{{ item.synopsis }}</td>
                        <td>{{ item.title }}</td>
                        <td>{{ item.year }}</td>
                        <td><button class="table--button-delete" @click="deleteSelectedItem(item.id)">Delete</button>
                        </td>
                        <td><button class="table--button-create" @click="createMovie()">Create</button></td>
                        <td><button class="table--button-show" @click="showSelectedItem(item.id)">Show</button></td>

                    </tr>
                </tbody>
            </table>

        </div>



        <Footer />
    </div>
</template>

<script>
export default {
    data() {
        return {
            movies: [],
            fetchMoviesIsDone: false,
            url_movies: `http://localhost:8000/api/movies`,
            isAdmin: false,
        }
    },
    methods: {
        fetchMovies() {
            fetch(this.url_movies)
                .then(response => response.json())
                .then(data => {
                    if (data) {
                        this.movies = data;
                        console.log('data movies', this.movies);
                        this.fetchMoviesIsDone = true;
                    } else {
                        console.log('ERROR FETCHING DATA');
                    }
                })
                .catch(error => {
                    console.error(error);
                });
        },
        deleteSelectedItem(id) {
            this.delete_id = id;
            console.log('delete id', this.delete_id)
            fetch(`http://localhost:8000/api/movie/${id}`, {
                method: 'DELETE',
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    console.log(data);
                    this.movies = this.movies.filter(movie => movie.id !== id);

                })
                .catch(error => {
                    alert('ERROR DELETE PELICULA');
                    console.log(error)
                });
        },
        createMovie() {
            navigateTo('/admin/create');
        },
        showSelectedItem(id) {
            navigateTo(`/admin/${id}/`);
        }
    },
    mounted() {
        localStorage.getItem('priviledgeState') === 'admin' ? this.isAdmin = true : this.isAdmin = false;
        if(this.isAdmin === false) navigateTo('/login');



        this.fetchMovies();


    },
    created() {

    },
}
</script>

<style scoped>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Antonio', sans-serif;
}

.container {
    display: grid;
    align-items: center;

    text-align: center;
    height: auto;

}

.table--poster {
    width: 200px;
    height: 200px;
    object-fit: cover;
    border-radius: 30px;
    margin: 0px;
    border: 4px solid #1c1c1c;
    ;

}


.table--synopsis {
    font-size: 20px;
}

.container--table {
    display: flex;
    justify-content: center;
    align-items: center;
}

table {
    width: 100%;
    border-collapse: collapse;
    border-spacing: 0;
    font-size: 1.5rem;
}

th {
    background-color: #1c1c1c;
    padding: 30px;
    color: #d2d2d2;
    font-weight: bold;
    position: sticky;
    top: 0;

}

td {
    padding: 8px;
    text-align: center;
    border-bottom: 4px solid #1b1919;
    color: #d2d2d2;

}

tr:nth-child(even) {
    background-color: #643737;

}

tr:nth-child(odd) {
    background-color: #473d3d;
    ;
}

button {
    color: #1c1c1c;
    border: none;
    padding: 100px 20px;
    border-radius: 10px;
    cursor: pointer;
    border: 4px solid #1f1c1c;
    transition: color 0.1s ease-in-out;
}

.table--button-delete {
    background-color: #993535;
}

.table--button-show {
    background-color: #be810e;
}

.table--button-create {
    background-color: #6b976b;
}

.table--button-delete:hover,
.table--button-create:hover,
.table--button-show:hover {
    color: #d2d2d2;

}
</style>