import { useState, useEffect } from "react";

export default function Posts() {
  const [posts, setPosts] = useState([]);

  useEffect(() => { 
    fetch("http://localhost:3001/")
    .then((res) => res.json())     
    .then((posts) => setPosts(posts.data))
    .catch((err) => console.log(err));     
  }, []);

  console.log(posts);

  return (
    <div className="posts-container">
      
      {posts ? posts.map((post) => (
        <div key={post.id}>
          <h3>{post.attributes.title}</h3>
          <p>{post.attributes.body}</p>
          <p>{post.attributes.votes_total}</p>
        </div>)
    ) : null}
    </div>
  );
}
 