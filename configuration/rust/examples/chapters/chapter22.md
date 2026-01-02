# EXAMPLES: GRAPHS

`INSERT HERE`

## DIJKSTRA

`INSERT HERE`

```rust
use std::cmp::Reverse;
use std::collections::{BTreeMap, BinaryHeap};
use std::ops::Add;

type Graph<V, E> = BTreeMap<V, BTreeMap<V, E>>;

// performs Dijsktra's algorithm on the given graph from the given start
// the graph is a positively-weighted undirected graph
//
// returns a map that for each reachable vertex associates the distance and the predecessor
// since the start has no predecessor but is reachable, map[start] will be None
pub fn dijkstra<V: Ord + Copy, E: Ord + Copy + Add<Output = E>>(
    graph: &Graph<V, E>,
    start: &V,
) -> BTreeMap<V, Option<(V, E)>> {
    let mut ans = BTreeMap::new();
    let mut prio = BinaryHeap::new();

    // start is the special case that doesn't have a predecessor
    ans.insert(*start, None);

    for (new, weight) in &graph[start] {
        ans.insert(*new, Some((*start, *weight)));
        prio.push(Reverse((*weight, new, start)));
    }

    while let Some(Reverse((dist_new, new, prev))) = prio.pop() {
        match ans[new] {
            // what we popped is what is in ans, we'll compute it
            Some((p, d)) if p == *prev && d == dist_new => {}
            // otherwise it's not interesting
            _ => continue,
        }

        for (next, weight) in &graph[new] {
            match ans.get(next) {
                // if ans[next] is a lower dist than the alternative one, we do nothing
                Some(Some((_, dist_next))) if dist_new + *weight >= *dist_next => {}
                // if ans[next] is None then next is start and so the distance won't be changed, it won't be added again in prio
                Some(None) => {}
                // the new path is shorter, either new was not in ans or it was farther
                _ => {
                    ans.insert(*next, Some((*new, *weight + dist_new)));
                    prio.push(Reverse((*weight + dist_new, next, new)));
                }
            }
        }
    }

    ans
}

#[cfg(test)]
mod tests {
    use super::{dijkstra, Graph};
    use std::collections::BTreeMap;

    fn add_edge<V: Ord + Copy, E: Ord>(graph: &mut Graph<V, E>, v1: V, v2: V, c: E) {
        graph.entry(v1).or_insert_with(BTreeMap::new).insert(v2, c);
        graph.entry(v2).or_insert_with(BTreeMap::new);
    }

    #[test]
    fn single_vertex() {
        let mut graph: Graph<usize, usize> = BTreeMap::new();
        graph.insert(0, BTreeMap::new());

        let mut dists = BTreeMap::new();
        dists.insert(0, None);

        assert_eq!(dijkstra(&graph, &0), dists);
    }

    #[test]
    fn single_edge() {
        let mut graph = BTreeMap::new();
        add_edge(&mut graph, 0, 1, 2);

        let mut dists_0 = BTreeMap::new();
        dists_0.insert(0, None);
        dists_0.insert(1, Some((0, 2)));

        assert_eq!(dijkstra(&graph, &0), dists_0);

        let mut dists_1 = BTreeMap::new();
        dists_1.insert(1, None);

        assert_eq!(dijkstra(&graph, &1), dists_1);
    }

    #[test]
    fn tree_1() {
        let mut graph = BTreeMap::new();
        let mut dists = BTreeMap::new();
        dists.insert(1, None);
        for i in 1..100 {
            add_edge(&mut graph, i, i * 2, i * 2);
            add_edge(&mut graph, i, i * 2 + 1, i * 2 + 1);

            match dists[&i] {
                Some((_, d)) => {
                    dists.insert(i * 2, Some((i, d + i * 2)));
                    dists.insert(i * 2 + 1, Some((i, d + i * 2 + 1)));
                }
                None => {
                    dists.insert(i * 2, Some((i, i * 2)));
                    dists.insert(i * 2 + 1, Some((i, i * 2 + 1)));
                }
            }
        }

        assert_eq!(dijkstra(&graph, &1), dists);
    }

    #[test]
    fn graph_1() {
        let mut graph = BTreeMap::new();
        add_edge(&mut graph, 'a', 'c', 12);
        add_edge(&mut graph, 'a', 'd', 60);
        add_edge(&mut graph, 'b', 'a', 10);
        add_edge(&mut graph, 'c', 'b', 20);
        add_edge(&mut graph, 'c', 'd', 32);
        add_edge(&mut graph, 'e', 'a', 7);

        let mut dists_a = BTreeMap::new();
        dists_a.insert('a', None);
        dists_a.insert('c', Some(('a', 12)));
        dists_a.insert('d', Some(('c', 44)));
        dists_a.insert('b', Some(('c', 32)));
        assert_eq!(dijkstra(&graph, &'a'), dists_a);

        let mut dists_b = BTreeMap::new();
        dists_b.insert('b', None);
        dists_b.insert('a', Some(('b', 10)));
        dists_b.insert('c', Some(('a', 22)));
        dists_b.insert('d', Some(('c', 54)));
        assert_eq!(dijkstra(&graph, &'b'), dists_b);

        let mut dists_c = BTreeMap::new();
        dists_c.insert('c', None);
        dists_c.insert('b', Some(('c', 20)));
        dists_c.insert('d', Some(('c', 32)));
        dists_c.insert('a', Some(('b', 30)));
        assert_eq!(dijkstra(&graph, &'c'), dists_c);

        let mut dists_d = BTreeMap::new();
        dists_d.insert('d', None);
        assert_eq!(dijkstra(&graph, &'d'), dists_d);

        let mut dists_e = BTreeMap::new();
        dists_e.insert('e', None);
        dists_e.insert('a', Some(('e', 7)));
        dists_e.insert('c', Some(('a', 19)));
        dists_e.insert('d', Some(('c', 51)));
        dists_e.insert('b', Some(('c', 39)));
        assert_eq!(dijkstra(&graph, &'e'), dists_e);
    }
}
```

`INSERT HERE`

## KRUSKAL'S MINIMUM SPANNING TREE

`INSERT HERE`

```rust
use super::DisjointSetUnion;

#[derive(Debug)]
pub struct Edge {
    source: i64,
    destination: i64,
    cost: i64,
}

impl PartialEq for Edge {
    fn eq(&self, other: &Self) -> bool {
        self.source == other.source
            && self.destination == other.destination
            && self.cost == other.cost
    }
}

impl Eq for Edge {}

impl Edge {
    fn new(source: i64, destination: i64, cost: i64) -> Self {
        Self {
            source,
            destination,
            cost,
        }
    }
}

pub fn kruskal(mut edges: Vec<Edge>, number_of_vertices: i64) -> (i64, Vec<Edge>) {
    let mut dsu = DisjointSetUnion::new(number_of_vertices as usize);

    edges.sort_unstable_by(|a, b| a.cost.cmp(&b.cost));
    let mut total_cost: i64 = 0;
    let mut final_edges: Vec<Edge> = Vec::new();
    let mut merge_count: i64 = 0;
    for edge in edges.iter() {
        if merge_count >= number_of_vertices - 1 {
            break;
        }

        let source: i64 = edge.source;
        let destination: i64 = edge.destination;
        if dsu.merge(source as usize, destination as usize) < std::usize::MAX {
            merge_count += 1;
            let cost: i64 = edge.cost;
            total_cost += cost;
            let final_edge: Edge = Edge::new(source, destination, cost);
            final_edges.push(final_edge);
        }
    }
    (total_cost, final_edges)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_seven_vertices_eleven_edges() {
        let mut edges: Vec<Edge> = Vec::new();
        edges.push(Edge::new(0, 1, 7));
        edges.push(Edge::new(0, 3, 5));
        edges.push(Edge::new(1, 2, 8));
        edges.push(Edge::new(1, 3, 9));
        edges.push(Edge::new(1, 4, 7));
        edges.push(Edge::new(2, 4, 5));
        edges.push(Edge::new(3, 4, 15));
        edges.push(Edge::new(3, 5, 6));
        edges.push(Edge::new(4, 5, 8));
        edges.push(Edge::new(4, 6, 9));
        edges.push(Edge::new(5, 6, 11));

        let number_of_vertices: i64 = 7;

        let expected_total_cost = 39;
        let mut expected_used_edges: Vec<Edge> = Vec::new();
        expected_used_edges.push(Edge::new(0, 3, 5));
        expected_used_edges.push(Edge::new(2, 4, 5));
        expected_used_edges.push(Edge::new(3, 5, 6));
        expected_used_edges.push(Edge::new(0, 1, 7));
        expected_used_edges.push(Edge::new(1, 4, 7));
        expected_used_edges.push(Edge::new(4, 6, 9));

        let (actual_total_cost, actual_final_edges) = kruskal(edges, number_of_vertices);

        assert_eq!(actual_total_cost, expected_total_cost);
        assert_eq!(actual_final_edges, expected_used_edges);
    }

    #[test]
    fn test_ten_vertices_twenty_edges() {
        let mut edges: Vec<Edge> = Vec::new();
        edges.push(Edge::new(0, 1, 3));
        edges.push(Edge::new(0, 3, 6));
        edges.push(Edge::new(0, 4, 9));
        edges.push(Edge::new(1, 2, 2));
        edges.push(Edge::new(1, 3, 4));
        edges.push(Edge::new(1, 4, 9));
        edges.push(Edge::new(2, 3, 2));
        edges.push(Edge::new(2, 5, 8));
        edges.push(Edge::new(2, 6, 9));
        edges.push(Edge::new(3, 6, 9));
        edges.push(Edge::new(4, 5, 8));
        edges.push(Edge::new(4, 9, 18));
        edges.push(Edge::new(5, 6, 7));
        edges.push(Edge::new(5, 8, 9));
        edges.push(Edge::new(5, 9, 10));
        edges.push(Edge::new(6, 7, 4));
        edges.push(Edge::new(6, 8, 5));
        edges.push(Edge::new(7, 8, 1));
        edges.push(Edge::new(7, 9, 4));
        edges.push(Edge::new(8, 9, 3));

        let number_of_vertices: i64 = 10;

        let expected_total_cost = 38;
        let mut expected_used_edges = Vec::new();
        expected_used_edges.push(Edge::new(7, 8, 1));
        expected_used_edges.push(Edge::new(1, 2, 2));
        expected_used_edges.push(Edge::new(2, 3, 2));
        expected_used_edges.push(Edge::new(0, 1, 3));
        expected_used_edges.push(Edge::new(8, 9, 3));
        expected_used_edges.push(Edge::new(6, 7, 4));
        expected_used_edges.push(Edge::new(5, 6, 7));
        expected_used_edges.push(Edge::new(2, 5, 8));
        expected_used_edges.push(Edge::new(4, 5, 8));

        let (actual_total_cost, actual_final_edges) = kruskal(edges, number_of_vertices);

        assert_eq!(actual_total_cost, expected_total_cost);
        assert_eq!(actual_final_edges, expected_used_edges);
    }
}
```

