// ~/store/index.js
import { defineStore } from 'pinia';

export const useStore = defineStore({
  id: 'main',
  state: () => ({
    selected_seats: [],
  }),
  actions: {
    save_seats(seats) {
     this.selected_seats = seats;
    },
    return_selected_seats() {
      return this.selected_seats;
    }
  },
});