/*
Đồ án giữa kì: CÁC THUẬT TOÁN SẮP XẾP
Môn Cấu Trúc Dữ Liệu & Giải Thuật
Lưu ý: Trong đồ án này, ta xét bài toán sắp xếp tăng dần.
1. Yêu cầu của đồ án
1.1.Tóm tắt sơ bộ
 Sinh viên sẽ cài đặt các thuật toán: Selection Sort, Insertion Sort, Bubble Sort,
Heap Sort, Merge Sort, Quick Sort, Radix Sort
 Sau khi cài đặt xong các thuật toán ở trên, sinh viên sẽ tiến hành các thí nghiệm
để có thể thấy được thời gian thực thi của mỗi thuật toán ứng với mỗi tình trạng
dữ liệu đầu vào cũng như so sánh thời gian thực thi của các thuật toán với nhau. Ở
đây, ta xét 4 tình trạng dữ liệu đầu vào:
- Đã có thứ tự.
- Có thứ tự ngược.
- Ngẫu nhiên.
- Gần như có thứ tự.
1.2.Cụ thể
Nội dung nộp bài của sinh viên bao gồm 2 phần: phần code (5đ) và phần báo cáo (5đ).
1.2.1. Phần code (5đ)
Sinh viên thí nghiệm với 4 tình trạng dữ liệu: đã có thứ tự (sorted), có thứ tự
ngược (reversed), ngẫu nhiên (random), và gần như có thứ tự (nearly sorted). Với
mỗi tình trạng, sinh viên khảo sát 5 kích thước dữ liệu (số phần tử) khác nhau:
1000, 3000, 10 000, 30 000, 100 000.
Với mỗi tình trạng dữ liệu state
với mỗi kích thước dữ liệu size
với mỗi thuật toán sắp xếp sortAlg, sinh viên thực hiện các bước sau:
1. Tạo mảng dữ liệu có tình trạng state và kích thước size
2. Tiến hành sắp xếp mảng dữ liệu này bằng thuật toán sortAlg và
đo thời gian thực thi của sortAlg
3. Xuất kết quả sắp xếp ra file:
- Mỗi phần tử cách nhau một khoảng trắng.
- Tên file đặt theo định dạng <sortAlg>_<state>_<size>.txt
Ví dụ: InsertionSort_NearlySorted_1000.txtCác file kết quả khác: ngoài các file lưu kết quả sắp xếp như đã nói ở trên,
để tiện lợi cho việc thống kê kết quả, chương trình của sinh viên cũng cần phải
xuất thời gian thực thi của tất cả các lần chạy ở trên vào một file chung:
 Ta quy ước đặt tên file này là Result.csv. Việc sử dụng file *.csv có thể
mở bằng Excel, thuận tiện cho việc vẽ đồ thị.
 File Result.csv sẽ có dạng như hình 1. Trong đó, ở mỗi dòng, ô đầu tiên là
tình trạng dữ liệu ban đầu, ô thứ hai là kích thước dữ liệu, các ô tiếp theo
là thời gian thực thi của các thuật toán.
Hình 1. Minh họa file Result.csv
 Nếu mở file *.csv ở trên bằng Notepad++ thì sẽ thấy như hình 2. Như vậy,
thực chất mỗi ô trên một dòng cách nhau bởi dấu phẩy (,). Ví dụ ta có thể
ghi dòng thứ 2 bằng câu lệnh:
Hình 2. File Result.csv mở bằng Notepad++1.2.2. Phần báo cáo (5đ)
 Trình bày về các thuật toán sắp xếp ở trên (ý tưởng, thuật toán, độ phức
tạp, đánh giá thuật toán). (2đ)
 Trình bày về kết quả thí nghiệm (2đ) và cho nhận xét (2đ). Cách trình bày
kết quả thí nghiệm: thay vì đưa ra các con số về thời gian chạy, ta trực qua
hóa chúng bằng đồ thị, như vậy, sẽ dễ quan sát và nhận xét hơn. Các bạn
sẽ vẽ 4 đồ thị tương ứng với 4 tình trạng dữ liệu đầu vào. Trong đó, mỗi
đồ thị có trục tung là kích thước dữ liệu, trục hoành là thời gian thực thi
(có dạng như hình 3).
*/