`INSERT HERE`

## PRIM'S MINIMUM SPANNING TREE

`INSERT HERE`

```rust
use std::cmp::Reverse;
use std::collections::{BTreeMap, BinaryHeap};
use std::ops::Add;

type Graph<V, E> = BTreeMap<V, BTreeMap<V, E>>;

fn add_edge<V: Ord + Copy, E: Ord + Add + Copy>(graph: &mut Graph<V, E>, v1: V, v2: V, c: E) {
    graph.entry(v1).or_insert_with(BTreeMap::new).insert(v2, c);
    graph.entry(v2).or_insert_with(BTreeMap::new).insert(v1, c);
}

// selects a start and run the algorithm from it
pub fn prim<V: Ord + Copy + std::fmt::Debug, E: Ord + Add + Copy + std::fmt::Debug>(
    graph: &Graph<V, E>,
) -> Graph<V, E> {
    match graph.keys().next() {
        Some(v) => prim_with_start(graph, *v),
        None => BTreeMap::new(),
    }
}

// only works for a connected graph
// if the given graph is not connected it will return the MST of the connected subgraph
pub fn prim_with_start<V: Ord + Copy, E: Ord + Add + Copy>(
    graph: &Graph<V, E>,
    start: V,
) -> Graph<V, E> {
    // will contain the MST
    let mut mst: Graph<V, E> = Graph::new();
    // a priority queue based on a binary heap, used to get the cheapest edge
    // the elements are an edge: the cost, destination and source
    let mut prio = BinaryHeap::new();

    mst.insert(start, BTreeMap::new());

    for (v, c) in &graph[&start] {
        // the heap is a max heap, we have to use Reverse when adding to simulate a min heap
        prio.push(Reverse((*c, v, start)));
    }

    while let Some(Reverse((dist, t, prev))) = prio.pop() {
        // the destination of the edge has already been seen
        if mst.contains_key(t) {
            continue;
        }

        // the destination is a new vertex
        add_edge(&mut mst, prev, *t, dist);

        for (v, c) in &graph[t] {
            if !mst.contains_key(v) {
                prio.push(Reverse((*c, v, *t)));
            }
        }
    }

    mst
}

#[cfg(test)]
mod tests {
    use super::{add_edge, prim, Graph};
    use std::collections::BTreeMap;

    #[test]
    fn empty() {
        assert_eq!(prim::<usize, usize>(&BTreeMap::new()), BTreeMap::new());
    }

    #[test]
    fn single_vertex() {
        let mut graph: Graph<usize, usize> = BTreeMap::new();
        graph.insert(42, BTreeMap::new());

        assert_eq!(prim(&graph), graph);
    }

    #[test]
    fn single_edge() {
        let mut graph = BTreeMap::new();

        add_edge(&mut graph, 42, 666, 12);

        assert_eq!(prim(&graph), graph);
    }

    #[test]
    fn tree_1() {
        let mut graph = BTreeMap::new();

        add_edge(&mut graph, 0, 1, 10);
        add_edge(&mut graph, 0, 2, 11);
        add_edge(&mut graph, 2, 3, 12);
        add_edge(&mut graph, 2, 4, 13);
        add_edge(&mut graph, 1, 5, 14);
        add_edge(&mut graph, 1, 6, 15);
        add_edge(&mut graph, 3, 7, 16);

        assert_eq!(prim(&graph), graph);
    }

    #[test]
    fn tree_2() {
        let mut graph = BTreeMap::new();

        add_edge(&mut graph, 1, 2, 11);
        add_edge(&mut graph, 2, 3, 12);
        add_edge(&mut graph, 2, 4, 13);
        add_edge(&mut graph, 4, 5, 14);
        add_edge(&mut graph, 4, 6, 15);
        add_edge(&mut graph, 6, 7, 16);

        assert_eq!(prim(&graph), graph);
    }

    #[test]
    fn tree_3() {
        let mut graph = BTreeMap::new();

        for i in 1..100 {
            add_edge(&mut graph, i, 2 * i, i);
            add_edge(&mut graph, i, 2 * i + 1, -i);
        }

        assert_eq!(prim(&graph), graph);
    }

    #[test]
    fn graph_1() {
        let mut graph = BTreeMap::new();
        add_edge(&mut graph, 'a', 'b', 6);
        add_edge(&mut graph, 'a', 'c', 7);
        add_edge(&mut graph, 'a', 'e', 2);
        add_edge(&mut graph, 'a', 'f', 3);
        add_edge(&mut graph, 'b', 'c', 5);
        add_edge(&mut graph, 'c', 'e', 5);
        add_edge(&mut graph, 'd', 'e', 4);
        add_edge(&mut graph, 'd', 'f', 1);
        add_edge(&mut graph, 'e', 'f', 2);

        let mut ans = BTreeMap::new();
        add_edge(&mut ans, 'd', 'f', 1);
        add_edge(&mut ans, 'e', 'f', 2);
        add_edge(&mut ans, 'a', 'e', 2);
        add_edge(&mut ans, 'b', 'c', 5);
        add_edge(&mut ans, 'c', 'e', 5);

        assert_eq!(prim(&graph), ans);
    }

    #[test]
    fn graph_2() {
        let mut graph = BTreeMap::new();
        add_edge(&mut graph, 1, 2, 6);
        add_edge(&mut graph, 1, 3, 1);
        add_edge(&mut graph, 1, 4, 5);
        add_edge(&mut graph, 2, 3, 5);
        add_edge(&mut graph, 2, 5, 3);
        add_edge(&mut graph, 3, 4, 5);
        add_edge(&mut graph, 3, 5, 6);
        add_edge(&mut graph, 3, 6, 4);
        add_edge(&mut graph, 4, 6, 2);
        add_edge(&mut graph, 5, 6, 6);

        let mut ans = BTreeMap::new();
        add_edge(&mut ans, 1, 3, 1);
        add_edge(&mut ans, 4, 6, 2);
        add_edge(&mut ans, 2, 5, 3);
        add_edge(&mut ans, 2, 3, 5);
        add_edge(&mut ans, 3, 6, 4);

        assert_eq!(prim(&graph), ans);
    }

    #[test]
    fn graph_3() {
        let mut graph = BTreeMap::new();
        add_edge(&mut graph, "v1", "v2", 1);
        add_edge(&mut graph, "v1", "v3", 3);
        add_edge(&mut graph, "v1", "v5", 6);
        add_edge(&mut graph, "v2", "v3", 2);
        add_edge(&mut graph, "v2", "v4", 3);
        add_edge(&mut graph, "v2", "v5", 5);
        add_edge(&mut graph, "v3", "v4", 5);
        add_edge(&mut graph, "v3", "v6", 2);
        add_edge(&mut graph, "v4", "v5", 2);
        add_edge(&mut graph, "v4", "v6", 4);
        add_edge(&mut graph, "v5", "v6", 1);

        let mut ans = BTreeMap::new();
        add_edge(&mut ans, "v1", "v2", 1);
        add_edge(&mut ans, "v5", "v6", 1);
        add_edge(&mut ans, "v2", "v3", 2);
        add_edge(&mut ans, "v3", "v6", 2);
        add_edge(&mut ans, "v4", "v5", 2);

        assert_eq!(prim(&graph), ans);
    }
}
```

`INSERT HERE`

## BREADTH-FIRST SEARCH (BFS)

`INSERT HERE`

```rust
use std::collections::HashSet;
use std::collections::VecDeque;

/// Perform a breadth-first search on Graph `graph`.
///
/// # Parameters
///
/// - `graph`: The graph to search.
/// - `root`: The starting node of the graph from which to begin searching.
/// - `target`: The target node for the search.
///
/// # Returns
///
/// If the target is found, an Optional vector is returned with the history
/// of nodes visited as its contents.
///
/// If the target is not found or there is no path from the root,
/// `None` is returned.
///
pub fn breadth_first_search(graph: &Graph, root: Node, target: Node) -> Option<Vec<u32>> {
    let mut visited: HashSet<Node> = HashSet::new();
    let mut history: Vec<u32> = Vec::new();
    let mut queue = VecDeque::new();

    visited.insert(root);
    queue.push_back(root);
    while let Some(currentnode) = queue.pop_front() {
        history.push(currentnode.value());

        // If we reach the goal, return our travel history.
        if currentnode == target {
            return Some(history);
        }

        // Check the neighboring nodes for any that we've not visited yet.
        for neighbor in currentnode.neighbors(graph) {
            if !visited.contains(&neighbor) {
                visited.insert(neighbor);
                queue.push_back(neighbor);
            }
        }
    }

    // All nodes were visited, yet the target was not found.
    None
}

// Data Structures

#[derive(Copy, Clone, PartialEq, Eq, Hash)]
pub struct Node(u32);

#[derive(Copy, Clone, PartialEq, Eq, Hash)]
pub struct Edge(u32, u32);

#[derive(Clone)]
pub struct Graph {
    #[allow(dead_code)]
    nodes: Vec<Node>,
    edges: Vec<Edge>,
}

impl Graph {
    pub fn new(nodes: Vec<Node>, edges: Vec<Edge>) -> Self {
        Graph { nodes, edges }
    }
}

impl From<u32> for Node {
    fn from(item: u32) -> Self {
        Node(item)
    }
}

impl Node {
    pub fn value(&self) -> u32 {
        self.0
    }

    pub fn neighbors(&self, graph: &Graph) -> Vec<Node> {
        graph
            .edges
            .iter()
            .filter(|e| e.0 == self.0)
            .map(|e| e.1.into())
            .collect()
    }
}

impl From<(u32, u32)> for Edge {
    fn from(item: (u32, u32)) -> Self {
        Edge(item.0, item.1)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /* Example graph #1:
     *
     *            (1)   <--- Root
     *           /   \
     *         (2)   (3)
     *        / |     | \
     *     (4) (5)   (6) (7)
     *          |
     *         (8)
     */
    fn graph1() -> Graph {
        let nodes = vec![1, 2, 3, 4, 5, 6, 7];
        let edges = vec![(1, 2), (1, 3), (2, 4), (2, 5), (3, 6), (3, 7), (5, 8)];

        Graph::new(
            nodes.into_iter().map(|v| v.into()).collect(),
            edges.into_iter().map(|e| e.into()).collect(),
        )
    }

    #[test]
    fn breadth_first_search_graph1_when_node_not_found_returns_none() {
        let graph = graph1();
        let root = 1;
        let target = 10;

        assert_eq!(
            breadth_first_search(&graph, root.into(), target.into()),
            None
        );
    }

    #[test]
    fn breadth_first_search_graph1_when_target_8_should_evaluate_all_nodes_first() {
        let graph = graph1();
        let root = 1;
        let target = 8;

        let expected_path = vec![1, 2, 3, 4, 5, 6, 7, 8];

        assert_eq!(
            breadth_first_search(&graph, root.into(), target.into()),
            Some(expected_path)
        );
    }

    /* Example graph #2:
     *
     *     (1) --- (2)     (3) --- (4)
     *            / |     /       /
     *          /   |   /       /
     *        /     | /       /
     *     (5)     (6) --- (7)     (8)
     */
    fn graph2() -> Graph {
        let nodes = vec![1, 2, 3, 4, 5, 6, 7, 8];
        let undirected_edges = vec![
            (1, 2),
            (2, 1),
            (2, 5),
            (5, 2),
            (2, 6),
            (6, 2),
            (3, 4),
            (4, 3),
            (3, 6),
            (6, 3),
            (4, 7),
            (7, 4),
            (6, 7),
            (7, 6),
        ];

        Graph::new(
            nodes.into_iter().map(|v| v.into()).collect(),
            undirected_edges.into_iter().map(|e| e.into()).collect(),
        )
    }

    #[test]
    fn breadth_first_search_graph2_when_no_path_to_node_returns_none() {
        let graph = graph2();
        let root = 8;
        let target = 4;

        assert_eq!(
            breadth_first_search(&graph, root.into(), target.into()),
            None
        );
    }

    #[test]
    fn breadth_first_search_graph2_should_find_path_from_4_to_1() {
        let graph = graph2();
        let root = 4;
        let target = 1;

        let expected_path = vec![4, 3, 7, 6, 2, 1];

        assert_eq!(
            breadth_first_search(&graph, root.into(), target.into()),
            Some(expected_path)
        );
    }
}
```

