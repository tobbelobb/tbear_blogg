function Header(props) {
  return <h1>{props.title}</h1>;
}

function HomePage() {
  const names = ['Ada Lovelace', 'Grace Hopper', 'Margaret Hamilton'];
  const [likes, setLikes] = React.useState(0);

  function handleClick() {
    setLikes(likes + 1);
  }


  return (
    <div className="homepage">
      <Header title="React 💙" />
      <Header title="A new title" />

      <ul>
        {names.map((name) => (
          <li key={name}>{name}</li>
        ))}
      </ul>
      <button onClick={handleClick}>Like ({likes})</button>
    </div>
  );
}

ReactDOM.render(<HomePage />, app);
