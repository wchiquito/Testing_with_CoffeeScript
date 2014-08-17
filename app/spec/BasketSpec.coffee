describe "Basket Class", ->
    test = {}

    beforeEach ->
        test.basket = new Basket()
        test.item = new Item 1, "Macbook Air", "Newer, thinner, better", 799
        test.item2 = new Item 2, "Magic Trackpad", "Better than a mouse", 50
        test.basket.add test.item2, 1
        
    it "should be able to add a new item to basket", ->
        priorCountVal = test.basket.distinctCount
        test.basket.add test.item, 1
        expect(test.basket.distinctCount).toEqual priorCountVal + 1

    it "should be able to update quantity when adding an item already in the basket", ->
        priorCountVal = test.basket.getQuantity 2
        test.basket.add test.item2, 1
        expect(test.basket.getQuantity 2).toEqual priorCountVal + 1

    describe "helper functions in the Basket class", ->
        describe "getQuantity", ->
            it "should return false if passed an id that is not in array", ->
                expect(test.basket.getQuantity 12345).toBeFalsy()
            
            it "should return false if passed an invalid argument, such as a string", ->
                expect(test.basket.getQuantity "hello!").toBeFalsy()
            
            it "should return the quantity if given a valid id", ->
                expect(test.basket.getQuantity 2).toEqual 1

        describe "itemExistsInBasket", ->
            it "should return false if item id does not exist", ->
                expect(test.basket.itemExistsInBasket 23455).toBeFalsy()

            it "should return true if item id does exist", ->
                expect(test.basket.itemExistsInBasket 2).toBeTruthy()
    
            it "should return false if given an invalid argument, such as a string", ->
                expect(test.basket.itemExistsInBasket "hello").toBeFalsy()

        describe "getItemLocation", ->
            it "should return the location of item when given valid id", ->
                expect(test.basket.getItemLocation 2).toEqual 0
            it "should return false if item doesn't exist", ->
                expect(test.basket.getItemLocation 39).toBeFalsy()
            it "should return false if given a invalid input", ->
                expect(test.basket.getItemLocation "hello").toBeFalsy()
