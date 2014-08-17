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