`INSERT HERE`

## DEPTH FIRST SEARCH (DFS)

`INSERT HERE`

```rust
use std::collections::HashSet;
use std::collections::VecDeque;

// Perform a Depth First Search Algorithm to find a element in a graph
//
// Return a Optional with a vector with history of vertex visiteds
// or a None if the element not exists on the graph
pub fn depth_first_search(graph: &Graph, root: Vertex, objective: Vertex) -> Option<Vec<u32>> {
    let mut visited: HashSet<Vertex> = HashSet::new();
    let mut history: Vec<u32> = Vec::new();
    let mut queue = VecDeque::new();
    queue.push_back(root);

    // While there is an element in the queue
    // get the first element of the vertex queue
    while let Some(current_vertex) = queue.pop_front() {
        // Added current vertex in the history of visiteds vertex
        history.push(current_vertex.value());

        // Verify if this vertex is the objective
        if current_vertex == objective {
            // Return the Optional with the history of visiteds vertex
            return Some(history);
        }

        // For each over the neighbors of current vertex
        for neighbor in current_vertex.neighbors(graph).into_iter().rev() {
            // Insert in the HashSet of visiteds if this value not exist yet
            if visited.insert(neighbor) {
                // Add the neighbor on front of queue
                queue.push_front(neighbor);
            }
        }
    }

    // If all vertex is visited and the objective is not found
    // return a Optional with None value
    None
}

// Data Structures

#[derive(Copy, Clone, PartialEq, Eq, Hash)]
pub struct Vertex(u32);
#[derive(Copy, Clone, PartialEq, Eq, Hash)]
pub struct Edge(u32, u32);
#[derive(Clone)]
pub struct Graph {
    #[allow(dead_code)]
    vertices: Vec<Vertex>,
    edges: Vec<Edge>,
}

impl Graph {
    pub fn new(vertices: Vec<Vertex>, edges: Vec<Edge>) -> Self {
        Graph { vertices, edges }
    }
}

impl From<u32> for Vertex {
    fn from(item: u32) -> Self {
        Vertex(item)
    }
}

impl Vertex {
    pub fn value(&self) -> u32 {
        self.0
    }

    pub fn neighbors(&self, graph: &Graph) -> VecDeque<Vertex> {
        graph
            .edges
            .iter()
            .filter(|e| e.0 == self.0)
            .map(|e| e.1.into())
            .collect()
    }
}

impl From<(u32, u32)> for Edge {
    fn from(item: (u32, u32)) -> Self {
        Edge(item.0, item.1)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn find_1_fail() {
        let vertices = vec![1, 2, 3, 4, 5, 6, 7];
        let edges = vec![(1, 2), (1, 3), (2, 4), (2, 5), (3, 6), (3, 7)];

        let root = 1;
        let objective = 99;

        let graph = Graph::new(
            vertices.into_iter().map(|v| v.into()).collect(),
            edges.into_iter().map(|e| e.into()).collect(),
        );

        assert_eq!(
            depth_first_search(&graph, root.into(), objective.into()),
            None
        );
    }

    #[test]
    fn find_1_sucess() {
        let vertices = vec![1, 2, 3, 4, 5, 6, 7];
        let edges = vec![(1, 2), (1, 3), (2, 4), (2, 5), (3, 6), (3, 7)];

        let root = 1;
        let objective = 7;

        let correct_path = vec![1, 2, 4, 5, 3, 6, 7];

        let graph = Graph::new(
            vertices.into_iter().map(|v| v.into()).collect(),
            edges.into_iter().map(|e| e.into()).collect(),
        );

        assert_eq!(
            depth_first_search(&graph, root.into(), objective.into()),
            Some(correct_path)
        );
    }

    #[test]
    fn find_2_sucess() {
        let vertices = vec![0, 1, 2, 3, 4, 5, 6, 7];
        let edges = vec![
            (0, 1),
            (1, 3),
            (3, 2),
            (2, 1),
            (3, 4),
            (4, 5),
            (5, 7),
            (7, 6),
            (6, 4),
        ];

        let root = 0;
        let objective = 6;

        let correct_path = vec![0, 1, 3, 2, 4, 5, 7, 6];

        let graph = Graph::new(
            vertices.into_iter().map(|v| v.into()).collect(),
            edges.into_iter().map(|e| e.into()).collect(),
        );

        assert_eq!(
            depth_first_search(&graph, root.into(), objective.into()),
            Some(correct_path)
        );
    }

    #[test]
    fn find_3_sucess() {
        let vertices = vec![0, 1, 2, 3, 4, 5, 6, 7];
        let edges = vec![
            (0, 1),
            (1, 3),
            (3, 2),
            (2, 1),
            (3, 4),
            (4, 5),
            (5, 7),
            (7, 6),
            (6, 4),
        ];

        let root = 0;
        let objective = 4;

        let correct_path = vec![0, 1, 3, 2, 4];

        let graph = Graph::new(
            vertices.into_iter().map(|v| v.into()).collect(),
            edges.into_iter().map(|e| e.into()).collect(),
        );

        assert_eq!(
            depth_first_search(&graph, root.into(), objective.into()),
            Some(correct_path)
        );
    }
}
```

`INSERT HERE`

## BELLMAN-FORD

`INSERT HERE`

