#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

uint16_t count_leading_zeros(uint64_t x)
{
    x |= (x >> 1);
    x |= (x >> 2);
    x |= (x >> 4);
    x |= (x >> 8);
    x |= (x >> 16);
    x |= (x >> 32);

    /* count ones (population count) */
    x -= ((x >> 1) & 0x5555555555555555 /* Fill this! */ );
    x = ((x >> 2) & 0x3333333333333333) + (x & 0x3333333333333333 /* Fill this! */);
    x = ((x >> 4) + x) & 0x0f0f0f0f0f0f0f0f;
    x += (x >> 8);
    x += (x >> 16);
    x += (x >> 32);

    return (64 - (x & 0x7f));
}
// �������������ĺ���
void swap(int* a, int* b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

// ʹ�ÿ��������㷨��������
void quickSort(int arr[], int low, int high) {
    if (low < high) {
        int pivot = arr[low];
        int left = low;
        int right = high;
        
        while (left < right) {
            // ʹ��ǰ��������Ż�ѡ�� pivot
            while (count_leading_zeros(arr[left]) > count_leading_zeros(pivot)) {
                left++;
            }
            while (count_leading_zeros(arr[right]) < count_leading_zeros(pivot)) {
                right--;
            }
            if (left <= right) {
                swap(&arr[left], &arr[right]);
                left++;
                right--;
            }
        }    
        
        quickSort(arr, low, right);
        quickSort(arr, left, high);
    }
}

int main() {
    int arr[] = {25, 8, 4, 11, 32, 2, 19, 51}; // �滻���������
    int n = sizeof(arr) / sizeof(arr[0]);
    
    quickSort(arr, 0, n - 1);
    
    printf("���������飺\n");
    for (int i = 0; i < n; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
    system("pause");
    return 0;
}
