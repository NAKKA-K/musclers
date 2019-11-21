<template>
  <div>
    <h1>グループの新規作成ページ</h1>
  </div>
</template>

<script>
export default {
  middleware: 'auth',

  data: () => ({
    group: {
      name: '',
      description: '',
      isPublic: true,
      tags: []
    }
  }),

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
