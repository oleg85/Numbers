//
//  ViewModel.swift
//  Numbers
//
//  Created by Oleg Arzutov on 28/11/2022.
//

import Foundation


protocol NumbersViewModelDelegate: AnyObject {
    func reloadData(state: ViewControllerState)
}

protocol NumbersViewModelProtocol {
    var shouldShowLoadingCell: Bool { get }
    var numbers: [NumberViewData] { get }
    
    func loadData()
    func isLoadingIndexPath(_ indexPath: IndexPath) -> Bool
}

final class NumbersViewModel: NumbersViewModelProtocol {
    
    typealias Completion = (Number) -> Void
    
    private let repository: NumbersRepository
    
    
    weak var delegate: NumbersViewModelDelegate?
    
    var shouldShowLoadingCell: Bool = false
    var numbers = [NumberViewData]()
    var numbersDict = [Int : Int]()
    
    init(resository: NumbersRepository) {
        self.repository = resository
    }
    
    func loadData() {
        delegate?.reloadData(state: .loading)
        repository.getNumbers(completion: { [weak self] result in
            switch result {
            case .success(let response):
                self?.parse(response.numbers)
                self?.delegate?.reloadData(state: .success)
            case .failure(let error):
                print(error.localizedDescription)
                self?.shouldShowLoadingCell = false
                self?.delegate?.reloadData(state: .error)
            }
        })
        
    }
    
    
    
    func isLoadingIndexPath(_ indexPath: IndexPath) -> Bool {
        guard shouldShowLoadingCell else { return false }
        return indexPath.row == numbers.count
    }
}

// MARK: Mapping
private extension NumbersViewModel {
    
    func parse(_ response: [Number]) {
        let viewDataObjects = makeViewData(numbers: response)
        let numbersDictValues = Array(numbersDict.values)
        viewDataObjects.forEach {
            if !numbers.contains($0) {
                numbers.append($0)
            }
        }
        
        let result = findTwoSum(inputArray: numbersDictValues, sum: 0)
        for (_, item) in result.enumerated()  {
            let firstItemIndex =  numbers.firstIndex(where: {$0.number == item})
            let secondItemIndex =  numbers.firstIndex(where: {$0.number == -item})
            updateViewData(indx: firstItemIndex)
            if firstItemIndex !=  secondItemIndex {
                updateViewData(indx: secondItemIndex)
            }
            
        }
        
        
        shouldShowLoadingCell = true
    }
    
    func updateViewData(indx: Int?){
        if let index = indx{
            
            numbers[index].isHaveOppositeNumber = true
            print(numbers[index])
        }
        
    }
    
    func makeViewData(numbers: [Number]) -> [NumberViewData] {
        var viewDatas = [NumberViewData]()
        numbers.forEach {
            if let viewData = map(model: $0, indx: numbers.firstIndex(of: $0) ?? 0) {
                viewDatas.append(viewData)
            }
        }
        return viewDatas
    }
    
    func findTwoSum(inputArray: [Int], sum: Int) ->  [Int]{
        var dictionary: [Int: Int] = [:]
        var result: [Int] = [Int]()
        for element in inputArray {
            let difference = sum - element
            
            if let _ = dictionary[difference] {
                print("(\(element), \(difference))")
                result.append(element)
            }
            
            dictionary[element] = element
        }
        
        return result
    }
    
    
    
    func map(model: Number, indx: Int) -> NumberViewData? {
        
        guard let number = model.number else {
            return nil
        }
        numbersDict[indx] = number
        
        return .init(number: number)
    }
    
}



extension Collection where Iterator.Element: Comparable {
    
    func binarySearch(element: Iterator.Element) -> Bool {
        var low = startIndex
        var high = endIndex
        while low != high {
            let mid = index(low, offsetBy: distance(from: low, to: high)/2)
            if self[mid] < element {
                low = index(after: mid)
            } else if element < self[mid] {
                high = mid
            } else {
                return true
            }
        }
        return false
    }
}