```rust
use std::collections::BTreeMap;
use std::ops::Add;

use std::ops::Neg;

type Graph<V, E> = BTreeMap<V, BTreeMap<V, E>>;

// performs the Bellman-Ford algorithm on the given graph from the given start
// the graph is an undirected graph
//
// if there is a negative weighted loop it returns None
// else it returns a map that for each reachable vertex associates the distance and the predecessor
// since the start has no predecessor but is reachable, map[start] will be None
pub fn bellman_ford<
    V: Ord + Copy,
    E: Ord + Copy + Add<Output = E> + Neg<Output = E> + std::ops::Sub<Output = E>,
>(
    graph: &Graph<V, E>,
    start: &V,
) -> Option<BTreeMap<V, Option<(V, E)>>> {
    let mut ans: BTreeMap<V, Option<(V, E)>> = BTreeMap::new();

    ans.insert(*start, None);

    for _ in 1..(graph.len()) {
        for (u, edges) in graph {
            let dist_u = match ans.get(u) {
                Some(Some((_, d))) => Some(*d),
                Some(None) => None,
                None => continue,
            };

            for (v, d) in edges {
                match ans.get(v) {
                    Some(Some((_, dist)))
                        // if this is a longer path, do nothing
                        if match dist_u {
                            Some(dist_u) => dist_u + *d >= *dist,
                            None => d >= dist,
                        } => {}
                    Some(None) => {
                        match dist_u {
                            // if dist_u + d < 0 there is a negative loop going by start
                            // else it's just a longer path
                            Some(dist_u) if dist_u >= -*d => {}
                            // negative self edge or negative loop
                            _ => {
                                if *d > *d + *d {
                                    return None;
                                }
                            }
                        };
                    }
                    // it's a shorter path: either dist_v was infinite or it was longer than dist_u + d
                    _ => {
                        ans.insert(
                            *v,
                            Some((
                                *u,
                                match dist_u {
                                    Some(dist) => dist + *d,
                                    None => *d,
                                },
                            )),
                        );
                    }
                }
            }
        }
    }

    for (u, edges) in graph {
        for (v, d) in edges {
            match (ans.get(u), ans.get(v)) {
                (Some(None), Some(None)) if *d > *d + *d => return None,
                (Some(None), Some(Some((_, dv)))) if d < dv => return None,
                (Some(Some((_, du))), Some(None)) if *du < -*d => return None,
                (Some(Some((_, du))), Some(Some((_, dv)))) if *du + *d < *dv => return None,
                (_, _) => {}
            }
        }
    }

    Some(ans)
}

#[cfg(test)]
mod tests {
    use super::{bellman_ford, Graph};
    use std::collections::BTreeMap;

    fn add_edge<V: Ord + Copy, E: Ord>(graph: &mut Graph<V, E>, v1: V, v2: V, c: E) {
        graph.entry(v1).or_insert_with(BTreeMap::new).insert(v2, c);
        graph.entry(v2).or_insert_with(BTreeMap::new);
    }

    #[test]
    fn single_vertex() {
        let mut graph: Graph<isize, isize> = BTreeMap::new();
        graph.insert(0, BTreeMap::new());

        let mut dists = BTreeMap::new();
        dists.insert(0, None);

        assert_eq!(bellman_ford(&graph, &0), Some(dists));
    }

    #[test]
    fn single_edge() {
        let mut graph = BTreeMap::new();
        add_edge(&mut graph, 0, 1, 2);

        let mut dists_0 = BTreeMap::new();
        dists_0.insert(0, None);
        dists_0.insert(1, Some((0, 2)));

        assert_eq!(bellman_ford(&graph, &0), Some(dists_0));

        let mut dists_1 = BTreeMap::new();
        dists_1.insert(1, None);

        assert_eq!(bellman_ford(&graph, &1), Some(dists_1));
    }

    #[test]
    fn tree_1() {
        let mut graph = BTreeMap::new();
        let mut dists = BTreeMap::new();
        dists.insert(1, None);
        for i in 1..100 {
            add_edge(&mut graph, i, i * 2, i * 2);
            add_edge(&mut graph, i, i * 2 + 1, i * 2 + 1);

            match dists[&i] {
                Some((_, d)) => {
                    dists.insert(i * 2, Some((i, d + i * 2)));
                    dists.insert(i * 2 + 1, Some((i, d + i * 2 + 1)));
                }
                None => {
                    dists.insert(i * 2, Some((i, i * 2)));
                    dists.insert(i * 2 + 1, Some((i, i * 2 + 1)));
                }
            }
        }

        assert_eq!(bellman_ford(&graph, &1), Some(dists));
    }

    #[test]
    fn graph_1() {
        let mut graph = BTreeMap::new();
        add_edge(&mut graph, 'a', 'c', 12);
        add_edge(&mut graph, 'a', 'd', 60);
        add_edge(&mut graph, 'b', 'a', 10);
        add_edge(&mut graph, 'c', 'b', 20);
        add_edge(&mut graph, 'c', 'd', 32);
        add_edge(&mut graph, 'e', 'a', 7);

        let mut dists_a = BTreeMap::new();
        dists_a.insert('a', None);
        dists_a.insert('c', Some(('a', 12)));
        dists_a.insert('d', Some(('c', 44)));
        dists_a.insert('b', Some(('c', 32)));
        assert_eq!(bellman_ford(&graph, &'a'), Some(dists_a));

        let mut dists_b = BTreeMap::new();
        dists_b.insert('b', None);
        dists_b.insert('a', Some(('b', 10)));
        dists_b.insert('c', Some(('a', 22)));
        dists_b.insert('d', Some(('c', 54)));
        assert_eq!(bellman_ford(&graph, &'b'), Some(dists_b));

        let mut dists_c = BTreeMap::new();
        dists_c.insert('c', None);
        dists_c.insert('b', Some(('c', 20)));
        dists_c.insert('d', Some(('c', 32)));
        dists_c.insert('a', Some(('b', 30)));
        assert_eq!(bellman_ford(&graph, &'c'), Some(dists_c));

        let mut dists_d = BTreeMap::new();
        dists_d.insert('d', None);
        assert_eq!(bellman_ford(&graph, &'d'), Some(dists_d));

        let mut dists_e = BTreeMap::new();
        dists_e.insert('e', None);
        dists_e.insert('a', Some(('e', 7)));
        dists_e.insert('c', Some(('a', 19)));
        dists_e.insert('d', Some(('c', 51)));
        dists_e.insert('b', Some(('c', 39)));
        assert_eq!(bellman_ford(&graph, &'e'), Some(dists_e));
    }

    #[test]
    fn graph_2() {
        let mut graph = BTreeMap::new();
        add_edge(&mut graph, 0, 1, 6);
        add_edge(&mut graph, 0, 3, 7);
        add_edge(&mut graph, 1, 2, 5);
        add_edge(&mut graph, 1, 3, 8);
        add_edge(&mut graph, 1, 4, -4);
        add_edge(&mut graph, 2, 1, -2);
        add_edge(&mut graph, 3, 2, -3);
        add_edge(&mut graph, 3, 4, 9);
        add_edge(&mut graph, 4, 0, 3);
        add_edge(&mut graph, 4, 2, 7);

        let mut dists_0 = BTreeMap::new();
        dists_0.insert(0, None);
        dists_0.insert(1, Some((2, 2)));
        dists_0.insert(2, Some((3, 4)));
        dists_0.insert(3, Some((0, 7)));
        dists_0.insert(4, Some((1, -2)));
        assert_eq!(bellman_ford(&graph, &0), Some(dists_0));

        let mut dists_1 = BTreeMap::new();
        dists_1.insert(0, Some((4, -1)));
        dists_1.insert(1, None);
        dists_1.insert(2, Some((4, 3)));
        dists_1.insert(3, Some((0, 6)));
        dists_1.insert(4, Some((1, -4)));
        assert_eq!(bellman_ford(&graph, &1), Some(dists_1));

        let mut dists_2 = BTreeMap::new();
        dists_2.insert(0, Some((4, -3)));
        dists_2.insert(1, Some((2, -2)));
        dists_2.insert(2, None);
        dists_2.insert(3, Some((0, 4)));
        dists_2.insert(4, Some((1, -6)));
        assert_eq!(bellman_ford(&graph, &2), Some(dists_2));

        let mut dists_3 = BTreeMap::new();
        dists_3.insert(0, Some((4, -6)));
        dists_3.insert(1, Some((2, -5)));
        dists_3.insert(2, Some((3, -3)));
        dists_3.insert(3, None);
        dists_3.insert(4, Some((1, -9)));
        assert_eq!(bellman_ford(&graph, &3), Some(dists_3));

        let mut dists_4 = BTreeMap::new();
        dists_4.insert(0, Some((4, 3)));
        dists_4.insert(1, Some((2, 5)));
        dists_4.insert(2, Some((4, 7)));
        dists_4.insert(3, Some((0, 10)));
        dists_4.insert(4, None);
        assert_eq!(bellman_ford(&graph, &4), Some(dists_4));
    }

    #[test]
    fn graph_with_negative_loop() {
        let mut graph = BTreeMap::new();
        add_edge(&mut graph, 0, 1, 6);
        add_edge(&mut graph, 0, 3, 7);
        add_edge(&mut graph, 1, 2, 5);
        add_edge(&mut graph, 1, 3, 8);
        add_edge(&mut graph, 1, 4, -4);
        add_edge(&mut graph, 2, 1, -4);
        add_edge(&mut graph, 3, 2, -3);
        add_edge(&mut graph, 3, 4, 9);
        add_edge(&mut graph, 4, 0, 3);
        add_edge(&mut graph, 4, 2, 7);

        assert_eq!(bellman_ford(&graph, &0), None);
        assert_eq!(bellman_ford(&graph, &1), None);
        assert_eq!(bellman_ford(&graph, &2), None);
        assert_eq!(bellman_ford(&graph, &3), None);
        assert_eq!(bellman_ford(&graph, &4), None);
    }
}
```

`INSERT HERE`

## PRUFER CODE

`INSERT HERE`

```rust
use std::collections::{BTreeMap, BTreeSet, BinaryHeap};

type Graph<V> = BTreeMap<V, Vec<V>>;

pub fn prufer_encode<V: Ord + Copy>(tree: &Graph<V>) -> Vec<V> {
    if tree.len() <= 2 {
        return vec![];
    }
    let mut result: Vec<V> = Vec::new();
    result.reserve(tree.len() - 2);
    let mut queue = BinaryHeap::new();
    let mut in_tree = BTreeSet::new();
    let mut degree = BTreeMap::new();
    for (vertex, adj) in tree {
        in_tree.insert(*vertex);
        degree.insert(*vertex, adj.len());
        if adj.len() == 1 {
            queue.push(*vertex);
        }
    }
    for _ in 2..tree.len() {
        let v = queue.pop().unwrap();
        in_tree.remove(&v);
        let u = tree[&v].iter().find(|u| in_tree.contains(u)).unwrap();
        result.push(*u);
        *degree.get_mut(u).unwrap() -= 1;
        if degree[u] == 1 {
            queue.push(*u);
        }
    }
    result
}

#[inline]
fn add_directed_edge<V: Ord + Copy>(tree: &mut Graph<V>, a: V, b: V) {
    tree.entry(a).or_default().push(b);
}

#[inline]
fn add_edge<V: Ord + Copy>(tree: &mut Graph<V>, a: V, b: V) {
    add_directed_edge(tree, a, b);
    add_directed_edge(tree, b, a);
}

pub fn prufer_decode<V: Ord + Copy>(code: &[V], vertex_list: &[V]) -> Graph<V> {
    // For many cases, this function won't fail even if given unsuitable code
    // array. As such, returning really unlikely errors doesn't make much sense.
    let mut result = BTreeMap::new();
    let mut list_count: BTreeMap<V, usize> = BTreeMap::new();
    for vertex in code {
        *list_count.entry(*vertex).or_insert(0) += 1;
    }
    let mut queue = BinaryHeap::from(
        vertex_list
            .iter()
            .filter(|v| !list_count.contains_key(v))
            .cloned()
            .collect::<Vec<V>>(),
    );
    for vertex in code {
        let child = queue.pop().unwrap();
        add_edge(&mut result, child, *vertex);
        let cnt = list_count.get_mut(vertex).unwrap();
        *cnt -= 1;
        if *cnt == 0 {
            queue.push(*vertex);
        }
    }
    let u = queue.pop().unwrap();
    let v = queue.pop().unwrap();
    add_edge(&mut result, u, v);
    result
}

#[cfg(test)]
mod tests {
    use super::{add_edge, prufer_decode, prufer_encode, Graph};

    fn equal_graphs<V: Ord + Copy>(g1: &mut Graph<V>, g2: &mut Graph<V>) -> bool {
        for adj in g1.values_mut() {
            adj.sort();
        }
        for adj in g2.values_mut() {
            adj.sort();
        }
        return g1 == g2;
    }

    #[test]
    fn small_trees() {
        let mut g: Graph<u32> = Graph::new();
        // Binary tree with 7 vertices
        let edges = vec![(1, 2), (1, 3), (2, 4), (2, 5), (3, 6), (3, 7)];
        for (u, v) in edges {
            add_edge(&mut g, u, v);
        }
        let code = prufer_encode(&g);
        let vertices = g.keys().cloned().collect::<Vec<u32>>();
        let mut decoded = prufer_decode(&code, &vertices);
        assert_eq!(code, vec![3, 3, 2, 2, 1]);
        assert!(equal_graphs(&mut g, &mut decoded));

        g.clear();
        // A path of length 10
        for v in 2..=9 {
            g.insert(v, vec![v - 1, v + 1]);
        }
        g.insert(1, vec![2]);
        g.insert(10, vec![9]);
        let code = prufer_encode(&g);
        let vertices = g.keys().cloned().collect::<Vec<u32>>();
        let mut decoded = prufer_decode(&code, &vertices);
        assert_eq!(code, vec![9, 8, 7, 6, 5, 4, 3, 2]);
        assert!(equal_graphs(&mut g, &mut decoded));

        g.clear();
        // 7-5-3-1-2-4-6
        let edges = vec![(1, 2), (2, 4), (4, 6), (1, 3), (3, 5), (5, 7)];
        for (u, v) in edges {
            add_edge(&mut g, u, v);
        }
        let code = prufer_encode(&g);
        let vertices = g.keys().cloned().collect::<Vec<u32>>();
        let mut decoded = prufer_decode(&code, &vertices);
        assert_eq!(code, vec![5, 4, 3, 2, 1]);
        assert!(equal_graphs(&mut g, &mut decoded));
    }
}
```

