<template>
  <v-container>
    <v-col cols="12" sm="6" offset-sm="3">
      <h3 class="margin">メールアドレスの設定</h3>
      <p>
        Facebookでメールアドレスが設定されていなかったため設定してください。
      </p>
      <form>
        <v-text-field
          v-model="$v.email.$model"
          :error-messages="emailErrors"
          label="hello@example.com"
          prepend-icon="email"
          single-line
          required
          @input="$v.email.$touch()"
          @blur="$v.email.$touch()"
        />
        <v-alert
          v-if="validErrors.email"
          border="right"
          colored-border
          type="error"
          elevation="2"
        >
          {{ validErrors.email }}
        </v-alert>

        <div class="text-center mt-4">
          <v-btn class="primary" rounded @click="submit">設定する</v-btn>
        </div>
      </form>
    </v-col>
  </v-container>
</template>

<script>
import { required, email } from 'vuelidate/lib/validators'
export default {
  validations: {
    email: { required, email }
  },

  data: () => ({
    email: '',
    errMsg: null,
    validErrors: {
      email: null
    }
  }),

  computed: {
    emailErrors() {
      const errors = []
      if (!this.$v.email.$dirty) return errors
      !this.$v.email.email &&
        errors.push('メールアドレスの形式で入力してください')
      !this.$v.email.required && errors.push('メールアドレスを入力してください')
      return errors
    }
  },

  methods: {
    async submit() {
      this.$v.$touch()
      if (this.$v.$invalid) {
        this.errMsg = '未入力の項目があります'
        return
      }

      const user = this.$store.getters['auth/currentUser']
      const postData = {
        id: user.id,
        email: this.email
      }
      try {
        await this.$axios.$patch('/api/users/' + postData.id, postData)
        this.$router.push('/sign_up')
      } catch (err) {
        if (err.response.status === 422) {
          this.validErrors.email = err.response.data.errors.message
        } else {
          this.$router.push('/')
        }
      }
    }
  }
}
</script>

<style>
.margin {
  margin: 120px 0px 0px 0px;
}
</style>
