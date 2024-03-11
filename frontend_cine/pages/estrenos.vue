<template>
    <div>
        <h1>Estrenos</h1>

        <div v-for="estreno in  estrenos " :key="estreno.id">
            <nuxt-link :to="'/' + '{{ estreno.id }}'">
                <h2>{{ estreno.title }}</h2>
                <p>{{ estreno.year }}</p>
                <p>{{ estreno.rating }}</p>
                <p>{{ estreno.poster }}</p>
                <p>{{ estreno.synopsis }}</p>
                <p>{{ estreno.showing_date }}</p>
                <p>{{ estreno.genre_id }}</p>
            </nuxt-link>
        </div>




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
    },
    mounted() {
        this.fetchData();
    }

}

</script>

<style lang="scss" scoped></style>