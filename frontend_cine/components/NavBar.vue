<template>
    <nav>
        <ul>
            <li><nuxt-link to="/" class="nav-link">HOME</nuxt-link></li>
            <li><nuxt-link to="/estrenos" class="nav-link">ESTRENOS</nuxt-link></li>
            <li><a href="" class="nav-link">ABOUT</a></li>
            <li><nuxt-link to="/login" class="nav-link">LOGIN</nuxt-link></li>
            <li><nuxt-link to="/register" class="nav-link">SIGN UP</nuxt-link></li>
        </ul>
    </nav>
</template>

<script>

</script>

<style scoped>


nav,
footer {
    background-color: #FAFAFA;
    padding: 50px;
    font-weight: 900;
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
    color: #110101c0;
}

.nav-link:hover {
    color: #579E60;
    transition: color 0.1s ease-in-out;
}
</style>