#define _CRT_SECURE_NO_WARNINGS
#include "iostream"
#include "fstream"
#include "ctime"
#include "vector"
void GenerateRandomData(int a[], int n)
{
	srand((unsigned int)time(NULL));

	for (int i = 0; i < n; i++) {
		a[i] = rand() % n;
	}
}
void GenerateSortedData(int a[], int n)
{
	for (int i = 0; i < n; i++) {
		a[i] = i;
	}
}
void GenerateReversedData(int a[], int n)
{
	for (int i = 0; i < n; i++) {
		a[i] = n - 1 - i;
	}
}
void HoanVi(int &a, int &b)
{
	int temp = a;
	a = b;
	b = temp;
}
void GenerateNearlySortedData(int a[], int n)
{
	for (int i = 0; i < n; i++) {
		a[i] = i;
	}
	srand((unsigned int)time(NULL));
	for (int i = 0; i < 10; i++) {
		int r1 = rand() % n;
		int r2 = rand() % n;
		HoanVi(a[r1], a[r2]);
	}
}

void selectionSort(int a[], int n)
{
	for (int i = 0; i < n; i++) {
		for (int j = i + 1; j < n; j++) {
			if (a[j] < a[i]) {
				HoanVi(a[i], a[j]);
			}
		}
	}
}
void insertionSort(int a[], int n)
{
	for (int i = 1; i < n; i++) {
		for (int j = 0; j < i; j++) {
			if (a[j] > a[i]) {
				int temp = a[i];
				for (int k = i; k > j; k--) {
					a[k] = a[k - 1];
				}
				a[j] = temp;
			}
		}
	}
}
void bubbleSort(int a[], int n)
{
	for (int i = (n - 1); i >= 0; i--) {
		for (int j = 0; j < i; j++) {
			if (a[j] > a[j + 1]) {
				HoanVi(a[j], a[j + 1]);
			}
		}
	}
}
//heapsort
void hieuChinh(int A[], int n, int pos)
{
	int l = (n - 1) / 2;
	int vtmax;
	vtmax = 2 * pos + 1;
	if ((2 * pos + 2 < n) && (A[2 * pos + 2] > A[2 * pos + 1])) vtmax = 2 * pos + 2;
	if (A[vtmax] > A[pos]) {
		HoanVi(A[vtmax], A[pos]);
		if (vtmax < l) hieuChinh(A, n, vtmax);
	}
}
void taoHeap(int A[], int n)
{
	int l = (n - 1) / 2;
	while (l >= 0) {
		hieuChinh(A, n, l);
		l--;
	}
}
void heapSort(int A[], int n)
{
	taoHeap(A, n);
	HoanVi(A[0], A[n - 1]);
	while (n > 2)
	{
		n--;
		hieuChinh(A, n, 0);
		HoanVi(A[0], A[n - 1]);
	}
}
//Quick sort
void mquickSort(int a[], int left, int right)
{
	int pivot = (left + right) / 2;
	int i = left;
	int j = right;
	while (i <= j)
	{
		while (a[i] < a[pivot]) i++;
		while (a[j] > a[pivot]) j--;
		if (j >= i) {
			HoanVi(a[i], a[j]);
			i++;
			j--;
		}
	}
	if (j > left) mquickSort(a, left, j);
	if (i < right) mquickSort(a, i, right);
}
void quickSort(int a[], int n)
{
	mquickSort(a, 0, n - 1);
}

