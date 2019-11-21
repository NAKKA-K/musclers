<template>
  <div>
    <h1>グループの新規作成ページ</h1>

    <v-form>
      <v-text-field
        v-model="group.name"
        :error-messages="nameErrors"
        :counter="128"
        label="グループ名"
        required
        @blur="$v.name.$touch()"
      >
      </v-text-field>

      <v-text-field
        v-model="group.description"
        :error-messages="descriptionErrors"
        :counter="2048"
        label="内容"
        required
        @blur="$v.description.$touch()"
      >
      </v-text-field>

      <v-switch v-model="group.isPublic" inset label="公開する"></v-switch>

      <v-select
        v-model="group.tags"
        :items="tags"
        label="タグ"
        multiple
      ></v-select>
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
    name: {
      required,
      maxLength: maxLength(128)
    },
    description: {
      required,
      maxLength: maxLength(2048)
    }
  },

  computed: {
    nameErrors() {
      const errors = []
      if (!this.$v.name.$dirty) return errors
      console.log(this.group.name)
      !this.$v.name.required && errors.push('入力してください')
      !this.$v.name.maxLength &&
        errors.push(
          `${this.$v.name.$params.maxLength.max}文字以内で入力してください`
        )
      return errors
    },
    descriptionErrors() {
      const errors = []
      if (!this.$v.description.$dirty) return errors
      !this.$v.description.required && errors.push('入力してください')
      !this.$v.description.maxLength &&
        errors.push(
          `${this.$v.description.$params.maxLength.max}文字以内で入力してください`
        )
      return errors
    }
  },

  async asyncData({ $axios }) {
    const tags = await $axios
      .$get('/api/tags')
      .then((res) => res.data)
      .catch(() => [])
    console.log(tags)

    return {
      tags
    }
  },

  methods: {
    sendNewGroup() {
      const group = {
        name: this.group.name,
        description: this.group.description,
        is_public: this.group.isPublic,
        tags: this.group.tags
      }
      this.$axios
        .$post('/mock/api/groups', group)
        .then((res) => {
          this.$route.push(`/groups/${res.data.id}`)
        })
        .catch((err) => {
          // TODO: 戻ってきたエラーを処理したい
          console.log(err)
        })
    }
  }
}
</script>
