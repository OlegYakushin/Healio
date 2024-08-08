//
//  TryPremiumView.swift
//  Healio
//
//  Created by Oleg Yakushin on 7/1/24.
//

import SwiftUI
import StoreKit

class PurchaseManager: NSObject, ObservableObject, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    @Published var isProcessingPurchase = false
    @Published var purchaseError: Error?
    @Published var isSubscribed = false

    override init() {
        super.init()
        SKPaymentQueue.default().add(self)
        checkSubscriptionStatus()
    }

    func purchaseSubscription() {
        isProcessingPurchase = true
        purchaseError = nil
        let productIdentifier = "healiopremium"

        let request = SKProductsRequest(productIdentifiers: Set([productIdentifier]))
        request.delegate = self
        request.start()
    }

    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if let product = response.products.first {
            let payment = SKPayment(product: product)
            SKPaymentQueue.default().add(payment)
        } else {
            isProcessingPurchase = false
            purchaseError = NSError(domain: "Purchase", code: 0, userInfo: [NSLocalizedDescriptionKey: "Product not found"])
        }
    }

    func request(_ request: SKRequest, didFailWithError error: Error) {
        isProcessingPurchase = false
        purchaseError = error
    }

    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchased, .restored:
                SKPaymentQueue.default().finishTransaction(transaction)
                isProcessingPurchase = false
                isSubscribed = true
                saveSubscriptionStatus(isSubscribed: true)
            case .failed:
                if let error = transaction.error {
                    purchaseError = error
                }
                SKPaymentQueue.default().finishTransaction(transaction)
                isProcessingPurchase = false
            case .purchasing, .deferred:
                break
            @unknown default:
                break
            }
        }
    }

    func checkSubscriptionStatus() {
        // Загрузка статуса подписки из UserDefaults
        isSubscribed = UserDefaults.standard.bool(forKey: "isSubscribed")
    }

    private func saveSubscriptionStatus(isSubscribed: Bool) {
        UserDefaults.standard.set(isSubscribed, forKey: "isSubscribed")
    }
}
struct TryPremiumView: View {
    @StateObject private var purchaseManager = PurchaseManager()