`INSERT HERE`

## LOWEST COMMON ANCESTOR

`INSERT HERE`

```rust
/*
 Note: We will assume that here tree vertices are numbered from 1 to n.
If a tree is not enumerated that way or its vertices are not represented
using numbers, it can trivially be converted using Depth First Search
manually or by using `src/graph/graph_enumeration.rs`

 Here we implement two different algorithms:
- The online one is implemented using Sparse Table and has O(n.lg(n))
time complexity and memory usage. It answers each query in O(lg(n)).
- The offline algorithm was discovered by Robert Tarjan. At first each
query should be determined and saved. Then, vertices are visited in
Depth First Search order and queries are answered using Disjoint
Set Union algorithm. The time complexity is O(n.alpha(n) + q) and
memory usage is O(n + q), but time complexity can be considered to be O(n + q),
because alpha(n) < 5 for n < 10 ^ 600
 */

use super::DisjointSetUnion;
pub struct LowestCommonAncestorOnline {
    // Make members public to allow the user to fill them themself.
    pub parents_sparse_table: Vec<Vec<usize>>,
    pub height: Vec<usize>,
}

impl LowestCommonAncestorOnline {
    // Should be called once as:
    // fill_sparse_table(tree_root, 0, 0, adjacency_list)
    #[inline]
    fn get_parent(&self, v: usize, i: usize) -> usize {
        self.parents_sparse_table[v][i]
    }
    #[inline]
    fn num_parents(&self, v: usize) -> usize {
        self.parents_sparse_table[v].len()
    }
    pub fn new(num_vertices: usize) -> Self {
        let mut pars = vec![vec![0]; num_vertices + 1];
        pars[0].clear();
        LowestCommonAncestorOnline {
            parents_sparse_table: pars,
            height: vec![0; num_vertices + 1],
        }
    }
    pub fn fill_sparse_table(
        &mut self,
        vertex: usize,
        parent: usize,
        height: usize,
        adj: &[Vec<usize>],
    ) {
        self.parents_sparse_table[vertex][0] = parent;
        self.height[vertex] = height;
        let mut level = 1;
        let mut current_parent = parent;
        while self.num_parents(current_parent) >= level {
            current_parent = self.get_parent(current_parent, level - 1);
            level += 1;
            self.parents_sparse_table[vertex].push(current_parent);
        }
        for &child in adj[vertex].iter() {
            if child == parent {
                // It isn't a child!
                continue;
            }
            self.fill_sparse_table(child, vertex, height + 1, adj);
        }
    }

    pub fn get_ancestor(&self, mut v: usize, mut u: usize) -> usize {
        if self.height[v] < self.height[u] {
            std::mem::swap(&mut v, &mut u);
        }
        // Bring v up to so that it has the same height as u
        let height_diff = self.height[v] - self.height[u];
        for i in 0..63 {
            let bit = 1 << i;
            if bit > height_diff {
                break;
            }
            if height_diff & bit != 0 {
                v = self.get_parent(v, i);
            }
        }
        if u == v {
            return u;
        }
        // `self.num_parents` of u and v should be equal
        for i in (0..self.num_parents(v)).rev() {
            let nv = self.get_parent(v, i);
            let nu = self.get_parent(u, i);
            if nv != nu {
                u = nu;
                v = nv;
            }
        }
        self.get_parent(v, 0)
    }
}

#[derive(Clone, Copy)]
pub struct LCAQuery {
    other: usize,
    query_id: usize,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct QueryAnswer {
    query_id: usize,
    answer: usize,
}

pub struct LowestCommonAncestorOffline {
    pub queries: Vec<Vec<LCAQuery>>,
    dsu: DisjointSetUnion,
    /*
    The LSB of dsu_parent[v] determines whether it was visited or not.
    The rest of the number determines the vertex that represents a
    particular set in DSU.
    */
    dsu_parent: Vec<u64>,
}

impl LowestCommonAncestorOffline {
    pub fn new(num_vertices: usize) -> Self {
        LowestCommonAncestorOffline {
            queries: vec![vec![]; num_vertices + 1],
            dsu: DisjointSetUnion::new(num_vertices),
            dsu_parent: vec![0; num_vertices + 1],
        }
    }
    pub fn add_query(&mut self, u: usize, v: usize, query_id: usize) {
        // We should add this query to both vertices, and it will be answered
        // the second time it is seen in DFS.
        self.queries[u].push(LCAQuery { other: v, query_id });
        if u == v {
            return;
        }
        self.queries[v].push(LCAQuery { other: u, query_id });
    }

    fn calculate_answers(
        &mut self,
        vertex: usize,
        parent: usize,
        adj: &[Vec<usize>],
        answers: &mut Vec<QueryAnswer>,
    ) {
        self.dsu_parent[vertex] = (vertex as u64) << 1;
        for &child in adj[vertex].iter() {
            if child == parent {
                continue;
            }
            self.calculate_answers(child, vertex, adj, answers);
            self.dsu.merge(child, vertex);
            let set = self.dsu.find_set(vertex);
            self.dsu_parent[set] = ((vertex as u64) << 1) | (self.dsu_parent[set] & 1);
        }
        self.dsu_parent[vertex] |= 0b1;
        for &query in self.queries[vertex].iter() {
            if self.dsu_parent[query.other] & 1 != 0 {
                // It has been visited
                answers.push(QueryAnswer {
                    query_id: query.query_id,
                    answer: (self.dsu_parent[self.dsu.find_set(query.other)] >> 1) as usize,
                });
            }
        }
    }
    pub fn answer_queries(&mut self, root: usize, adj: &[Vec<usize>]) -> Vec<QueryAnswer> {
        let mut answers = Vec::new();
        self.calculate_answers(root, 0, adj, &mut answers);
        answers
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn small_binary_tree() {
        let num_verts = 127;
        let mut tree: Vec<Vec<usize>> = vec![vec![]; num_verts + 1];
        for i in 1..=num_verts >> 1 {
            let left_child = i << 1;
            let right_child = left_child + 1;
            tree[i].push(left_child);
            tree[i].push(right_child);
            tree[left_child].push(i);
            tree[right_child].push(i);
        }
        let mut online_answers: Vec<QueryAnswer> = Vec::new();
        let mut online = LowestCommonAncestorOnline::new(num_verts);
        let mut offline = LowestCommonAncestorOffline::new(num_verts);
        let mut query_id = 314; // A random number, doesn't matter
        online.fill_sparse_table(1, 0, 0, &tree);
        for i in 1..=num_verts {
            for j in 1..i {
                // Query every possible pair
                online_answers.push(QueryAnswer {
                    query_id,
                    answer: online.get_ancestor(i, j),
                });
                offline.add_query(i, j, query_id);
                query_id += 1;
            }
        }
        let mut offline_answers = offline.answer_queries(1, &tree);
        offline_answers.sort_unstable_by(|a1, a2| a1.query_id.cmp(&a2.query_id));
        assert_eq!(offline_answers, online_answers);
    }
}
```

`INSERT HERE`

## HEAVY LIGHT DECOMPOSITION

`INSERT HERE`

```rust
/*
Heavy Light Decomposition:
It partitions a tree into disjoint paths such that:
1. Each path is a part of some leaf's path to root
2. The number of paths from any vertex to the root is of O(lg(n))
Such a decomposition can be used to answer many types of queries about vertices
or edges on a particular path. It is often used with some sort of binary tree
to handle different operations on the paths, for example segment tree or
fenwick tree.

Many members of this struct are made public, because they can either be
supplied by the developer, or can be useful for other parts of the code.

The implementation assumes that the tree vertices are numbered from 1 to n
and it is represented using (compressed) adjacency matrix. If this is not true,
maybe `graph_enumeration.rs` can help.
*/

type Adj = [Vec<usize>];

pub struct HeavyLightDecomposition {
    // Each vertex is assigned a number from 1 to n. For `v` and `u` such that
    // u is parent of v, and both are in path `p`, it is true that:
    // position[u] = position[v] - 1
    pub position: Vec<usize>,

    // The first (closest to root) vertex of the path containing each vertex
    pub head: Vec<usize>,

    // The "heaviest" child of each vertex, its subtree is at least as big as
    // the other ones. If `v` is a leaf, big_child[v] = 0
    pub big_child: Vec<usize>,

    // Used internally to fill `position` Vec
    current_position: usize,
}

impl HeavyLightDecomposition {
    pub fn new(mut num_vertices: usize) -> Self {
        num_vertices += 1;
        HeavyLightDecomposition {
            position: vec![0; num_vertices],
            head: vec![0; num_vertices],
            big_child: vec![0; num_vertices],
            current_position: 1,
        }
    }
    fn dfs(&mut self, v: usize, parent: usize, adj: &Adj) -> usize {
        let mut big_child = 0usize;
        let mut bc_size = 0usize; // big child size
        let mut subtree_size = 1usize; // size of this subtree
        for &u in adj[v].iter() {
            if u == parent {
                continue;
            }
            let u_size = self.dfs(u, v, adj);
            subtree_size += u_size;
            if u_size > bc_size {
                big_child = u;
                bc_size = u_size;
            }
        }
        self.big_child[v] = big_child;
        subtree_size
    }
    pub fn decompose(&mut self, root: usize, adj: &Adj) {
        self.current_position = 1;
        self.dfs(root, 0, adj);
        self.decompose_path(root, 0, root, adj);
    }
    fn decompose_path(&mut self, v: usize, parent: usize, head: usize, adj: &Adj) {
        self.head[v] = head;
        self.position[v] = self.current_position;
        self.current_position += 1;
        let bc = self.big_child[v];
        if bc != 0 {
            // Continue this path
            self.decompose_path(bc, v, head, adj);
        }
        for &u in adj[v].iter() {
            if u == parent || u == bc {
                continue;
            }
            // Start a new path
            self.decompose_path(u, v, u, adj);
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    struct LinearCongruenceGenerator {
        // modulus as 2 ^ 32
        multiplier: u32,
        increment: u32,
        state: u32,
    }

    impl LinearCongruenceGenerator {
        fn new(multiplier: u32, increment: u32, state: u32) -> Self {
            Self {
                multiplier,
                increment,
                state,
            }
        }
        fn next(&mut self) -> u32 {
            self.state =
                (self.multiplier as u64 * self.state as u64 + self.increment as u64) as u32;
            self.state
        }
    }

    fn get_num_paths(
        hld: &HeavyLightDecomposition,
        mut v: usize,
        parent: &[usize],
    ) -> (usize, usize) {
        // Return height and number of paths
        let mut ans = 0usize;
        let mut height = 0usize;
        let mut prev_head = 0usize;
        loop {
            height += 1;
            let head = hld.head[v];
            if head != prev_head {
                ans += 1;
                prev_head = head;
            }
            v = parent[v];
            if v == 0 {
                break;
            }
        }
        (ans, height)
    }

    #[test]
    fn single_path() {
        let mut adj = vec![vec![], vec![2], vec![3], vec![4], vec![5], vec![6], vec![]];
        let mut hld = HeavyLightDecomposition::new(6);
        hld.decompose(1, &adj);
        assert_eq!(hld.head, vec![0, 1, 1, 1, 1, 1, 1]);
        assert_eq!(hld.position, vec![0, 1, 2, 3, 4, 5, 6]);
        assert_eq!(hld.big_child, vec![0, 2, 3, 4, 5, 6, 0]);

        adj[3].push(2);
        adj[2].push(1);
        hld.decompose(3, &adj);
        assert_eq!(hld.head, vec![0, 2, 2, 3, 3, 3, 3]);
        assert_eq!(hld.position, vec![0, 6, 5, 1, 2, 3, 4]);
        assert_eq!(hld.big_child, vec![0, 0, 1, 4, 5, 6, 0]);
    }

    #[test]
    fn random_tree() {
        // Let it have 1e4 vertices. It should finish under 100ms even with
        // 1e5 vertices
        let n = 1e4 as usize;
        let threshold = 14; // 2 ^ 14 = 16384 > n
        let mut adj: Vec<Vec<usize>> = vec![vec![]; n + 1];
        let mut parent: Vec<usize> = vec![0; n + 1];
        let mut hld = HeavyLightDecomposition::new(n);
        let mut lcg = LinearCongruenceGenerator::new(1103515245, 12345, 314);
        parent[2] = 1;
        adj[1].push(2);
        for i in 3..=n {
            // randomly determine the parent of each vertex.
            // There will be modulus bias, but it isn't important
            let par_max = i - 1;
            let par_min = (10 * par_max + 1) / 11;
            // Bring par_min closer to par_max to increase expected tree height
            let par = (lcg.next() as usize % (par_max - par_min + 1)) + par_min;
            adj[par].push(i);
            parent[i] = par;
        }
        // let's get a few leaves
        let leaves: Vec<usize> = (1..=n)
            .rev()
            .filter(|&v| adj[v].is_empty())
            .take(100)
            .collect();
        hld.decompose(1, &adj);
        for l in leaves {
            let (p, _h) = get_num_paths(&hld, l, &parent);
            assert!(p <= threshold);
        }
    }
}
```

