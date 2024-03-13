<template>
    <section class="ourMovies">
        <div>
            <h1>UPCOMING</h1>
        </div>
    </section>
</template>

<script lang="ts" setup>

</script>

<style>
.ourMovies {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 350px;
    color: #eeeeee;
    border-radius: 14px;
    margin-top: 10px;
    margin-left: 150px;
    margin-right: 150px;
    transition: background 0.5s ease-in-out;
    position: relative;
    transform: translateZ(0);
    transition: color 1000ms;
    background: url(sillas/sillasverdes4.jpg) no-repeat center center;
    cursor: pointer;
    margin-bottom: 50px;
}

.ourMovies::before {
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

.ourMovies:hover::before {
    transform: scaleY(1);

}

.ourMovies h1 {
    font-size: 100px;
    color: #ffffff;
    font-family: "Germania One", system-ui;
    text-shadow: 4px 4px 0px #adbd22ad;
}
</style>