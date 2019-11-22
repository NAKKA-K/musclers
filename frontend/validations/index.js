export const validate = (validator, validations) => {
  if (!validator.$dirty) return []

  const errors = []
  for (const item of validations) {
    for (const key of Object.keys(item)) {
      console.log(validations, item, key)
      !validator[key] && errors.push(item[key])
    }
  }
  return errors
}

export const validateEmail = (validator) => {
  const validations = [
    { email: 'メールアドレスの形式で入力してください' },
    { required: '入力してください' }
  ]
  return validate(validator, validations)
}

export const validateNickname = (validator) => {
  const validations = [
    { required: '入力してください' },
    {
      maxLength: `${validator.$params.maxLength.max}文字以下で入力してください`
    }
  ]
  return validate(validator, validations)
}

export const validateDescription = (validator) => {
  const validations = [
    { required: '入力してください' },
    {
      maxLength: `${validator.$params.maxLength.max}文字以下で入力してください`
    }
  ]
  return validate(validator, validations)
}
