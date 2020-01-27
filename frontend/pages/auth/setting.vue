<template>
  <div>
    <h2>マイページ</h2>

    <v-layout class="justify-end">
      <div v-if="disabled">
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
    <div class="mb-5">
      <img
        v-if="thumbnailSrc"
        :src="thumbnailSrc"
        height="150"
        @click="pickFile"
      />
      <input
        ref="image"
        type="file"
        style="display: none"
        accept="image/*"
        :disabled="disabled"
        @change="onPickedFile"
      />
    </div>

    <v-text-field
      v-model="$v.email.$model"
      :error-messages="emailErrors"
      label="Eメール"
      :disabled="disabled"
    ></v-text-field>

    <v-text-field
      v-model="$v.nickname.$model"
      :error-messages="nicknameErrors"
      counter="64"
      label="ニックネーム"
      :disabled="disabled"
    ></v-text-field>

    <v-textarea
      v-model="$v.description.$model"
      :error-messages="descriptionErrors"
      counter="1024"
      label="自己紹介"
      outlined
      rows="5"
      :disabled="disabled"
    ></v-textarea>

    <v-text-field
      v-model="age"
      label="年齢"
      type="number"
      :disabled="disabled"
    ></v-text-field>

    <v-radio-group v-model="gender" label="性別" :disabled="disabled">
      <v-radio
        v-for="hash in gendersArray"
        :key="hash.value"
        :label="hash.label"
        :value="hash.value"
      ></v-radio>
    </v-radio-group>

    <v-text-field
      v-model="height"
      label="身長"
      type="number"
      :disabled="disabled"
    ></v-text-field>

    <v-text-field
      v-model="weight"
      label="体重"
      type="number"
      :disabled="disabled"
    ></v-text-field>

    <v-radio-group v-model="seriousness" label="本気度" :disabled="disabled">
      <v-radio
        v-for="hash in seriousnessArray"
        :key="hash.value"
        :label="hash.label"
        :value="hash.value"
      ></v-radio>
    </v-radio-group>

    <v-select
      v-model="figure"
      :items="figuresArray"
      item-text="label"
      item-value="value"
      label="体系"
      :disabled="disabled"
    ></v-select>

    <v-text-field
      v-model="muscle_mass"
      type="number"
      label="筋肉量"
      :disabled="disabled"
    ></v-text-field>

    <v-text-field
      v-model="body_fat_percentage"
      type="number"
      label="体脂肪率"
      :disabled="disabled"
    ></v-text-field>
    <v-layout class="justify-center">
      <div v-if="!disabled">
        <v-btn class="my-4 ml-2" tile color="primary" @click="submitUserEdit">
          <v-icon small>edit</v-icon>保存
        </v-btn>
      </div>
    </v-layout>
  </div>
</template>

<script>
import { required, email, maxLength } from 'vuelidate/lib/validators'
import {
  validateEmail,
  validateNickname,
  validateDescription
} from '~/validations'
import PrimaryOutlineBtn from '~/components/atoms/PrimaryOutlineBtn.vue'
import PrimaryBtn from '~/components/atoms/PrimaryBtn.vue'

