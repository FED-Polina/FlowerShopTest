using flowerShop;
using flowerShop.Classes;
using flowerShop.Model;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;

namespace UnitTestProject
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        
        public void CalcTotalSummma_ValidInput_ReturnsCorrectTotal() //расчет суммы заказа по номеру заказа
        {
            // Arrange
            var orderExtended = new OrderExtended();
            var productsInOrder = new List<flowerShop.Model.OrderProduct>
            {
                new flowerShop.Model.OrderProduct { OrderID = 1, Product = new flowerShop.Model.Product { ProductCost = 10 }, ProductCount = 2 },
                new flowerShop.Model.OrderProduct { OrderID = 1, Product = new flowerShop.Model.Product { ProductCost = 20 }, ProductCount = 3 }
            };
            orderExtended.Order = new flowerShop.Model.Order { OrderID = 1 };

            // Act
            var result = orderExtended.CalcTotalSummma(productsInOrder);

            // Assert
            Assert.AreEqual(80, result);
        }

        [TestMethod]
        public void CalcTotalDiscount_ValidInput_ReturnsCorrectTotalDiscount() //расчет суммарной скидки заказа по номеру заказа
        {
            // Arrange
            var orderExtended = new OrderExtended();
            var productsInOrder = new List<flowerShop.Model.OrderProduct>
            {
                new flowerShop.Model.OrderProduct { OrderID = 1, Product = new flowerShop.Model.Product { ProductCost = 100, ProductDiscount = 10 }, ProductCount = 2 },
                new flowerShop.Model.OrderProduct { OrderID = 1, Product = new flowerShop.Model.Product { ProductCost = 200, ProductDiscount = 20 }, ProductCount = 3 }
            };
            orderExtended.Order = new flowerShop.Model.Order { OrderID = 1 };

            // Act
            var result = orderExtended.CalcTotalDiscount(productsInOrder);

            // Assert
            Assert.AreEqual(140, result);
        }

        [TestMethod]
        public void authomaticCreateProductBarcode() //автоматическое создание штрихкода для товара
        {
            // Arrange
            var newProduct = new flowerShop.Model.Product();
            newProduct.ProductArticle = "Article";
            newProduct.ProductName = "Name";
            newProduct.ProductUnit = 1;
            newProduct.ProductCost = 100;
            newProduct.ProductDiscount = 10;
            newProduct.ProductDiscountMax = 10;
            newProduct.ProductManufacturer = 1;
            newProduct.ProductProvider = 1;
            newProduct.ProductCategory = 1;
            newProduct.ProductCount = 10;
            newProduct.ProductDiscription = "Description";
            newProduct.ProductPhoto = "photo";

            var productExtended = new ProductExtended(newProduct);

            // Act

            var result = productExtended.ProductBarcode;
            

            // Assert
            Assert.AreNotEqual(null, result);
            
        }

        [TestMethod]
        public void filteringListWithCount() //поиск по количеству продуктов на складе >15
        {
            var newProduct = new flowerShop.Model.Product();
            newProduct.ProductArticle = "Article";
            newProduct.ProductName = "First Product";
            newProduct.ProductUnit = 1;
            newProduct.ProductCost = 100;
            newProduct.ProductDiscount = 10;
            newProduct.ProductDiscountMax = 10;
            newProduct.ProductManufacturer = 1;
            newProduct.ProductProvider = 1;
            newProduct.ProductCategory = 1;
            newProduct.ProductCount = 10;
            newProduct.ProductDiscription = "Description";
            newProduct.ProductPhoto = "photo";

            var newSecondProduct = new flowerShop.Model.Product();
            newProduct.ProductArticle = "Article";
            newProduct.ProductName = "Second Product";
            newProduct.ProductUnit = 1;
            newProduct.ProductCost = 100;
            newProduct.ProductDiscount = 10;
            newProduct.ProductDiscountMax = 10;
            newProduct.ProductManufacturer = 1;
            newProduct.ProductProvider = 1;
            newProduct.ProductCategory = 1;
            newProduct.ProductCount = 20;
            newProduct.ProductDiscription = "Description";
            newProduct.ProductPhoto = "photo";


            var nonFilteredList = new List<Product>
            {
                newProduct,
                newSecondProduct
            };

            var result = nonFilteredList.FindAll(item => item.ProductCount > 15);

            Assert.AreEqual(1, result.Count);
        }


        [TestMethod]
        public void filteringListWithName() // Поиск по цене >10
        {
            var newProduct = new flowerShop.Model.Product();
            newProduct.ProductArticle = "Article";
            newProduct.ProductName = "First";
            newProduct.ProductUnit = 1;
            newProduct.ProductCost = 100;
            newProduct.ProductDiscount = 10;
            newProduct.ProductDiscountMax = 10;
            newProduct.ProductManufacturer = 1;
            newProduct.ProductProvider = 1;
            newProduct.ProductCategory = 1;
            newProduct.ProductCount = 10;
            newProduct.ProductDiscription = "Description";
            newProduct.ProductPhoto = "photo";

            var newSecondProduct = new flowerShop.Model.Product();
            newProduct.ProductArticle = "Article";
            newProduct.ProductName = "Second";
            newProduct.ProductUnit = 1;
            newProduct.ProductCost = 100;
            newProduct.ProductDiscount = 10;
            newProduct.ProductDiscountMax = 10;
            newProduct.ProductManufacturer = 2;
            newProduct.ProductProvider = 1;
            newProduct.ProductCategory = 1;
            newProduct.ProductCount = 20;
            newProduct.ProductDiscription = "Description";
            newProduct.ProductPhoto = "photo";


            var nonFilteredList = new List<Product>
            {
                newProduct,
                newSecondProduct
            };

            var result = nonFilteredList.FindAll(item => item.ProductCost > 10);

            Assert.AreEqual(1, result.Count);
        }
    }

    

}
