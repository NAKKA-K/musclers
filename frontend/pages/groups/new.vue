<template>
  <div>
    <h1>グループの新規作成ページ</h1>

    <v-form>
      <v-text-field
        v-model="$v.group.name.$model"
        :error-messages="nameErrors"
        :counter="128"
        label="グループ名"
        required
        @blur="$v.group.name.$touch()"
      >
      </v-text-field>

      <v-text-field
        v-model="$v.group.description.$model"
        :error-messages="descriptionErrors"
        :counter="2048"
        label="内容"
        required
        @blur="$v.group.description.$touch()"
      >
      </v-text-field>

      <v-switch v-model="group.isPublic" inset label="公開する"></v-switch>

      <v-select
        v-model="group.tags"
        :items="tags"
        item-text="name"
        item-value="name"
        chips
        label="タグ"
        multiple
      ></v-select>

      <v-btn
        type="submit"
        class="d-flex ml-auto"
        color="primary"
        @click.prevent="sendNewGroup"
      >
        作成する
      </v-btn>
    </v-form>
  </div>
</template>

<script>
import { required, maxLength } from 'vuelidate/lib/validators'

export default {
  middleware: 'auth',

  data: () => ({
    group: {
      name: '',
      description: '',
      isPublic: true,
      tags: []
    },
    tags: null
  }),

  validations: {
    group: {
      name: {
        required,
        maxLength: maxLength(128)
      },
      description: {
        required,
        maxLength: maxLength(2048)
      }
    }
  },

  computed: {
    nameErrors() {
      const errors = []
      if (!this.$v.group.name.$dirty) return errors
      !this.$v.group.name.required && errors.push('入力してください')
      !this.$v.group.name.maxLength &&
        errors.push(
          `${this.$v.group.name.$params.maxLength.max}文字以内で入力してください`
        )
      return errors
    },
    descriptionErrors() {
      const errors = []
      if (!this.$v.group.description.$dirty) return errors
      !this.$v.group.description.required && errors.push('入力してください')
      !this.$v.group.description.maxLength &&
        errors.push(
          `${this.$v.group.description.$params.maxLength.max}文字以内で入力してください`
        )
      return errors
    }
  },

  async asyncData({ $axios }) {
    const tags = await $axios
      .$get('/api/tags')
      .then((res) => res.data)
      .catch(() => [])

    return {
      tags
    }
  },

  methods: {
    sendNewGroup(e) {
      const group = {
        name: this.group.name,
        description: this.group.description,
        is_public: this.group.isPublic,
        tags: this.group.tags
      }
      this.$axios
        .$post('/api/groups', group)
        .then((res) => {
          console.log(res)
          this.$router.push(`/groups/${res.data.id}`)
        })
        .catch((err) => {
          // TODO: 戻ってきたエラーを処理したい
          console.log(err)
        })
    }
  }
}
</script>
