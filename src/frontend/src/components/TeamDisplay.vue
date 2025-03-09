<template>
    <div>
        <h2>Teams</h2>
        <table>
            <tr :v-for="team in teams">
                <th>{{team.key}}</th>
                <td :v-for="player in team.value">{{player}}</td>
            </tr>
        </table>
    </div>
</template>

<script>

export default {
    data() {
        return {
            teams: new Map({
                "Blue" : ["Shay"],
                "Green" : ["Sprinkles"],
                "Orange" : ["Matt"],
                "Red" : ["Deacon"]
            })
        }
    }
}
</script>

<style scoped>

</style>