void Merge(int *a, int left, int mid, int right)
{
	int *temp;
	int i = left;
	int j = mid + 1;

	temp = new int[right - left + 1];

	for (int k = 0; k <= right - left; k++)
	{
		if (a[i] < a[j])
		{
			temp[k] = a[i];
			i++;
		}
		else
		{
			temp[k] = a[j];
			j++;
		}
		if (i == mid + 1)
		{
			while (j <= right)
			{
				k++;
				temp[k] = a[j];
				j++;
			}
			break;
		}
		if (j == right + 1)
		{
			while (i <= mid)
			{
				k++;
				temp[k] = a[i];
				i++;
			}
			break;
		}
	}

	for (int k = 0; k <= right - left; k++)
		a[left + k] = temp[k];
	delete temp;
}
void mergeSort(int *a, int left, int right)
{
	if (right > left)
	{
		int mid;
		mid = (left + right) / 2;
		mergeSort(a, left, mid);
		mergeSort(a, mid + 1, right);
		Merge(a, left, mid, right);
	}
}
int getLengthOfMax(int A[], int n)
{
	int max = A[0];
	for (int i = 0; i < n; i++) {
		if (A[i] > max) max = A[i];
	}
	int result = 0;
	while (max != 0)
	{
		result++;
		max /= 10;
	}
	return result;
}
int getHang(int n, int hang)
{
	int result = 0;
	for (int i = 1; i <= hang; i++) {
		result = n % 10;
		n /= 10;
	}
	return result;
}
void vectorToVector(std::vector<int> &targe, std::vector<int> &source)
{
	while (!source.empty())
	{
		targe.push_back(source.at(0));
		source.erase(source.begin());
	}
}
void radixSort(int A[], int n)
{
	std::vector<int> l0, l1, l2, l3, l4, l5, l6, l7, l8, l9;
	int lengAmax = getLengthOfMax(A, n);
	for (int i = 1; i <= lengAmax; i++) {

		//Xep tat ca cac so trong mang A vao cac thung tu l0 den l9
		for (int j = 0; j < n; j++) {
			int hangi = getHang(A[j], i);
			switch (hangi)
			{
			case 0: l0.push_back(A[j]); break;
			case 1: l1.push_back(A[j]); break;
			case 2: l2.push_back(A[j]); break;
			case 3: l3.push_back(A[j]); break;
			case 4: l4.push_back(A[j]); break;
			case 5: l5.push_back(A[j]); break;
			case 6: l6.push_back(A[j]); break;
			case 7: l7.push_back(A[j]); break;
			case 8: l8.push_back(A[j]); break;
			case 9: l9.push_back(A[j]); break;
			}
		}

		//Lay tat ca cac gia tri trong cac vector l0 den l9 dua vao l
		//roi dua l vao mang A
		{
			std::vector<int> l;
			vectorToVector(l, l0);
			vectorToVector(l, l1);
			vectorToVector(l, l2);
			vectorToVector(l, l3);
			vectorToVector(l, l4);
			vectorToVector(l, l5);
			vectorToVector(l, l6);
			vectorToVector(l, l7);
			vectorToVector(l, l8);
			vectorToVector(l, l9);
			int k = 0;
			while (!l.empty())
			{
				A[k] = l.at(0);
				l.erase(l.begin());
				k++;
			}
		}

	}
}
void writeTxt(std::string thuatoan, std::string state, int n, int a[])
{
	std::string file_out = "";
	char size[100001] = "";
	_itoa(n, size, 10);
	file_out = thuatoan + '_' + state + '_' + size + ".txt";
	std::fstream f;
	f.open(file_out, std::ios_base::out);
	for (int i = 0; i < n; i++) {
		f << a[i] << ' ';
	}
	f.close();
}
void copyArray(int b[], int a[], int n)
{
	for (int i = 0; i < n; i++) {
		b[i] = a[i];
	}
}
void writeTime(char state[], int size, float timeResult[7])
{
	std::fstream f;
	f.open("Result.csv", std::ios_base::app);
	f << state << ',' << size << ',';
	for (int i = 0; i < 6; i++) {
		f << timeResult[i] << ',';
	}
	f << timeResult[6] << '\n';
	f.close();
}

