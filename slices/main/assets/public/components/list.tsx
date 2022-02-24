import { FC } from "react"

const List: FC<{ data: { name: string }[] }> = ({ data }) => (
  <ul>
    {data.map(({ name }) => <li key={name}>{name}</li>)}
  </ul>
)

export default List
