<template>
    <div class="lp-container">
        <nav>
            <ul>
                <li><nuxt-link to="/" class="nav-link">HOME</nuxt-link></li>
                <li><nuxt-link to="/estrenos" class="nav-link">ESTRENOS</nuxt-link></li>
                <li><a href="" class="nav-link">ABOUT</a></li>
                <li><nuxt-link to="/login" class="nav-link">LOGIN</nuxt-link></li>
                <li><nuxt-link to="/register" class="nav-link">SIGN UP</nuxt-link></li>
            </ul>
        </nav>

        <section>
            <div>
                <h1>NUESTRAS PELÍCULAS</h1>
            </div>
        </section>
        <section>
            <div>
                <h1>ESTRENOS DE ESTA SEMANA</h1>
            </div>
        </section>

        <footer></footer>
    </div>
</template>

<style scoped>
* {
    box-sizing: border-box;
    font-family: "Roboto", sans-serif;
    margin: 0;
    padding: 0px;
    overflow: hidden;
    overflow-y: hidden;

}

.lp-container {
    height: auto;
    background-color: #eeeeee;
}


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

section {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 450px;
    color: #eeeeee;
    border-radius: 14px;
    margin: 50px;
    transition: background 0.5s ease-in-out;
    position: relative;
    -webkit-transform: translateZ(0);
    transform: translateZ(0);
    -webkit-transition: color 1000ms;
    transition: color 1000ms;

}

section::before {
    content: "";
    position: absolute;
    z-index: -1;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: #000000a1;
    -webkit-transform: scaleY(0);
    transform: scaleY(0);
    -webkit-transform-origin: 50% 100%;
    transform-origin: 50% 100%;
    -webkit-transition-property: transform;
    transition-property: transform;
    -webkit-transition: 300ms ease-out;
    transition: 300ms ease-out;
}

section:hover::before {
    -webkit-transform: scaleY(1);
    transform: scaleY(1);

}

section:nth-of-type(1) {
    background: url(../public/sillas/sillasrojas.jpg) no-repeat center center;

}

section:nth-of-type(2) {
    background: url(../public/sillas/sillasverdes4.jpg) no-repeat center center;

}

section:nth-of-type(1),
section:nth-of-type(2) {
   
    cursor: pointer;
}

section h1 {
    font-size: 100px;
    color: #ffffff;
}


.searchbar {
    display: block;
    padding: 15px 30px;
    font-size: 25px;
    line-height: 1.5;
    color: #110101c0;
    background-color: #fff;
    border: 2px solid #110101c0;
    border-radius: .25rem;

}

.searchbar::placeholder {
    color: #110101c0;
    font-size: 25px;
}
</style>

<script></script>
