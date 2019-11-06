export const validateEmail = (validator) => {
  if (!validator.$dirty) return []

  const errors = []
  !validator.email && errors.push('メールアドレスの形式で入力してください')
  !validator.required && errors.push('メールアドレスを入力してください')
  return errors
}
