<template>
    <div>
        <button class="redirect--sessions" @click="goToSessionsControlPanel()">Sessions</button>
    </div>



</template>

<script>

export default {
    methods: {
        goToSessionsControlPanel() {

            navigateTo('/admin/sessions');

        }
    }
}
</script>


<style scoped>
div {

    display: flex;
    width: 100%;
    height: 100%;
    grid-area: redirectSessions;

}

.redirect--sessions:hover {
    background-color: #473d3d;
    color: #d1d8d2;
}

.redirect--sessions {
    width: 100%;
    height: 100%;
    background-color: #312929;
    border: 4px solid #1c1c1c;
    color: #1c1c1c;
    cursor: pointer;
    transition: background-color 0.3s ease-in-out, color 0.1s ease-in-out;
}
</style>