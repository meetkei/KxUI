//
//  Copyright (c) 2016 Keun young Kim <app@meetkei.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

open class KUCollectionViewCell<T>: UICollectionViewCell {
    
    /**
     셀 재사용 식별자
     
     재사용 식별자는 클래스 이름으로 고정합니다.
     */
    open class var cellIdentifier: String {
        let fq = NSStringFromClass(self.classForCoder())
        if let range = fq.range(of: ".", options: .backwards) {
         #if swift(>=4.0)
            return String(fq[fq.index(after: range.lowerBound)...])
         #else
            return fq.substring(from: fq.index(after: range.lowerBound))
         #endif
         
        }
        
        return fq
    }
    
    /**
     테이블뷰의 재사용 큐에서 새로운 셀을 리턴합니다.
     
     - Parameter tableView: 대상 테이블뷰
     - Parameter data: 셀 구성에 사용할 데이터
     
     - Returns: 데이터 구성이 완료된 테이블뷰 셀. 정상적으로 구성할 수 없는 경우 nil을 리턴하여 예외가 발생하도록 합니다.
     */
    open class func dequeueComposedCell<C: KUCollectionViewCell>(from collectionView: UICollectionView, indexPath: IndexPath, data: T?) -> C {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! C
        cell.compose(with: data)
        return cell
    }
    
    /**
     전달된 데이터를 통해 셀을 구성합니다.
     
     - Parameter data: 셀 구성에 사용되는 데이터
     */
    open func compose(with data: T?) {
        // do nothing
    }
}
