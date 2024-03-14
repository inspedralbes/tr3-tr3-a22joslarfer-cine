<template>
    <section class="upComing">
        <div>
            <li><nuxt-link to="/estrenos" class="nav-link"><h1>NUESTRAS PELÍCULAS</h1></nuxt-link></li>
        </div>
    </section>
</template>

<script></script>



<style scoped>

.upComing {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 350px;
    color: #eeeeee;
    border-radius: 14px;
    margin-left: 150px;
    margin-right: 150px;
    transition: background 0.5s ease-in-out;
    position: relative;
    transform: translateZ(0);
    transition: color 1000ms;
    background: url(/sillas/sillasrojas.jpg) no-repeat;
    cursor: pointer;
    margin-top: 50px;
}

.nav-link {
    text-decoration: none;
    color: #1c1c1c;
}

.nav-link:hover {
    color: #d1d8d2;
    transition: color 0.1s ease-in-out;
}



.upComing::before {
    content: "";
    position: absolute;
    z-index: -1;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: #000000a1;
    transform: scaleY(0);
    transform-origin: 50% 100%;
    transition-property: transform;
    transition: 300ms ease-out;
}

.upComing:hover::before {
    transform: scaleY(1);
}

.upComing h1 {
    font-size: 100px;
    color: #ffffff;
    font-family: "Antonio, sans-serif";
    text-shadow: 4px 4px 0px #adbd22ad;
}
</style>