import Foundation
import HealthKit

extension Date {
    static var startOfDay: Date {
        Calendar.current.startOfDay(for: Date())
    }
}



class HealthManager: ObservableObject {
    let healthStore = HKHealthStore()
    
    @Published var todaysSteps = 0
    
    
    init() {
        let steps = HKQuantityType(.stepCount)
        
        let healthTypes: Set = [steps]
        
        Task{
            do{
                try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
            }catch {
                print("errror fetching health data")
            }
        }
        
        self.fetchTodaySteps()
    }
    
    func fetchTodaySteps() {
        let steps = HKQuantityType(.stepCount)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate) { _, result, error in
            guard let quantity = result?.sumQuantity() , error == nil else{
                print("Errors fetching todays step data")
                return
            }
            let stepCount = quantity.doubleValue(for: .count())
            self.todaysSteps = Int(stepCount)
        }
        healthStore.execute(query)
    }
}
