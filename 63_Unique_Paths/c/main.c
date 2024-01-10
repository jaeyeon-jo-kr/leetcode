#include <stdio.h>
#include <string.h>

int uniquePathsWithObstacles(int** obstacleGrid, int obstacleGridSize, int* obstacleGridColSize) {
    int dp[obstacleGridSize][obstacleGridColSize[0]];
    int i, j;
    memset(*dp, 0, sizeof(int) * obstacleGridSize * obstacleGridColSize[0]);
    for(int i = 0; i<obstacleGridSize;i++){
        for(int j = 0; j<obstacleGridColSize[i]; j++){
            if(i == 0 && j == 0){
                dp[0][0] = 1;
            }else if(i == 0){
                dp[i][j] = obstacleGrid[i][j]? 0: dp[i][j-1];
            }else if(j == 0){
                dp[i][j] = obstacleGrid[i][j]? 0: dp[i-1][j];
            }else{
                dp[i][j] = obstacleGrid[i][j]? 0: dp[i-1][j] + dp[i][j-1];
            }
        }
    }

    return dp[obstacleGridSize - 1][obstacleGridColSize[0] - 1];
}
int main(){
    return 0;
}