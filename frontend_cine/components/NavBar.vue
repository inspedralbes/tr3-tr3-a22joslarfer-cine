<template>
    <nav>
        <ul>
            <li><nuxt-link to="/" class="nav-link">HOME</nuxt-link></li>
            <li><nuxt-link to="/estrenos" class="nav-link">ESTRENOS</nuxt-link></li>
            <li><nuxt-link to="/perfil" class="nav-link">PERFIL</nuxt-link></li>
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
    height: 150px;

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

@media only screen and (min-device-width: 320px) and (max-device-width: 500px) {
    /* Styles for smartphones */

    nav ul {
        font-size: 20px;
        height: auto;
        justify-content: center;
    }

    nav ul li {
        margin: 10px;
        height: auto;

    }

    nav {
        height: auto;
    }


}

@media only screen and (min-device-width: 500px) and (max-device-width: 650px) {
    /* Styles for smartphones */

    nav ul {
        font-size: 30px;
        height: auto;
        justify-content: center;
    }

    nav ul li {
        margin: 10px;
        height: auto;

    }

    nav {
        height: auto;
    }


}

@media only screen and (min-device-width: 650px) and (max-device-width: 900px) {
    /* Styles for smartphones */

    nav ul {
        font-size: 40px;
        height: auto;
        justify-content: center;
    }

    nav ul li {
        margin: 10px;
        height: auto;

    }

    nav {
        height: auto;
    }


}
</style>