`INSERT HERE`

## TARJAN'S STRONGLY CONNECTED COMPONENTS

`INSERT HERE`

```rust
/*
Tarjan's algorithm to find Strongly Connected Components (SCCs):
It runs in O(n + m) (so it is optimal) and as a by-product, it returns the
components in some (reverse) topologically sorted order.

We assume that graph is represented using (compressed) adjacency matrix
and its vertices are numbered from 1 to n. If this is not the case, one
can use `src/graph/graph_enumeration.rs` to convert their graph.
*/

pub struct StronglyConnectedComponents {
    // The number of the SCC the vertex is in, starting from 1
    pub component: Vec<usize>,

    // The discover time of the vertex with minimum discover time reachable
    // from this vertex. The MSB of the numbers are used to save whether the
    // vertex has been visited (but the MSBs are cleared after
    // the algorithm is done)
    pub state: Vec<u64>,

    // The total number of SCCs
    pub num_components: usize,

    // The stack of vertices that DFS has seen (used internally)
    stack: Vec<usize>,
    // Used internally during DFS to know the current discover time
    current_time: usize,
}

// Some functions to help with DRY and code readability
const NOT_DONE: u64 = 1 << 63;

#[inline]
fn set_done(vertex_state: &mut u64) {
    *vertex_state ^= NOT_DONE;
}

#[inline]
fn is_in_stack(vertex_state: u64) -> bool {
    vertex_state != 0 && (vertex_state & NOT_DONE) != 0
}

#[inline]
fn is_unvisited(vertex_state: u64) -> bool {
    vertex_state == NOT_DONE
}

#[inline]
fn get_discover_time(vertex_state: u64) -> u64 {
    vertex_state ^ NOT_DONE
}

impl StronglyConnectedComponents {
    pub fn new(mut num_vertices: usize) -> Self {
        num_vertices += 1; // Vertices are numbered from 1, not 0
        StronglyConnectedComponents {
            component: vec![0; num_vertices],
            state: vec![NOT_DONE; num_vertices],
            num_components: 0,
            stack: vec![],
            current_time: 1,
        }
    }
    fn dfs(&mut self, v: usize, adj: &[Vec<usize>]) -> u64 {
        let mut min_disc = self.current_time as u64;
        // self.state[v] = NOT_DONE + min_disc
        self.state[v] ^= min_disc;
        self.current_time += 1;
        self.stack.push(v);

        for &u in adj[v].iter() {
            if is_unvisited(self.state[u]) {
                min_disc = std::cmp::min(self.dfs(u, adj), min_disc);
            } else if is_in_stack(self.state[u]) {
                min_disc = std::cmp::min(get_discover_time(self.state[u]), min_disc);
            }
        }

        // No vertex with a lower discovery time is reachable from this one
        // So it should be "the head" of a new SCC.
        if min_disc == get_discover_time(self.state[v]) {
            self.num_components += 1;
            loop {
                let u = self.stack.pop().unwrap();
                self.component[u] = self.num_components;
                set_done(&mut self.state[u]);
                if u == v {
                    break;
                }
            }
        }

        min_disc
    }
    pub fn find_components(&mut self, adj: &[Vec<usize>]) {
        self.state[0] = 0;
        for v in 1..adj.len() {
            if is_unvisited(self.state[v]) {
                self.dfs(v, adj);
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn acyclic() {
        let mut sccs = StronglyConnectedComponents::new(5);
        let adj = vec![vec![], vec![2, 4], vec![3, 4], vec![5], vec![5], vec![]];
        sccs.find_components(&adj);
        assert_eq!(sccs.component, vec![0, 5, 4, 2, 3, 1]);
        assert_eq!(sccs.state, vec![0, 1, 2, 3, 5, 4]);
        assert_eq!(sccs.num_components, 5);
    }

    #[test]
    fn cycle() {
        let mut sccs = StronglyConnectedComponents::new(4);
        let adj = vec![vec![], vec![2], vec![3], vec![4], vec![1]];
        sccs.find_components(&adj);
        assert_eq!(sccs.component, vec![0, 1, 1, 1, 1]);
        assert_eq!(sccs.state, vec![0, 1, 2, 3, 4]);
        assert_eq!(sccs.num_components, 1);
    }

    #[test]
    fn dumbbell() {
        let mut sccs = StronglyConnectedComponents::new(6);
        let adj = vec![
            vec![],
            vec![2],
            vec![3, 4],
            vec![1],
            vec![5],
            vec![6],
            vec![4],
        ];
        sccs.find_components(&adj);
        assert_eq!(sccs.component, vec![0, 2, 2, 2, 1, 1, 1]);
        assert_eq!(sccs.state, vec![0, 1, 2, 3, 4, 5, 6]);
        assert_eq!(sccs.num_components, 2);
    }

    #[test]
    fn connected_dumbbell() {
        let mut sccs = StronglyConnectedComponents::new(6);
        let adj = vec![
            vec![],
            vec![2],
            vec![3, 4],
            vec![1],
            vec![5, 1],
            vec![6],
            vec![4],
        ];
        sccs.find_components(&adj);
        assert_eq!(sccs.component, vec![0, 1, 1, 1, 1, 1, 1]);
        assert_eq!(sccs.state, vec![0, 1, 2, 3, 4, 5, 6]);
        assert_eq!(sccs.num_components, 1);
    }
}
```

`INSERT HERE`

## TOPOLOGICAL SORTING

`INSERT HERE`

```rust
use std::collections::{BTreeMap, VecDeque};

type Graph<V, E> = BTreeMap<V, Vec<(V, E)>>;

/// returns topological sort of the graph using Kahn's algorithm
pub fn topological_sort<V: Ord + Copy, E: Ord>(graph: &Graph<V, E>) -> Vec<V> {
    let mut visited = BTreeMap::new();
    let mut degree = BTreeMap::new();
    for u in graph.keys() {
        degree.insert(*u, 0);
        for (v, _) in graph.get(u).unwrap() {
            let entry = degree.entry(*v).or_insert(0);
            *entry += 1;
        }
    }
    let mut queue = VecDeque::new();
    for (u, d) in degree.iter() {
        if *d == 0 {
            queue.push_back(*u);
            visited.insert(*u, true);
        }
    }
    let mut ret = Vec::new();
    while let Some(u) = queue.pop_front() {
        ret.push(u);
        if let Some(from_u) = graph.get(&u) {
            for (v, _) in from_u {
                *degree.get_mut(v).unwrap() -= 1;
                if *degree.get(v).unwrap() == 0 {
                    queue.push_back(*v);
                    visited.insert(*v, true);
                }
            }
        }
    }
    ret
}

#[cfg(test)]
mod tests {
    use std::collections::BTreeMap;

    use super::{topological_sort, Graph};
    fn add_edge<V: Ord + Copy, E: Ord>(graph: &mut Graph<V, E>, from: V, to: V, weight: E) {
        let edges = graph.entry(from).or_insert(Vec::new());
        edges.push((to, weight));
    }

    #[test]
    fn it_works() {
        let mut graph = BTreeMap::new();
        add_edge(&mut graph, 1, 2, 1);
        add_edge(&mut graph, 1, 3, 1);
        add_edge(&mut graph, 2, 3, 1);
        add_edge(&mut graph, 3, 4, 1);
        add_edge(&mut graph, 4, 5, 1);
        add_edge(&mut graph, 5, 6, 1);
        add_edge(&mut graph, 6, 7, 1);

        assert_eq!(topological_sort(&graph), vec![1, 2, 3, 4, 5, 6, 7]);
    }
}
```

`INSERT HERE`

## CENTROID DECOMPOSITION

`INSERT HERE`

