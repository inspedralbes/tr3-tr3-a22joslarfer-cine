<template>
    <div v-if="!isLoading && isAdmin">

    </div>
</template>

<script>
export default {
    data() {
        return {
            isAdmin: false,
            isLoading: true,
        }
    },
    beforeMount() {
        const store = useStore();
        if (typeof window !== 'undefined' && (store.return_isAdmin() === false || localStorage.getItem('priviledgeState') === 'user')) {
            navigateTo('/login');
        } else {
            this.isAdmin = true;
        }
        this.isLoading = false;
    },
}
</script>

<style scoped></style>