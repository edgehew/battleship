<script setup lang="ts">
import { reactive, ref } from 'vue';
import { Team } from '@/models/Team.ts';
import type { TeamName } from '@/models/Team.ts';
import { Player } from '@/models/Player.ts';

const teams = reactive<Record<TeamName, Team>>({
    Blue: new Team('Blue'),
    Green: new Team('Green'),
    Orange: new Team('Orange'),
    Red: new Team('Red')
});

const showModal = ref(false);
const selectedTeam = ref<TeamName |''>(''); 
const newPlayerName = ref<string>('');

function openModal(team: TeamName) {
  selectedTeam.value = team;
  newPlayerName.value = '';
  showModal.value = true;
}

function joinTeam() {
  if (
    selectedTeam.value &&
    newPlayerName.value &&
    !teams[selectedTeam.value].players.some(p => p.name === newPlayerName.value) 
  ) {
    teams[selectedTeam.value].addPlayer(new Player(newPlayerName.value));
  }
  else {
    alert('Please enter a unique name to join the team.');
    return;
  }
  showModal.value = false;
}
</script>

<template>
  <div>
    <h2>Teams</h2>
    <table>
      <tr v-for="(teamObj, team) in teams" :key="team">
        <th :class="team">
          {{ team }}
          <button @click="openModal(team)">Join</button>
        </th>
        <td v-for="player in teamObj.players" :key="player.name">{{ player.name}}</td>
      </tr>
    </table>

    <!-- Modal -->
    <div v-if="showModal" class="modal-overlay">
      <div class="modal">
        <h3>Enter your name to join {{ selectedTeam }}</h3>
        <input v-model="newPlayerName" placeholder="Your name" />
        <button @click="joinTeam">Join</button>
        <button @click="showModal = false">Cancel</button>
      </div>
    </div>
  </div>
</template>

<style scoped>
.Blue {
  color: #2196f3;
}
.Green {
  color: #4caf50;
}
.Orange {
  color: #ff9800;
}
.Red {
  color: #f44336;
}
.modal-overlay {
  position: fixed;
  top: 0; left: 0; right: 0; bottom: 0;
  background: rgba(0,0,0,0.4);
  display: flex;
  align-items: center;
  justify-content: center;
}
.modal {
  background: #fff;
  padding: 2em;
  border-radius: 8px;
  min-width: 250px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.2);
}
</style>