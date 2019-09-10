<template>
  <div>hello user details</div>
</template>

<script>
import axios from 'axios'
export default {
  asyncData({ req }) {
    console.log('hello')
    console.log('1 \n' + req)
    console.log('2 \n' + req.headers)
    console.log('3 \n' + req.headers.omniauth)
    axios
      .get(
        'http://localhost:8080/api/my_callback?code=AQAo6Q3sAM4S-3X0H1W0M7DThXHvLveBBIqRfsfLL5VcG8HrNE_qnuMpGTVSsrE5X9hUZsfXXaTFfw42VQDnM2Ci3A8uah4d0aGF9Gx-tZ-6njWXXeUa1DsG-AenkD56oFI2obdjR8FBKY5lpxm3FJuq4EIJA0zjLLi64P8NHhZyZkZ4uF8aKDr3q5Kw9Gfre-SgiHs7tBmLf86elggbMqe7JoaIj0WTQI6N6SGsjQeQHjp68MuNYTnF_aF9Oku20Cg6yvirc2FyjUBBTqJ9xsnRRPrOzD2dgwYwyE7JA8aPvwnG8nNC3B6OXaZM3uly423vcLlxnLqwfTnSgrzXkmr1&state=894a95f6381c156ae112e07e978cebe089bd17a934f7b5d5#_=_'
      )
      .then((res) => {
        console.log(res)
      })
      .catch((err) => console.error(err))
  }
}
</script>
