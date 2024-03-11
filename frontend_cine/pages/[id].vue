<template>
    <div>

    </div>
</template>

<script>
export default {
    data() {
        return {
            sesion_de_peli: null,
        }
    },
    methods: {
        
        },
    },
    created() {
        this.sesion_de_peli = this.$route.params.id;
    },
    mounted() {
        
    }
}
</script>

<style lang="scss" scoped></style>