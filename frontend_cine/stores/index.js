// ~/store/index.js
import { defineStore } from 'pinia';

export const useStore = defineStore({
  id: 'main',
  state: () => ({
    selected_seats: [],
    user_id: null,
    email: null,
    username: null,
    movie_id:null,
  }),
  actions: {
    save_seats(seats) {
      this.selected_seats = seats;
    },
    return_selected_seats() {
      return this.selected_seats;
    },
    save_movie_id(id) {
      this.movie_id = id;
    },
    save_user_info(username, email, id) {
      this.username = username;
      this.email = email;
      this.user_id = id;
    },
    return_user_id() {
      return this.user_id;
    },
    return_user_email(){
      return this.email;
    },
    return_user_username(){
      return this.username;
    }
  },
});