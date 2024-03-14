<template>
    <nav>
        <ul>
            <li><nuxt-link to="/" class="nav-link">HOME</nuxt-link></li>
            <li><nuxt-link to="/estrenos" class="nav-link">ESTRENOS</nuxt-link></li>
            <li><nuxt-link to="/login" class="nav-link">LOGIN</nuxt-link></li>
            <li><nuxt-link to="/register" class="nav-link">SIGN UP</nuxt-link></li>
        </ul>
    </nav>
</template>

<script>

</script>

<style scoped>


nav {
    background-color: #c93d3d;
    font-weight: 900;
    z-index: 100;
    height: auto;
    width: 500px;
    display: flex;
    flex-direction: column;
}

nav ul {
    list-style-type: none;
    justify-content: space-evenly;
    font-size: 50px;
    display: flex;
}
nav ul li {
    margin-left: 50px;
}


.nav-link {
    text-decoration: none;
    color: #1c1c1c;
    font-family: "Antonio", sans-serif;
}

.nav-link:hover {
    color: #d1d8d2;
    transition: color 0.1s ease-in-out;

}
</style>