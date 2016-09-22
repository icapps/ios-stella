//
//  DefaultsSpec.swift
//  Stella
//
//  Created by Jelle Vandebeeck on 08/06/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Stella

class PrintsSpec: QuickSpec {
	override func spec() {

		describe("print") {
            beforeEach {
                Printer.level = .verbose
            }
			context("error") {
				it("begins with 🔥") {
                    let suffix = "error"
					expect(printError(suffix)).to(beginWith("🔥 \(suffix)"))
				}
			}

			context("action"){
				it("begins with 🎯"){
                    let action = "action"
					expect(printAction(action)).to(beginWith("🎯 \(action)"))
				}
			}

			context("breadCrumb") {
				it("begins with 🍞") {
                    let suffix = "breadCrumb"
					expect(printBreadcrumb(suffix)).to(beginWith("🍞 \(suffix)"))
				}
			}

			context("question") {
				it("begins with ❓") {
                    let suffix = "question"
					expect(printQuestion(suffix)).to(beginWith("❓ \(suffix)"))
				}
			}
		}

        describe("PrintLevel") {
            context("quiet") {
                beforeEach {
                    Printer.level = .quiet
                }
                context("should print") {
                    it("🔥") {
                        expect(printError("")).toNot(beNil())
                    }

                    it("🎯") {
                        expect(printAction("")).toNot(beNil())
                    }
                }

                context("should not print") {


                    it("❓") {
                        expect(printQuestion("")).to(beNil())
                    }

                    it("🍞") {
                        expect(printBreadcrumb("")).to(beNil())
                    }
                }
            }

            context("verbose") {
                beforeEach {
                    Printer.level = .verbose
                }
                context("should print") {
                    it("🔥") {
                        expect(printError("")).toNot(beNil())
                    }

                    it("🎯") {
                        expect(printAction("")).toNot(beNil())
                    }

                    it("❓") {
                        expect(printQuestion("")).toNot(beNil())
                    }

                    it("🍞") {
                        expect(printBreadcrumb("")).toNot(beNil())
                    }
                }
            }

            context("error") {
                beforeEach {
                    Printer.level = .error
                }
                context("should print") {
                    it("🔥") {
                        expect(printError("")).toNot(beNil())
                    }
                }

                context("should not print") {
                    it("🎯") {
                        expect(printAction("")).to(beNil())
                    }

                    it("❓") {
                        expect(printQuestion("")).to(beNil())
                    }

                    it("🍞") {
                        expect(printBreadcrumb("")).to(beNil())
                    }
                }
            }
            context("nothing") {
                beforeEach {
                    Printer.level = .nothing
                }
                context("should not print") {
                    it("🔥") {
                        expect(printError("")).to(beNil())
                    }

                    it("🎯") {
                        expect(printAction("")).to(beNil())
                    }

                    it("❓") {
                        expect(printQuestion("")).to(beNil())
                    }

                    it("🍞") {
                        expect(printBreadcrumb("")).to(beNil())
                    }
                }
            }
        }

	}
}