```rust
/*
Centroid Decomposition for a tree.

Given a tree, it can be recursively decomposed into centroids. Then the
parent of a centroid `c` is the previous centroid that splitted its connected
component into two or more components. It can be shown that in such
decomposition, for each path `p` with starting and ending vertices `u`, `v`,
the lowest common ancestor of `u` and `v` in centroid tree is a vertex of `p`.

The input tree should have its vertices numbered from 1 to n, and
`graph_enumeration.rs` may help to convert other representations.
 */

type Adj = [Vec<usize>];

const IN_DECOMPOSITION: u64 = 1 << 63;
pub struct CentroidDecomposition {
    /// The root of the centroid tree, should _not_ be set by the user
    pub root: usize,
    /// The result. decomposition[`v`] is the parent of `v` in centroid tree.
    /// decomposition[`root`] is 0
    pub decomposition: Vec<usize>,
    /// Used internally to save the big_child of a vertex, and whether it has
    /// been added to the centroid tree.
    vert_state: Vec<u64>,
    /// Used internally to save the subtree size of a vertex
    vert_size: Vec<usize>,
}

impl CentroidDecomposition {
    pub fn new(mut num_vertices: usize) -> Self {
        num_vertices += 1;
        CentroidDecomposition {
            root: 0,
            decomposition: vec![0; num_vertices],
            vert_state: vec![0; num_vertices],
            vert_size: vec![0; num_vertices],
        }
    }
    #[inline]
    fn put_in_decomposition(&mut self, v: usize, parent: usize) {
        self.decomposition[v] = parent;
        self.vert_state[v] |= IN_DECOMPOSITION;
    }
    #[inline]
    fn is_in_decomposition(&self, v: usize) -> bool {
        (self.vert_state[v] & IN_DECOMPOSITION) != 0
    }
    fn dfs_size(&mut self, v: usize, parent: usize, adj: &Adj) -> usize {
        self.vert_size[v] = 1;
        let mut big_child = 0_usize;
        let mut bc_size = 0_usize; // big child size
        for &u in adj[v].iter() {
            if u == parent || self.is_in_decomposition(u) {
                continue;
            }
            let u_size = self.dfs_size(u, v, adj);
            self.vert_size[v] += u_size;
            if u_size > bc_size {
                big_child = u;
                bc_size = u_size;
            }
        }
        self.vert_state[v] = big_child as u64;
        self.vert_size[v]
    }
    fn dfs_centroid(&self, v: usize, size_thr: usize) -> usize {
        // recurse until big child's size is <= `size_thr`
        match self.vert_state[v] as usize {
            u if self.vert_size[u] <= size_thr => v,
            u => self.dfs_centroid(u, size_thr),
        }
    }
    fn decompose_subtree(
        &mut self,
        v: usize,
        centroid_parent: usize,
        calculate_vert_size: bool,
        adj: &Adj,
    ) -> usize {
        // `calculate_vert_size` determines if it is necessary to recalculate
        // `self.vert_size`
        if calculate_vert_size {
            self.dfs_size(v, centroid_parent, adj);
        }
        let v_size = self.vert_size[v];
        let centroid = self.dfs_centroid(v, v_size >> 1);
        self.put_in_decomposition(centroid, centroid_parent);
        for &u in adj[centroid].iter() {
            if self.is_in_decomposition(u) {
                continue;
            }
            self.decompose_subtree(
                u,
                centroid,
                self.vert_size[u] > self.vert_size[centroid],
                adj,
            );
        }
        centroid
    }
    pub fn decompose_tree(&mut self, adj: &Adj) {
        self.decompose_subtree(1, 0, true, adj);
    }
}

#[cfg(test)]
mod tests {
    use super::CentroidDecomposition;
    use crate::{
        graph::{enumerate_graph, prufer_code},
        math::PCG32,
    };
    fn calculate_height(v: usize, heights: &mut [usize], parents: &mut [usize]) -> usize {
        if heights[v] == 0 {
            heights[v] = calculate_height(parents[v], heights, parents) + 1;
        }
        heights[v]
    }
    #[test]
    fn single_path() {
        let len = 16;
        let mut adj: Vec<Vec<usize>> = vec![vec![]; len];
        adj[1].push(2);
        adj[15].push(14);
        for i in 2..15 {
            adj[i].push(i + 1);
            adj[i].push(i - 1);
        }
        let mut cd = CentroidDecomposition::new(len - 1);
        cd.decompose_tree(&adj);
        // We should get a complete binary tree
        assert_eq!(
            cd.decomposition,
            vec![0, 2, 4, 2, 8, 6, 4, 6, 0, 10, 12, 10, 8, 14, 12, 14]
        );
    }
    #[test]
    #[ignore]
    fn random_tree_height() {
        // Do not run this test in debug mode! It takes > 30s to run without
        // optimizations!
        let n = 1e6 as usize;
        let max_height = 1 + 20;
        let len = n + 1;
        let mut rng = PCG32::new_default(314159);
        let mut tree_prufer_code: Vec<u32> = vec![0; n - 2];
        tree_prufer_code.fill_with(|| (rng.get_u32() % (n as u32)) + 1);
        let vertex_list: Vec<u32> = (1..=(n as u32)).collect();
        let adj = enumerate_graph(&prufer_code::prufer_decode(&tree_prufer_code, &vertex_list));
        let mut cd = CentroidDecomposition::new(n);
        cd.decompose_tree(&adj);
        let mut heights: Vec<usize> = vec![0; len];
        heights[0] = 1;
        for i in 1..=n {
            let h = calculate_height(i, &mut heights, &mut cd.decomposition);
            assert!(h <= max_height);
        }
    }
}
```

`INSERT HERE`

## DINIC'S MAX FLOW

`INSERT HERE`

```rust
use std::collections::VecDeque;
use std::ops::{Add, AddAssign, Neg, Sub, SubAssign};

// We assume that graph vertices are numbered from 1 to n.

/// Adjacency matrix
type Graph = Vec<Vec<usize>>;

/// We assume that T::default() gives "zero" flow and T supports negative values
pub struct FlowEdge<T> {
    pub sink: usize,
    pub capacity: T,
    pub flow: T,
}

pub struct FlowResultEdge<T> {
    pub source: usize,
    pub sink: usize,
    pub flow: T,
}

impl<T: Clone + Copy + Add + AddAssign + Sub<Output = T> + SubAssign + Ord + Neg + Default>
    FlowEdge<T>
{
    pub fn new(sink: usize, capacity: T) -> Self {
        FlowEdge {
            sink,
            capacity,
            flow: T::default(),
        }
    }
}

pub struct DinicMaxFlow<T> {
    /// BFS Level of each vertex. starts from 1
    level: Vec<usize>,

    /// The index of the last visited edge connected to each vertex
    pub last_edge: Vec<usize>,

    /// Holds wether the solution has already been calculated
    network_solved: bool,

    pub source: usize,
    pub sink: usize,

    /// Number of edges added to the residual network
    pub num_edges: usize,
    pub num_vertices: usize,

    pub adj: Graph,

    /// The list of flow edges
    pub edges: Vec<FlowEdge<T>>,
}

impl<T: Clone + Copy + Add + AddAssign + Sub<Output = T> + SubAssign + Neg + Ord + Default>
    DinicMaxFlow<T>
{
    pub fn new(source: usize, sink: usize, num_vertices: usize) -> Self {
        DinicMaxFlow {
            level: vec![0; num_vertices + 1],
            last_edge: vec![0; num_vertices + 1],
            network_solved: false,
            source,
            sink,
            num_edges: 0,
            num_vertices,
            adj: vec![vec![]; num_vertices + 1],
            edges: vec![],
        }
    }
    #[inline]
    pub fn add_edge(&mut self, source: usize, sink: usize, capacity: T) {
        self.edges.push(FlowEdge::new(sink, capacity));
        // Add the reverse edge with zero capacity
        self.edges.push(FlowEdge::new(source, T::default()));
        // We inserted the m'th edge from source to sink
        self.adj[source].push(self.num_edges);
        self.adj[sink].push(self.num_edges + 1);
        self.num_edges += 2;
    }

    fn bfs(&mut self) -> bool {
        let mut q: VecDeque<usize> = VecDeque::new();
        q.push_back(self.source);

        while !q.is_empty() {
            let v = q.pop_front().unwrap();
            for &e in self.adj[v].iter() {
                if self.edges[e].capacity <= self.edges[e].flow {
                    continue;
                }
                let u = self.edges[e].sink;
                if self.level[u] != 0 {
                    continue;
                }
                self.level[u] = self.level[v] + 1;
                q.push_back(u);
            }
        }

        self.level[self.sink] != 0
    }

    fn dfs(&mut self, v: usize, pushed: T) -> T {
        // We have pushed nothing, or we are at the sink
        if v == self.sink {
            return pushed;
        }
        for e_pos in self.last_edge[v]..self.adj[v].len() {
            let e = self.adj[v][e_pos];
            let u = self.edges[e].sink;
            if (self.level[v] + 1) != self.level[u] || self.edges[e].capacity <= self.edges[e].flow
            {
                continue;
            }
            let down_flow = self.dfs(
                u,
                std::cmp::min(pushed, self.edges[e].capacity - self.edges[e].flow),
            );
            if down_flow == T::default() {
                continue;
            }
            self.last_edge[v] = e_pos;
            self.edges[e].flow += down_flow;
            self.edges[e ^ 1].flow -= down_flow;
            return down_flow;
        }
        self.last_edge[v] = self.adj[v].len();
        T::default()
    }

    pub fn find_maxflow(&mut self, infinite_flow: T) -> T {
        self.network_solved = true;
        let mut total_flow: T = T::default();
        loop {
            self.level.fill(0);
            self.level[self.source] = 1;
            // There is no longer a path from source to sink in the residual
            // network
            if !self.bfs() {
                break;
            }
            self.last_edge.fill(0);
            let mut next_flow = self.dfs(self.source, infinite_flow);
            while next_flow != T::default() {
                total_flow += next_flow;
                next_flow = self.dfs(self.source, infinite_flow);
            }
        }
        total_flow
    }

    pub fn get_flow_edges(&mut self, infinite_flow: T) -> Vec<FlowResultEdge<T>> {
        if !self.network_solved {
            self.find_maxflow(infinite_flow);
        }
        let mut result = Vec::new();
        for v in 1..self.adj.len() {
            for &e_ind in self.adj[v].iter() {
                let e = &self.edges[e_ind];
                // Make sure that reverse edges from residual network are not
                // included
                if e.flow > T::default() {
                    result.push(FlowResultEdge {
                        source: v,
                        sink: e.sink,
                        flow: e.flow,
                    });
                }
            }
        }
        result
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn small_graph() {
        let mut flow: DinicMaxFlow<i32> = DinicMaxFlow::new(1, 6, 6);
        flow.add_edge(1, 2, 16);
        flow.add_edge(1, 4, 13);
        flow.add_edge(2, 3, 12);
        flow.add_edge(3, 4, 9);
        flow.add_edge(3, 6, 20);
        flow.add_edge(4, 2, 4);
        flow.add_edge(4, 5, 14);
        flow.add_edge(5, 3, 7);
        flow.add_edge(5, 6, 4);

        let max_flow = flow.find_maxflow(i32::MAX);
        assert_eq!(max_flow, 23);

        let mut sm_out = vec![0; 7];
        let mut sm_in = vec![0; 7];

        let flow_edges = flow.get_flow_edges(i32::MAX);
        for e in flow_edges {
            sm_out[e.source] += e.flow;
            sm_in[e.sink] += e.flow;
        }
        for i in 2..=5 {
            assert_eq!(sm_in[i], sm_out[i]);
        }
        assert_eq!(sm_in[1], 0);
        assert_eq!(sm_out[1], max_flow);
        assert_eq!(sm_in[6], max_flow);
        assert_eq!(sm_out[6], 0);
    }
}
```

