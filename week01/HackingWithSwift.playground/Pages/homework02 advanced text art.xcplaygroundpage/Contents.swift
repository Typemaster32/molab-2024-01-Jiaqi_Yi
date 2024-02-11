//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

import Foundation


//func generateMaze(rows: Int, cols: Int) -> [[String]] {
//    var maze = Array(repeating: Array(repeating: "#", count: cols), count: rows)
//    //"repeating" and "count" are builtin keywords of Array initializer.
//    // Starting point
//    var walls = [(Int, Int)]()
//    //declaires that walls is an array made of tuples, which has the format of (Int, Int),referring to coordinates.
//    let start = (row: 2, col: 2)
//    //"start" is a tuple.
//    maze[start.row][start.col] = " "
//
//    // Add walls adjacent to the starting point
//    walls.append((start.row - 1, start.col))
//    walls.append((start.row + 1, start.col))
//    walls.append((start.row, start.col - 1))
//    walls.append((start.row, start.col + 1))
//
//    while !walls.isEmpty {
//        // Pick a random wall
//        let randomIndex = Int(arc4random_uniform(UInt32(walls.count)))
//        //UInt32 transforms walls.count into UInt32, while arc4random_uniform returns an integer between 0 and the upper bound you pass it.
//        let wall = walls[randomIndex]
//        walls.remove(at: randomIndex)
//
//        // Check if it's a valid wall to make a path
//        let opposite = getOppositeCell(row: wall.0, col: wall.1, maze: maze)
//
//        if opposite.row >= 0 && opposite.col >= 0 && maze[opposite.row][opposite.col] == "#" {
//            // Make the wall a path
//            maze[wall.0][wall.1] = "."
//
//            // Add adjacent walls
//            let adjacentWalls = getAdjacentWalls(row: opposite.row, col: opposite.col, maze: maze)
//            walls.append(contentsOf: adjacentWalls)
//
//            // Make the opposite a path
//            maze[opposite.row][opposite.col] = ":"
//        }
//    }
//
//    return maze
//}
//
//func getOppositeCell(row: Int, col: Int, maze: [[String]]) -> (row: Int, col: Int) {
//    let numRows = maze.count
//    let numCols = maze[0].count
//    var opposite = (row: -1, col: -1)
//
//    if row > 1 && maze[row - 2][col] == "#" {
//        opposite = (row: row - 2, col: col)
//    } else if row < numRows - 2 && maze[row + 2][col] == "#" {
//        opposite = (row: row + 2, col: col)
//    } else if col > 1 && maze[row][col - 2] == "#" {
//        opposite = (row: row, col: col - 2)
//    } else if col < numCols - 2 && maze[row][col + 2] == "#" {
//        opposite = (row: row, col: col + 2)
//    }
//
//    return opposite
//}
//
//func getAdjacentWalls(row: Int, col: Int, maze: [[String]]) -> [(Int, Int)] {
//    var walls = [(Int, Int)]()
//
//    if row > 1 {
//        walls.append((row - 1, col))
//    }
//    if row < maze.count - 2 {
//        walls.append((row + 1, col))
//    }
//    if col > 1 {
//        walls.append((row, col - 1))
//    }
//    if col < maze[0].count - 2 {
//        walls.append((row, col + 1))
//    }
//
//    return walls
//}
//
//func printMaze(_ maze: [[String]]) {
//    for row in maze {
//        for col in row {
//            print(col, terminator: "")
//        }
//        print()
//    }
//}
//
//// Example usage
//let maze = generateMaze(rows: 8, cols: 18) // Maze size
//printMaze(maze)


import Foundation

func generateMazeDFS(rows: Int, cols: Int) -> [[String]] {
    var maze = Array(repeating: Array(repeating: "#", count: cols*2+1), count: rows*2+1)
    var visited = Array(repeating: Array(repeating: false, count: cols), count: rows)
    
    func dfs(x: Int, y: Int) {
        let directions = [(0,1),(1,0),(0,-1),(-1,0)].shuffled() // Randomize directions
        visited[x][y] = true
        maze[x*2+1][y*2+1] = "."
        
        for (dx, dy) in directions {
            let nx = x + dx, ny = y + dy
            if nx >= 0 && nx < rows && ny >= 0 && ny < cols && !visited[nx][ny] {
                maze[x*2+1+dx][y*2+1+dy] = " " // Knock down the wall
                dfs(x: nx, y: ny) // Recurse
            }
        }
    }
    
    dfs(x: 0, y: 0) // Start DFS from the top-left cell
    return maze
}

func printMaze(_ maze: [[String]]) {
    for row in maze {
        for unit in row{
            print(String(unit),terminator: " ")
        }
        print("")
    }
}

// Example usage
let maze = generateMazeDFS(rows: 6, cols: 10)
printMaze(maze)
