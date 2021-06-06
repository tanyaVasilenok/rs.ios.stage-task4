import Foundation

//## Constraints
//
//**`m == image.length`**
//**`n == image[i].length`**
//**`1 <= m, n <= 50`**
//**`0 <= image[i][j], newColor < 65536`**
//**`0 <= row <= m`**
//**`0 <= column <= n`**

final class FillWithColor {
    
    func fillWithColor(_ image: [[Int]], _ row: Int, _ column: Int, _ newColor: Int) -> [[Int]] {
        
        //check on nil
        if image == [] {
            return image
        }
        
        //check on border values
        if (row > image.count-1 || column > image[0].count-1 || image.count < 1 || image[0].count > 50 || newColor >= 65536 || row < 0 || column < 0) {
            return image
        }
        
        var resultImage = image
        let oldColor = resultImage[row][column]
        
        resultImage[row][column] = newColor
        
        for i in 0..<resultImage.count {
            for j in 0..<resultImage[i].count {
                if resultImage[i][j] == newColor {
                    //go left
                    if i != 0 && resultImage[i-1][j] == oldColor {
                            resultImage[i-1][j] = newColor
                    }
                    //go right
                    if i != resultImage.count-1 && resultImage[i+1][j] == oldColor {
                            resultImage[i+1][j] = newColor
                    }
                    //go up
                    if j != 0 && resultImage[i][j-1] == oldColor {
                            resultImage[i][j-1] = newColor
                    }
                    //go down
                    if j != resultImage[i].count-1 && resultImage[i][j+1] == oldColor {
                            resultImage[i][j+1] = newColor
                    }
                }
            }
        }
        
        if resultImage[0].count > 1 && resultImage[0][1] == newColor && resultImage[0][0] == oldColor {
                resultImage[0][0] = newColor
        }

        return resultImage
    }
}