`INSERT HERE`

## 2-SAT PROBLEM

`INSERT HERE`

```rust
use super::strongly_connected_components::StronglyConnectedComponents as SCCs;

pub type Condition = (i64, i64);
type Graph = Vec<Vec<usize>>;

#[inline]
fn variable(var: i64) -> usize {
    if var < 0 {
        (((-var) << 1) + 1) as usize
    } else {
        (var << 1) as usize
    }
}

/// Returns an assignment that satisfies all the constraints, or a variable
/// that makes such an assignment impossible. Variables should be numbered
/// from 1 to n, and a negative number -m corresponds to the negated variable
/// m. For more information about this problem, please visit:
/// https://en.wikipedia.org/wiki/2-satisfiability
pub fn solve_two_satisfiability(
    expression: &[Condition],
    num_variables: usize,
) -> Result<Vec<bool>, i64> {
    let num_verts = (num_variables + 1) << 1;
    let mut result = Vec::new();
    let mut sccs = SCCs::new(num_verts);
    let mut adj = Graph::new();
    adj.resize(num_verts, vec![]);
    expression.iter().for_each(|cond| {
        let v1 = variable(cond.0);
        let v2 = variable(cond.1);
        adj[v1 ^ 1].push(v2);
        adj[v2 ^ 1].push(v1);
    });
    sccs.find_components(&adj);
    result.resize(num_variables + 1, false);
    for var in (2..num_verts).step_by(2) {
        if sccs.component[var] == sccs.component[var ^ 1] {
            return Err((var >> 1) as i64);
        }
        // if a variable isn't
        if sccs.component[var] < sccs.component[var ^ 1] {
            result[var >> 1] = true;
        }
    }
    Ok(result)
}

#[cfg(test)]
mod tests {
    use std::thread;

    use super::*;

    fn check_answer(expression: &[Condition], answers: &[bool]) -> bool {
        let mut ok = true;
        for &(c1, c2) in expression {
            let mut cv = false;
            if c1 < 0 {
                cv |= !answers[-c1 as usize];
            } else {
                cv |= answers[c1 as usize];
            }
            if c2 < 0 {
                cv |= !answers[-c2 as usize];
            } else {
                cv |= answers[c2 as usize];
            }
            ok &= cv;
        }
        ok
    }
    #[test]
    fn basic_test() {
        let conds = vec![(1, 1), (2, 2)];
        let res = solve_two_satisfiability(&conds, 2);
        assert!(res.is_ok());
        assert!(check_answer(&conds, &res.unwrap()));

        let conds = vec![(1, 2), (-2, -2)];
        let res = solve_two_satisfiability(&conds, 2);
        assert!(res.is_ok());
        assert!(check_answer(&conds, &res.unwrap()));

        let conds = vec![];
        let res = solve_two_satisfiability(&conds, 2);
        assert!(res.is_ok());
        assert!(check_answer(&conds, &res.unwrap()));

        let conds = vec![(-1, -1), (-2, -2), (1, 2)];
        let res = solve_two_satisfiability(&conds, 2);
        assert!(res.is_err());
    }

    #[test]
    #[ignore]
    fn big_test() {
        // We should spawn a new thread and set its stack size to something
        // big (256MB in this case), because doing DFS (for finding SCCs) is
        // a stack-intensive operation. 256MB should be enough for 3e5
        // variables though.
        let builder = thread::Builder::new().stack_size(256 * 1024 * 1024);
        let handler = builder
            .spawn(|| {
                let num_conds = 3e5 as i64;
                let mut conds = vec![];
                for i in 1..num_conds {
                    conds.push((i, -(i + 1)));
                }
                conds.push((num_conds, num_conds));
                let res = solve_two_satisfiability(&conds, num_conds as usize);
                assert!(res.is_ok());
                assert!(check_answer(&conds, &res.unwrap()));
            })
            .unwrap();
        handler.join().unwrap();
    }
}
```

`INSERT HERE`

## FLOYD-WARSHALL

`INSERT HERE`

```rust
use std::collections::BTreeMap;
use std::ops::Add;

type Graph<V, E> = BTreeMap<V, BTreeMap<V, E>>;

/// Performs the Floyd-Warshall algorithm on the input graph
/// The graph is a weighted, directed graph with no negative cycles
///
/// Returns a map storing the distance from each node to all the others
/// I.e. For each vertex u, map[u][v] == Some(distance) means
/// distance is the sum of the weights of the edges on the shortest path
/// from u to v
///
/// For a key v, if map[v].len() == 0, then v cannot reach any other vertex, but is in the graph
/// (island node, or sink in the case of a directed graph)
pub fn floyd_warshall<V: Ord + Copy, E: Ord + Copy + Add<Output = E>>(
    graph: &Graph<V, E>,
) -> BTreeMap<V, BTreeMap<V, E>> {
    let mut map: BTreeMap<V, BTreeMap<V, E>> = BTreeMap::new();
    for (u, edges) in graph.iter() {
        if !map.contains_key(u) {
            map.insert(*u, BTreeMap::new());
        }
        for (v, weight) in edges.iter() {
            if !map.contains_key(v) {
                map.insert(*v, BTreeMap::new());
            }
            map.entry(*u).and_modify(|mp| {
                mp.insert(*v, *weight);
            });
        }
    }
    let keys = map.keys().copied().collect::<Vec<_>>();
    for &k in &keys {
        for &i in &keys {
            if map[&i].get(&k).is_none() {
                continue;
            }
            for &j in &keys {
                if i == j {
                    continue;
                }
                if !map[&k].contains_key(&j) {
                    continue;
                }
                let entry_i_j = map[&i].get(&j);
                let entry_i_k = map[&i][&k];
                let entry_k_j = map[&k][&j];
                match entry_i_j {
                    Some(&e) => {
                        if e > entry_i_k + entry_k_j {
                            map.entry(i).or_default().insert(j, entry_i_k + entry_k_j);
                        }
                    }
                    None => {
                        map.entry(i).or_default().insert(j, entry_i_k + entry_k_j);
                    }
                };
            }
        }
    }
    map
}

#[cfg(test)]
mod tests {
    use super::{floyd_warshall, Graph};
    use std::collections::BTreeMap;

    fn add_edge<V: Ord + Copy, E: Ord + Copy>(graph: &mut Graph<V, E>, v1: V, v2: V, c: E) {
        graph.entry(v1).or_insert_with(BTreeMap::new).insert(v2, c);
    }

    fn bi_add_edge<V: Ord + Copy, E: Ord + Copy>(graph: &mut Graph<V, E>, v1: V, v2: V, c: E) {
        add_edge(graph, v1, v2, c);
        add_edge(graph, v2, v1, c);
    }

    #[test]
    fn single_vertex() {
        let mut graph: Graph<usize, usize> = BTreeMap::new();
        graph.insert(0, BTreeMap::new());

        let mut dists = BTreeMap::new();
        dists.insert(0, BTreeMap::new());

        assert_eq!(floyd_warshall(&graph), dists);
    }

    #[test]
    fn single_edge() {
        let mut graph = BTreeMap::new();
        bi_add_edge(&mut graph, 0, 1, 2);
        bi_add_edge(&mut graph, 1, 2, 3);

        let mut dists_0 = BTreeMap::new();
        dists_0.insert(1, BTreeMap::new());
        dists_0.insert(2, BTreeMap::new());
        dists_0.insert(0, BTreeMap::new());
        dists_0.get_mut(&1).unwrap().insert(0, 2);
        dists_0.get_mut(&0).unwrap().insert(1, 2);
        dists_0.get_mut(&1).unwrap().insert(2, 3);
        dists_0.get_mut(&2).unwrap().insert(1, 3);
        dists_0.get_mut(&2).unwrap().insert(0, 5);
        dists_0.get_mut(&0).unwrap().insert(2, 5);

        assert_eq!(floyd_warshall(&graph), dists_0);
    }

    #[test]
    fn graph_1() {
        let mut graph = BTreeMap::new();
        add_edge(&mut graph, 'a', 'c', 12);
        add_edge(&mut graph, 'a', 'd', 60);
        add_edge(&mut graph, 'b', 'a', 10);
        add_edge(&mut graph, 'c', 'b', 20);
        add_edge(&mut graph, 'c', 'd', 32);
        add_edge(&mut graph, 'e', 'a', 7);

        let mut dists_a = BTreeMap::new();
        dists_a.insert('d', BTreeMap::new());

        dists_a
            .entry('a')
            .or_insert(BTreeMap::new())
            .insert('c', 12);
        dists_a
            .entry('c')
            .or_insert(BTreeMap::new())
            .insert('a', 30);
        dists_a
            .entry('c')
            .or_insert(BTreeMap::new())
            .insert('b', 20);
        dists_a
            .entry('c')
            .or_insert(BTreeMap::new())
            .insert('d', 32);
        dists_a.entry('e').or_insert(BTreeMap::new()).insert('a', 7);
        dists_a
            .entry('b')
            .or_insert(BTreeMap::new())
            .insert('a', 10);
        dists_a
            .entry('a')
            .or_insert(BTreeMap::new())
            .insert('d', 44);
        dists_a
            .entry('a')
            .or_insert(BTreeMap::new())
            .insert('b', 32);
        dists_a
            .entry('a')
            .or_insert(BTreeMap::new())
            .insert('b', 32);
        dists_a
            .entry('b')
            .or_insert(BTreeMap::new())
            .insert('c', 22);

        dists_a
            .entry('b')
            .or_insert(BTreeMap::new())
            .insert('d', 54);
        dists_a
            .entry('e')
            .or_insert(BTreeMap::new())
            .insert('c', 19);
        dists_a
            .entry('e')
            .or_insert(BTreeMap::new())
            .insert('d', 51);
        dists_a
            .entry('e')
            .or_insert(BTreeMap::new())
            .insert('b', 39);

        assert_eq!(floyd_warshall(&graph), dists_a);
    }
}
```

`INSERT HERE`