    var body: some View {
        NavigationView {
            ZStack {
                   BackgroundView()
                   Image("tryPremium")
                       .resizable()
                       .scaledToFill()
                       .ignoresSafeArea()
                   VStack {
                       HStack {
                           Spacer()
                           Image("closeButton")
                       }
                       Spacer()
                   }
                   .padding()
                   VStack(spacing: 20 * sizeScreen()) {
                       HStack {
                           VStack(alignment: .leading){
                               Text("Try Helio\nPremium")
                                   .font(.custom("AveriaSerifLibre-Light", size: 34  * sizeScreen()))
                                   .kerning(-1.2)
                                   .foregroundColor(Color("fontDark"))
                                   .multilineTextAlignment(.center)
                               
                               
                               Text("Unlock all features and content.")
                                   .font(.custom("AvertaDemoPE-Regular", size: 16  * sizeScreen()))
                                   .foregroundColor(Color("fontDark"))
                           }
                           Spacer()
                       }
                       .padding(.leading, 30 * sizeScreen())
                       .padding(.top, 150  * sizeScreen())
                       .padding(.bottom, 40  * sizeScreen())
                       HStack {
                           Image("pointImage")
                               .resizable()
                               .frame(width: 20 * sizeScreen(),
                                      height: 20 * sizeScreen())
                           Text("400+ health conditions")
                               .font(.custom("AveriaSerifLibre-Light", size: 16  * sizeScreen()))
                               .foregroundColor(Color("fontDark"))
                               .multilineTextAlignment(.leading)
                               .padding(.horizontal, 20  * sizeScreen())
                       }
                       .frame(width: 311 * sizeScreen(), alignment: .leading)
                       HStack {
                           Image("pointImage")
                               .resizable()
                               .frame(width: 20 * sizeScreen(),
                                      height: 20 * sizeScreen())
                           Text("All the healing affirmations")
                               .font(.custom("Avenir-Roman", size: 17  * sizeScreen()))
                               .foregroundColor(Color("fontDark"))
                               .multilineTextAlignment(.leading)
                               .padding(.horizontal, 20  * sizeScreen())
                       }
                       .frame(width: 311 * sizeScreen(), alignment: .leading)
                       HStack {
                           Image("pointImage")
                               .resizable()
                               .frame(width: 20 * sizeScreen(),
                                      height: 20 * sizeScreen())
                           Text("Extensive catalog of repressed emotions")
                               .font(.custom("Avenir-Roman", size: 17  * sizeScreen()))
                               .foregroundColor(Color("fontDark"))
                               .multilineTextAlignment(.leading)
                               .padding(.horizontal, 20  * sizeScreen())
                       }
                       .frame(width: 311 * sizeScreen(), alignment: .leading)
                       HStack {
                           Image("pointImage")
                               .resizable()
                               .frame(width: 20 * sizeScreen(),
                                      height: 20 * sizeScreen())
                    Text("Daily reminders")
                                   .font(.custom("Avenir-Roman", size: 17  * sizeScreen()))
                                   .foregroundColor(Color("fontDark"))
                                   .multilineTextAlignment(.leading)
                                   .padding(.horizontal, 20  * sizeScreen())
                           }
                           .frame(width: 311 * sizeScreen(), alignment: .leading)
                           HStack {
                               Image("pointImage")
                                   .resizable()
                                   .frame(width: 20 * sizeScreen(),
                                          height: 20 * sizeScreen())
                               Text("3 days free trial, cancel anytime")
                                   .font(.custom("Avenir-Roman", size: 17  * sizeScreen()))
                                   .foregroundColor(Color("fontDark"))
                                   .multilineTextAlignment(.leading)
                                   .padding(.horizontal, 20  * sizeScreen())
                           }
                           .frame(width: 311 * sizeScreen(), alignment: .leading)
                    HStack {
                                  Image("pointImage")
                                      .resizable()
                                      .frame(width: 20 * sizeScreen(),
                                             height: 20 * sizeScreen())
                    HStack {
                              Text("$59,99/year")
                                      .font(.custom("Avenir-Roman", size: 17 * sizeScreen()))
                                      .foregroundColor(Color("fontDark"))
                                      .strikethrough(true, color: (Color("fontDark")))
                                  
                                  Text("$29,99/year")
                                      .font(.custom("Avenir-Roman", size: 17 * sizeScreen()))
                                      .foregroundColor(Color("fontDark"))
                          }
                          .padding(.horizontal, 20  * sizeScreen())
                      }
                      .frame(width: 311 * sizeScreen(), alignment: .leading)
                     
                      Spacer()
                    Text("Only $2,49/month, billed annually")
                        .font(.custom("Averta-Bold", size: 17 * sizeScreen()))
                        .foregroundColor(Color("fontDark"))
                    
                    NavigationLink(destination: TabsView().navigationBarBackButtonHidden(), isActive: $purchaseManager.isSubscribed) {
                        Button(action: {
                            purchaseManager.purchaseSubscription()
                        }) {
                            ButtonView(name: "✨ Start 3 day free trial ✨")
                        }
                        .disabled(purchaseManager.isProcessingPurchase)
                    }
                    if let error = purchaseManager.purchaseError {
                        Text("Purchase failed: \(error.localizedDescription)")
                            .foregroundColor(.red)
                    }
                    HStack {
                        Text("Restore")
                            .font(.custom("AvertaDemoPE-Regular", size: 13 * sizeScreen()))
                            .foregroundColor(Color("brownOne"))
                        Text("Terms & Conditions")
                            .font(.custom("AvertaDemoPE-Regular", size: 13 * sizeScreen()))
                            .foregroundColor(Color("brownOne"))
                        Text("Privacy Policy")
                            .font(.custom("AvertaDemoPE-Regular", size: 13 * sizeScreen()))
                            .foregroundColor(Color("brownOne"))
                    }
                    .padding(.bottom, 40 * sizeScreen())
                }
            }
        }
    }
}

#Preview {
    TryPremiumView()
}