void thucThi(char state[], int a[], int n)
{
	std::cout << state << std::endl;
	int b[100000] = {};
	clock_t start, end;
	float timeResult[7];
	for (int i = 0; i < 7; i++) {//sua i lai thanh 7
		copyArray(b, a, n);
		switch (i)
		{
		case 0: start = clock(); std::cout << std::endl << "Dang chay Selectionsort " << state << " " << n << " phan tu."; (b, n); writeTxt("SelectionSort", state, n, b); end = clock();
			timeResult[i] = (float)(end - start) / CLOCKS_PER_SEC; std::cout << " ==> Chay xong: " << timeResult[i] << "(s)"; break;
		case 1: start = clock(); std::cout << std::endl << "Dang chay Insertionsort " << state << " " << n << " phan tu."; (b, n); insertionSort(b, n); writeTxt("InsertionSort", state, n, b); end = clock();
			timeResult[i] = (float)(end - start) / CLOCKS_PER_SEC; std::cout << " ==> Chay xong: " << timeResult[i] << "(s)"; break;
		case 2: start = clock(); std::cout << std::endl << "Dang chay Bubblesort " << state << " " << n << " phan tu."; (b, n); bubbleSort(b, n); writeTxt("BubbleSort", state, n, b); end = clock();
			timeResult[i] = (float)(end - start) / CLOCKS_PER_SEC; std::cout << " ==> Chay xong: " << timeResult[i] << "(s)"; break;
		case 3: start = clock(); std::cout << std::endl << "Dang chay Heapsort " << state << " " << n << " phan tu."; (b, n); heapSort(b, n); writeTxt("HeapSort", state, n, b); end = clock();
			timeResult[i] = (float)(end - start) / CLOCKS_PER_SEC; std::cout << " ==> Chay xong: " << timeResult[i] << "(s)"; break;
		case 4: start = clock(); std::cout << std::endl << "Dang chay Mergesort " << state << " " << n << " phan tu."; (b, n); mergeSort(b, 0, n - 1); writeTxt("MergeSort", state, n, b); end = clock();
			timeResult[i] = (float)(end - start) / CLOCKS_PER_SEC; std::cout << " ==> Chay xong: " << timeResult[i] << "(s)"; break;
		case 5: start = clock(); std::cout << std::endl << "Dang chay Quicksort " << state << " " << n << " phan tu."; (b, n); quickSort(b, n); writeTxt("QuickSort", state, n, b); end = clock();
			timeResult[i] = (float)(end - start) / CLOCKS_PER_SEC; std::cout << " ==> Chay xong: " << timeResult[i] << "(s)"; break;
		case 6: start = clock(); std::cout << std::endl << "Dang chay Radixsort " << state << " " << n << " phan tu."; (b, n); radixSort(b, n); writeTxt("RadixSort", state, n, b); end = clock();
			timeResult[i] = (float)(end - start) / CLOCKS_PER_SEC; std::cout << " ==> Chay xong: " << timeResult[i] << "(s)"; break;
		}
	}
	writeTime(state, n, timeResult);
}
int main()
{
	int a[100000] = { -1 };

	//sorted		->	1000 ->	selection sort //chon
	//reversed			3000	insertion sort // chen
	//nearlysorted		10000	bubble sort //noi bot
	//ramdom		    30000	heap sort //vun dong
	//					100000	merge sort //tron
	//							quick sort//nhanh
	//							radix sort//theo co so

	std::fstream f;
	f.open("Result.csv", std::ios_base::out);
	f << "Input State,Input Size,Selection,Insertion,Bubble,Heap,Merge,Quick,Radix\n";
	f.close();

	GenerateReversedData(a, 1000);
	thucThi("Reversed", a, 1000);
	GenerateReversedData(a, 3000);
	thucThi("Reversed", a, 3000);
	GenerateReversedData(a, 10000);
	thucThi("Reversed", a, 10000);
	GenerateReversedData(a, 30000);
	thucThi("Reversed", a, 30000);
	GenerateReversedData(a, 100000);
	thucThi("Reversed", a, 100000);

	GenerateRandomData(a, 1000);
	thucThi("Random", a, 1000);
	GenerateRandomData(a, 3000);
	thucThi("Random", a, 3000);
	GenerateRandomData(a, 10000);
	thucThi("Random", a, 10000);
	GenerateRandomData(a, 30000);
	thucThi("Random", a, 30000);
	GenerateRandomData(a, 100000);
	thucThi("Random", a, 100000);

	GenerateNearlySortedData(a, 1000);
	thucThi("NearlySorted", a, 1000);
	GenerateNearlySortedData(a, 3000);
	thucThi("NearlySorted", a, 3000);
	GenerateNearlySortedData(a, 10000);
	thucThi("NearlySorted", a, 10000);
	GenerateNearlySortedData(a, 30000);
	thucThi("NearlySorted", a, 30000);
	GenerateNearlySortedData(a, 100000);
	thucThi("NearlySorted", a, 100000);

	GenerateSortedData(a, 1000);
	thucThi("Sorted", a, 1000);
	GenerateSortedData(a, 3000);
	thucThi("Sorted", a, 3000);
	GenerateSortedData(a, 10000);
	thucThi("Sorted", a, 10000);
	GenerateSortedData(a, 30000);
	thucThi("Sorted", a, 30000);
	GenerateSortedData(a, 100000);
	thucThi("Sorted", a, 100000);
	return 0;
}
