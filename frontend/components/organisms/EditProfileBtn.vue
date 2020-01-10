<template>
  <div>
    <v-layout class="justify-end">
      <div v-if="this.$parent.disabled">
        <primary-outline-btn class="my-4" @click="enableEdit">
          <v-icon small>edit</v-icon>編集
        </primary-outline-btn>
      </div>
      <div v-else>
        <primary-btn class="my-4 ml-2" @click="submitUserEdit">
          <v-icon small>edit</v-icon>保存
        </primary-btn>
      </div>
    </v-layout>

    <v-snackbar
      v-model="edit"
      :color="resultEditType"
      top
      vertical
      :timeout="2500"
    >
      {{ resultEditMessage }}
      <v-btn dark text @click="edit = false">CLOSE</v-btn>
    </v-snackbar>
  </div>
</template>

<script>
import PrimaryOutlineBtn from '~/components/atoms/PrimaryOutlineBtn.vue'
import PrimaryBtn from '~/components/atoms/PrimaryBtn.vue'

export default {
  components: {
    PrimaryOutlineBtn,
    PrimaryBtn
  },
  props: ['user'],
  data: () => ({
    edit: false,
    resultEditType: null,
    resultEditMessage: null
  }),
  methods: {
    enableEdit() {
      this.$parent.disabled = false
    },
    async submitUserEdit() {
      const formData = new FormData()
      for (const key of Object.keys(this.user)) {
        switch (key) {
          case 'nickname':
          case 'description':
          case 'age':
          case 'height':
          case 'weight':
          case 'muscle_mass':
          case 'body_fat_percentage':
          case 'email':
            formData.append(`user[${key}]`, this.user[key])
            break
          case 'gender':
            formData.append(`user[${key}]`, this.gender)
            break
          case 'figure':
            formData.append(`user[${key}]`, this.figure)
            break
          case 'seriousness':
            formData.append(`user[${key}]`, this.seriousness)
            break
          case 'thumbnail':
            if (typeof this.user.thumbnail !== 'string') {
              formData.append(`user[${key}]`, this.user[key])
            }
            break
        }
      }

      await this.$axios
        .$patch(`/api/users/${this.user.id}/edit`, formData, {
          headers: {
            'Content-Type': 'multipart/form-data'
          }
        })
        .then(() => {
          this.resultEditMessage = `設定を保存しました`
          this.resultEditType = 'info'
        })
        .catch((err) => {
          this.resultEditType = 'error'

          if (err.response.status === 409) {
            this.resultEditMessage = err.response.data.message
            return
          }

          this.resultEditMessage = `設定の保存に失敗しました`
        })

      /* 編集が成功していなくてもstoreに保存される */
      const currentUser = await this.$axios
        .$get('/api/auth/user')
        .then((res) => res.data)
      this.$store.dispatch('auth/setCurrentUser', { user: currentUser })
      this.edit = true
      this.$parent.disabled = true
    }
  }
}
</script>
