<template>
  <div>
    <h2>マイページ</h2>

    <v-layout class="justify-end">
      <v-btn class="my-4" tile outlined color="success" @click="enableEdit">
        <v-icon small>edit</v-icon>編集
      </v-btn>
    </v-layout>

    <div class="mb-5">
      <img
        v-if="user.thumbnail"
        :src="user.thumbnail"
        height="150"
        @click="pickFile"
      />
      <input ref="image" type="file" style="display: none" accept="image/*" />
    </div>

    <v-text-field
      v-model="nickname"
      label="ニックネーム"
      :disabled="disabled"
    ></v-text-field>

    <v-text-field
      v-model="age"
      label="年齢"
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
      :disabled="disabled"
    ></v-text-field>

    <v-text-field
      v-model="weight"
      label="体重"
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
  </div>
</template>

<script>
export default {
  middleware: 'auth',
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
      { label: '普通筋肉質', value: 5 },
      { label: '肥満型筋肉質', value: 10 },
      { label: '痩せ型', value: 15 },
      { label: '普通', value: 20 },
      { label: '肥満型', value: 25 },
      { label: 'その他', value: 99 }
    ]
  }),

  computed: {
    nickname: {
      get: (vm) => (vm.user ? vm.user.nickname : null),
      set(val) {
        this.setUserPartial('nickname', val)
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
    }
  },

  asyncData({ store }) {
    const user = store.getters['auth/currentUser']
    console.log(user)
    if (!user) return

    return {
      user
    }
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
    }
  }
}
</script>
