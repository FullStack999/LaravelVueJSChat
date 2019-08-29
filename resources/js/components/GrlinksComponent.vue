<template>
    <div>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" style="cursor: pointer;" v-for="(ygr, index) in yourgroup" :id="ygr.id" @click="fetchMessages(ygr.id)">
                {{ygr.name}}
            </a>
        </div>
    </div>
</template>

<script>
    export default {
        props:['yourgroup'],
        name: "GrlinksComponent",
        created: function () {

        },
    }
</script>

<style scoped>

</style>