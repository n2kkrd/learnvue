<template>
    <div>
      <form @submit.prevent="submitForm">
        <div>
          <label for="username">Username:</label>
          <input type="text" id="username" v-model="username" :class="{ error: errors.username }">
          <span class="error-message" v-if="errors.username">{{ errors.username }}</span>
        </div>
        <div>
          <label for="email">Email:</label>
          <input type="email" id="email" v-model="email" :class="{ error: errors.email }">
          <span class="error-message" v-if="errors.email">{{ errors.email }}</span>
        </div>
        <div>
          <label for="password">Password:</label>
          <input type="password" id="password" v-model="password" :class="{ error: errors.password }">
          <span class="error-message" v-if="errors.password">{{ errors.password }}</span>
        </div>
        <button type="submit">Register</button>
      </form>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        username: '',
        email: '',
        password: '',
        errors: {}
      };
    },
    methods: {
      validateForm() {
        this.errors = {};
  
        if (!this.username) {
          this.errors.username = 'Username is required.';
        }
  
        if (!this.email) {
          this.errors.email = 'Email is required.';
        } else if (!this.validateEmail(this.email)) {
          this.errors.email = 'Invalid email format.';
        }
  
        if (!this.password) {
          this.errors.password = 'Password is required.';
        } else if (this.password.length < 6) {
          this.errors.password = 'Password should be at least 6 characters long.';
        }
  
        return Object.keys(this.errors).length === 0;
      },
      validateEmail(email) {
        // Проверка формата email
        // Вернуть true, если email действителен, иначе false
      },
      submitForm() {
        if (this.validateForm()) {
          // Отправить данные на сервер
        }
      }
    }
  };
  </script>
  
  <style>
  .error {
    border-color: red;
  }
  
  .error-message {
    color: red;
  }
  </style>
  