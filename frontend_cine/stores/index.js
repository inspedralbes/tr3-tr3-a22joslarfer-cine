// ~/store/index.js
import {
  defineStore
} from 'pinia';

export const useStore = defineStore({
  id: 'main',
  state: () => ({
    selected_seats: [],
    user_id: null,
    email: null,
    username: null,
    movie_id: null,
    date: null,
  }),
  actions: {
    save_seats(seats) {
      this.selected_seats = seats;
    },
    save_movie_id(id) {
      this.movie_id = id;
    },
    save_user_info(username, email, id) {
      this.username = username;
      this.email = email;
      this.user_id = id;
    },
    save_date(date) {
      this.date = date;
    },
    return_selected_seats() {
      return this.selected_seats;
    },
    return_user_id() {
      return this.user_id;
    },
    return_user_email() {
      return this.email;
    },
    return_user_username() {
      return this.username;
    },
    return_movie_id() {
      return this.movie_id;
    },
    return_date() {
      return this.date;
    },
    reset_booking_info(){
      this.selected_seats = [];
      this.user_id = null;
      this.email = null;
      this.username = null;
      this.movie_id = null;
      this.date = null;
    }
  },
});