export default {
  middleware: 'auth',

  components: {
    PrimaryOutlineBtn,
    PrimaryBtn
  },

  data: () => ({
    disabled: true,
    user: {},
    seriousnessArray: [
      { label: '未設定', value: 0 },
      { label: 'エンジョイ', value: 2 },
      { label: 'ガチ', value: 1 }
    ],
    gendersArray: [
      { label: '未設定', value: 0 },
      { label: '男性', value: 1 },
      { label: '女性', value: 2 },
      { label: 'その他', value: 3 }
    ],
    figuresArray: [
      { label: '未設定', value: 0 },
      { label: '痩せ型筋肉質', value: 1 },
      { label: '普通型筋肉質', value: 5 },
      { label: '肥満型筋肉質', value: 10 },
      { label: '痩せ型', value: 15 },
      { label: '普通型', value: 20 },
      { label: '肥満型', value: 25 },
      { label: 'その他', value: 99 }
    ],
    thumbnailSrc: ''
  }),

  validations: {
    email: {
      required,
      email
    },
    nickname: {
      required,
      maxLength: maxLength(64)
    },
    description: {
      maxLength: maxLength(1024)
    }
  },

  computed: {
    email: {
      get: (vm) => (vm.user ? vm.user.email : null),
      set(val) {
        this.setUserPartial('email', val)
      }
    },
    nickname: {
      get: (vm) => (vm.user ? vm.user.nickname : null),
      set(val) {
        this.setUserPartial('nickname', val)
      }
    },
    description: {
      get: (vm) => (vm.user ? vm.user.description : null),
      set(val) {
        this.setUserPartial('description', val)
      }
    },
    age: {
      get: (vm) => (vm.user ? vm.user.age : null),
      set(val) {
        this.setUserPartial('age', val)
      }
    },
    gender: {
      get() {
        const item = this.gendersArray.find((item) => {
          return item.label === this.user.gender
        })
        return item.value
      },
      set(val) {
        const item = this.gendersArray.find((item) => {
          return item.value === val
        })
        this.setUserPartial('gender', item.label)
      }
    },
    height: {
      get: (vm) => (vm.user ? vm.user.height : null),
      set(val) {
        this.setUserPartial('height', val)
      }
    },
    weight: {
      get: (vm) => (vm.user ? vm.user.weight : null),
      set(val) {
        this.setUserPartial('weight', val)
      }
    },
    seriousness: {
      get() {
        const item = this.seriousnessArray.find((item) => {
          return item.label === this.user.seriousness
        })
        return item.value
      },
      set(val) {
        const item = this.seriousnessArray.find((item) => {
          return item.value === val
        })
        this.setUserPartial('seriousness', item.label)
      }
    },
    figure: {
      get() {
        const item = this.figuresArray.find((item) => {
          return item.label === this.user.figure
        })
        return item.value
      },
      set(val) {
        const item = this.figuresArray.find((item) => {
          return item.value === val
        })
        this.setUserPartial('figure', item.label)
      }
    },
    muscle_mass: {
      get: (vm) => (vm.user ? vm.user.muscle_mass : null),
      set(val) {
        this.setUserPartial('muscle_mass', val)
      }
    },
    body_fat_percentage: {
      get: (vm) => (vm.user ? vm.user.body_fat_percentage : null),
      set(val) {
        this.setUserPartial('body_fat_percentage', val)
      }
    },
    emailErrors: (vm) => validateEmail(vm.$v.email),
    nicknameErrors: (vm) => validateNickname(vm.$v.nickname),
    descriptionErrors: (vm) => validateDescription(vm.$v.description)
  },

  asyncData({ store }) {
    const user = store.getters['authentication/currentUser']
    if (!user) return

    const data = { user }
    if (user.thumbnail) data.thumbnailSrc = user.thumbnail

    return data
  },

  methods: {
    enableEdit() {
      this.disabled = false
    },
    setUserPartial(key, value) {
      this.user = { ...this.user, [key]: value }
    },
    pickFile() {
      this.$refs.image.click()
    },
    onPickedFile(e) {
      const file = e.target.files[0]
      if (typeof file !== 'undefined') {
        if (file.name.lastIndexOf('.') <= 0) {
          return
        }
        const reader = new FileReader()
        reader.readAsDataURL(file)
        reader.addEventListener('load', () => {
          this.thumbnailSrc = reader.result
          this.setUserPartial('thumbnail', file)
        })
      }
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

      await this.$axios.$patch(`/api/users/${this.user.id}/edit`, formData, {
        headers: {
          'Content-Type': 'multipart/form-data'
        }
      })

      const currentUser = await this.$axios
        .$get('/api/auth/user')
        .then((res) => res.data)
      this.$store.dispatch('authentication/setCurrentUser', {
        user: currentUser
      })

      this.disabled = true
    }
  }
}
</script>
