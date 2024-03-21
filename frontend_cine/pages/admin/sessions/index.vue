<template>


    <div class="container" v-if="isAdmin && !isLoading">
        <NavBarAdmin />

        <div class="container--table">
            <table>
                <thead>
                    <tr>
                        <th>ID checkout</th>
                        <th>date</th>
                        <th>UP</th>
                        <th>Total</th>
                        <th>ID movie</th>
                        <th>ID usuari</th>
                        <th>ID seient</th>
                        <th>Delete</th>

                    </tr>
                </thead>
                <tbody>
                    <tr v-for="item in checkouts" :key="item.id">
                        <td>{{ item.id }}</td>
                        <td>{{ item.date }}</td>
                        <td>{{ item.unit_seat_price }}</td>
                        <td>{{ item.total }}</td>
                        <td>{{ item.movie_id }}</td>
                        <td>{{ item.user_id }}</td>
                        <td>{{ item.seat_id }}</td>
                        <td><button class="table--button-delete" @click="deleteSelectedItem(item.id)">Delete</button>
                        </td>


                    </tr>
                </tbody>
            </table>

        </div>



        <FooterAdmin />
    </div>
</template>

<script>
export default {
    data() {
        return {
            checkouts: [],
            fetchcheckoutsIsDone: false,
            url_checkouts: `http://localhost:8000/api/checkouts`,
            isAdmin: false,
            isLoading: true,
        }
    },
    methods: {
        fetchcheckouts() {
            fetch(this.url_checkouts)
                .then(response => response.json())
                .then(data => {
                    if (data) {
                        this.checkouts = data;
                        console.log('data checkouts', this.checkouts);
                        this.fetchcheckoutsIsDone = true;
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
            fetch(`http://localhost:8000/api/checkout/${id}`, {
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
                    this.checkouts = this.checkouts.filter(movie => movie.id !== id);

                })
                .catch(error => {
                    alert('ERROR DELETE PELICULA');
                    console.log(error)
                });
        },
        createMovie() {
            navigateTo('/admin/sessions/create');
        },
        showSelectedItem(id) {
            navigateTo(`/admin/sessions/${id}/`);
        }
    },
    mounted() {
        this.fetchcheckouts();
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
}

.container {
    display: grid;
    align-items: center;

    text-align: center;
    height: auto;

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
    font-size: 2rem;
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
    font-size: 1.5rem;
    border: 4px solid #1f1c1c;
    transition: color 0.1s ease-in-out;
}

.table--button-delete {
    background-color: #993535;
}



.table--button-delete:hover {
    color: #d2d2d2;

}
</style>