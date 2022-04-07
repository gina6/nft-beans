export default function () {
  const beans = reactive([])

  return useState<object>('beans', () => beans)
}