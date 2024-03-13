<template>
    <section class="upComing">
        <div>
            <h1>NUESTRAS PELÍCULAS</h1>
        </div>
    </section>
</template>

<script></script>



<style>
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
    -webkit-transform: translateZ(0);
    transform: translateZ(0);
    -webkit-transition: color 1000ms;
    transition: color 1000ms;
    
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
    -webkit-transform: scaleY(0);
    transform: scaleY(0);
    -webkit-transform-origin: 50% 100%;
    transform-origin: 50% 100%;
    -webkit-transition-property: transform;
    transition-property: transform;
    -webkit-transition: 300ms ease-out;
    transition: 300ms ease-out;
    
}

.upComing:hover::before {
    -webkit-transform: scaleY(1);
    transform: scaleY(1);

}

.upComing {
    background: url(sillas/sillasrojas.jpg) no-repeat;
    
}

.upComing {
    cursor: pointer;
}

.upComing h1 {
    font-size: 100px;
    color: #ffffff;
}
</style>